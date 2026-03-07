"""
Hospital Website Scraper for Maldives Healthcare
Scrapes doctor profiles from major hospital websites
"""

import time
import json
import logging
import re
import os
from typing import List, Dict, Optional
from dataclasses import dataclass, asdict, field
from urllib.parse import urljoin

import requests
from bs4 import BeautifulSoup
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.chrome.service import Service as ChromeService
from selenium.webdriver.chrome.options import Options
from selenium.common.exceptions import TimeoutException, NoSuchElementException
from webdriver_manager.chrome import ChromeDriverManager
from fake_useragent import UserAgent

# Ensure logs directory exists
os.makedirs('logs', exist_ok=True)

# Configure logging
logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - %(name)s - %(levelname)s - %(message)s',
    handlers=[
        logging.FileHandler('logs/website_scraper.log'),
        logging.StreamHandler()
    ]
)
logger = logging.getLogger(__name__)


@dataclass
class DoctorProfile:
    """Data class for doctor information from hospital websites"""
    doctor_name: str = ""
    specialty: str = ""
    qualification: str = ""
    clinic: str = ""
    hospital: str = ""
    consultation_hours: str = ""
    profile_image: str = ""
    phone_number: str = ""
    email: str = ""
    biography: str = ""
    source_url: str = ""
    source: str = "hospital_website"


class HospitalWebsiteScraper:
    """Scraper for major Maldives hospital websites"""
    
    HOSPITALS = {
        'adk': {
            'name': 'ADK Hospital',
            'base_url': 'https://www.adkhospital.mv',
            'doctors_url': 'https://www.adkhospital.mv/en/department/anesthesia',
            'department_urls': [
                'https://www.adkhospital.mv/en/department/anesthesia',
                'https://www.adkhospital.mv/en/department/cardiology',
                'https://www.adkhospital.mv/en/department/cardiothoracic-vascular-surgery',
                'https://www.adkhospital.mv/en/department/community-medicine',
                'https://www.adkhospital.mv/en/department/dentistry',
                'https://www.adkhospital.mv/en/department/dermatology',
                'https://www.adkhospital.mv/en/department/emergency-medicine',
                'https://www.adkhospital.mv/en/department/ent',
                'https://www.adkhospital.mv/en/department/gastroenterology',
                'https://www.adkhospital.mv/en/department/general-surgery',
                'https://www.adkhospital.mv/en/department/gynecology',
                'https://www.adkhospital.mv/en/department/internal-medicine',
                'https://www.adkhospital.mv/en/department/nephrology',
                'https://www.adkhospital.mv/en/department/neurosurgery',
                'https://www.adkhospital.mv/en/department/orthopedics',
                'https://www.adkhospital.mv/en/department/pediatrics',
                'https://www.adkhospital.mv/en/department/plastic-surgery',
                'https://www.adkhospital.mv/en/department/radiology',
                'https://www.adkhospital.mv/en/department/urology'
            ],
            'selectors': {
                'doctor_card': '.doctor-item, .team-item, .doctor-card, .profile-box, .doctor, .staff-card, article, .elementor-widget-container, .jet-listing-grid__item, .team-grid-item, .doctor-profile, .department-card, .doctor-list-item, .medical-team-item',
                'name': 'h1, h2, h3, h4, h5, .doctor-name, .name, .title, .entry-title, strong, .doctor-title, .physician-name',
                'specialty': '.specialty, .department, .doctor-specialty, .position, .designation, .elementor-widget-container p, .doctor-department, .department-name',
                'qualification': '.qualification, .doctor-qualification, .degrees, .elementor-widget-container h4, .subtitle, .doctor-degrees, .physician-qualification',
                'image': 'img, .doctor-image img, .profile-image img, .team-image img, .physician-photo',
                'link': 'a, .doctor-link, .entry-title a, .team-link, .physician-link'
            }
        },
        'treetop': {
            'name': 'Treetop Hospital',
            'base_url': 'https://treetophospital.com',
            'doctors_url': 'https://treetophospital.com/our-care-team/',
            'selectors': {
                'doctor_card': '.jet-listing-grid__item, .doctor-card, article, .team-member, .profile-box',
                'name': 'h2, h3, h4, .doctor-name, .entry-title, .name, strong',
                'specialty': '.specialty, .department, .doctor-specialty, .position',
                'qualification': '.qualification, .doctor-qualification, .degrees, h4',
                'image': 'img',
                'link': 'a, .doctor-link'
            }
        },
        'medica': {
            'name': 'Medica Hospital',
            'base_url': 'https://medica.com.mv',
            'doctors_url': 'https://medica.com.mv',
            'selectors': {
                'doctor_card': '.doctor-item, .team-item, .doctor-card, article, .profile-box, .doctor',
                'name': 'h2, h3, h4, .doctor-name, .name, .title',
                'specialty': '.specialty, .department, .doctor-specialty, .position, .designation',
                'qualification': '.qualification, .doctor-qualification, .degrees',
                'image': 'img',
                'link': 'a'
            }
        },
        'amdc': {
            'name': 'AMDC',
            'base_url': 'https://amdc.com.mv',
            'doctors_url': 'https://amdc.com.mv/our-doctors/',
            'selectors': {
                'doctor_card': '.doctor-item, .team-item, .doctor-card, .profile-box, .doctor, .staff-card, article, .jet-listing-grid__item, .elementor-widget-container, .team-member, .doctor-list-item',
                'name': 'h1, h2, h3, h4, h5, .doctor-name, .name, .title, .entry-title, strong, .doctor-title',
                'specialty': '.specialty, .department, .doctor-specialty, .position, .designation',
                'qualification': '.qualification, .doctor-qualification, .degrees',
                'image': 'img, .doctor-image img, .profile-image img',
                'link': 'a, .doctor-link, .entry-title a'
            }
        },
        'igmh': {
            'name': 'IGMH',
            'base_url': 'https://www.igmh.gov.mv',
            'doctors_url': 'https://www.igmh.gov.mv/doctors-2/',
            'selectors': {
                'doctor_card': '.team-item, .doctor-item, .doctor-card, .profile-box, .doctor, .staff-card, article, .jet-listing-grid__item, .elementor-widget-container, .doctor-list-item, .physician-card, .doctor-profile, .medical-team-item',
                'name': 'h1, h2, h3, h4, h5, .doctor-name, .name, .title, .entry-title, strong, .physician-name, .doctor-title',
                'specialty': '.specialty, .department, .doctor-specialty, .position, .designation, .elementor-widget-container p, .physician-specialty, .doctor-department',
                'qualification': '.qualification, .doctor-qualification, .degrees, .elementor-widget-container h4, .physician-qualification, .doctor-degrees',
                'image': 'img, .doctor-image img, .profile-image img, .physician-photo, .doctor-photo',
                'link': 'a, .doctor-link, .entry-title a, .physician-link, .team-link'
            }
        }
    }
    
    def __init__(self, headless: bool = True, delay: float = 1.5):
        self.headless = headless
        self.delay = delay
        self.driver = None
        self.session = requests.Session()
        self.results: List[DoctorProfile] = []
        self.seen_doctors: set = set()
        
        # Setup requests session with headers
        ua = UserAgent()
        self.session.headers.update({
            'User-Agent': ua.random,
            'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8',
            'Accept-Language': 'en-US,en;q=0.5',
            'Accept-Encoding': 'gzip, deflate, br',
            'DNT': '1',
            'Connection': 'keep-alive',
            'Upgrade-Insecure-Requests': '1'
        })
    
    def _setup_driver(self) -> Optional[webdriver.Chrome]:
        """Initialize and configure Chrome WebDriver"""
        try:
            chrome_options = Options()
            
            if self.headless:
                chrome_options.add_argument('--headless=new')
            
            chrome_options.add_argument('--no-sandbox')
            chrome_options.add_argument('--disable-dev-shm-usage')
            chrome_options.add_argument('--disable-gpu')
            chrome_options.add_argument('--window-size=1920,1080')
            
            ua = UserAgent()
            chrome_options.add_argument(f'--user-agent={ua.random}')
            
            service = ChromeService(ChromeDriverManager().install())
            driver = webdriver.Chrome(service=service, options=chrome_options)
            
            logger.info("Chrome WebDriver initialized for website scraping")
            return driver
            
        except Exception as e:
            logger.error(f"Failed to initialize WebDriver: {e}")
            return None
    
    def _fetch_with_requests(self, url: str) -> Optional[BeautifulSoup]:
        """Fetch page using requests library"""
        try:
            logger.info(f"Fetching with requests: {url}")
            response = self.session.get(url, timeout=30)
            response.raise_for_status()
            time.sleep(self.delay)
            return BeautifulSoup(response.content, 'lxml')
        except Exception as e:
            logger.error(f"Error fetching {url} with requests: {e}")
            return None
    
    def _fetch_with_selenium(self, url: str) -> Optional[BeautifulSoup]:
        """Fetch page using Selenium for JavaScript-rendered content"""
        if not self.driver:
            self.driver = self._setup_driver()
        
        if not self.driver:
            return None
        
        try:
            logger.info(f"Fetching with Selenium: {url}")
            self.driver.get(url)
            
            # Wait for page to load
            WebDriverWait(self.driver, 10).until(
                EC.presence_of_element_located((By.TAG_NAME, 'body'))
            )
            
            # Additional wait for dynamic content
            time.sleep(3)
            
            # Scroll to load lazy content
            self._scroll_page()
            
            soup = BeautifulSoup(self.driver.page_source, 'lxml')
            time.sleep(self.delay)
            return soup
            
        except Exception as e:
            logger.error(f"Error fetching {url} with Selenium: {e}")
            return None
    
    def _scroll_page(self):
        """Scroll page to load lazy content"""
        try:
            last_height = self.driver.execute_script(
                "return document.body.scrollHeight"
            )
            
            for _ in range(3):
                self.driver.execute_script(
                    "window.scrollTo(0, document.body.scrollHeight);"
                )
                time.sleep(1)
                
                new_height = self.driver.execute_script(
                    "return document.body.scrollHeight"
                )
                
                if new_height == last_height:
                    break
                last_height = new_height
                    
        except Exception as e:
            logger.debug(f"Scroll error: {e}")
    
    def _extract_doctor_profile(
        self, 
        card: BeautifulSoup, 
        selectors: Dict,
        hospital_name: str,
        base_url: str
    ) -> Optional[DoctorProfile]:
        """Extract doctor information from a card element"""
        try:
            profile = DoctorProfile(hospital=hospital_name)
            
            # Extract name
            name_elem = card.select_one(selectors['name'])
            if name_elem:
                profile.doctor_name = name_elem.get_text(strip=True)
            
            if not profile.doctor_name:
                # Try to find name in any heading or strong text
                for tag in ['h1', 'h2', 'h3', 'h4', 'h5', 'strong', '.name']:
                    elem = card.select_one(tag)
                    if elem:
                        profile.doctor_name = elem.get_text(strip=True)
                        if profile.doctor_name:
                            break
            
            if not profile.doctor_name:
                return None
            
            # Validate that this is actually a doctor name, not a service/department
            doctor_name = profile.doctor_name.strip()
            
            # Skip if it's just a specialty/service name
            service_keywords = [
                'cardiology', 'dental', 'dermatology', 'dietetics', 'ent', 'gynecology',
                'surgery', 'internal medicine', 'neurology', 'orthopedic', 'ophthalmology',
                'plastic surgery', 'pediatric', 'physiotherapy', 'radiology', 'urology',
                'geriatrics', 'general consultation', 'testimonial', 'please find',
                'advertisement', 'vacancy', 'job', 'career', 'screening'
            ]
            
            lower_name = doctor_name.lower()
            if any(keyword in lower_name for keyword in service_keywords):
                logger.debug(f"Skipping non-doctor entry: {doctor_name}")
                return None
            
            # Must contain doctor title or look like a proper name
            has_doctor_title = any(title in lower_name for title in ['dr.', 'dr ', 'doctor'])
            
            # If no doctor title, check if it looks like a proper person name (at least 2 words)
            if not has_doctor_title:
                words = doctor_name.split()
                # Must have at least 2 words and not be a service
                if len(words) < 2 or len(words) > 8:
                    logger.debug(f"Skipping invalid name: {doctor_name}")
                    return None
            
            # Check for duplicates
            doctor_key = f"{hospital_name}_{doctor_name}"
            if doctor_key in self.seen_doctors:
                return None
            
            self.seen_doctors.add(doctor_key)
            
            # Extract specialty
            specialty_elem = card.select_one(selectors['specialty'])
            if specialty_elem:
                profile.specialty = specialty_elem.get_text(strip=True)
            else:
                # Try to infer specialty from text
                text = card.get_text()
                specialties = [
                    'Cardiology', 'Dermatology', 'Pediatrics', 'Orthopedics',
                    'Gynecology', 'Obstetrics', 'Neurology', 'Psychiatry',
                    'ENT', 'Ophthalmology', 'Dentistry', 'General Medicine',
                    'Surgery', 'Radiology', 'Pathology', 'Anesthesiology',
                    'Urology', 'Nephrology', 'Gastroenterology', 'Pulmonology',
                    'Endocrinology', 'Oncology', 'Hematology', 'Rheumatology',
                    'Allergy', 'Immunology', 'Infectious Disease', 'Emergency'
                ]
                for spec in specialties:
                    if spec.lower() in text.lower():
                        profile.specialty = spec
                        break
            
            # Extract qualification
            qual_elem = card.select_one(selectors['qualification'])
            if qual_elem:
                profile.qualification = qual_elem.get_text(strip=True)
            else:
                # Try to find qualifications (usually has MBBS, MD, etc.)
                text = card.get_text()
                qual_patterns = [
                    r'(MBBS[^.\n]*)',
                    r'(MD[^.\n]*)',
                    r'(MS[^.\n]*)',
                    r'(DNB[^.\n]*)',
                    r'(FCPS[^.\n]*)',
                    r'(PhD[^.\n]*)',
                    r'(MRC[SP][^\n]*)',
                    r'(FRCS[^\n]*)',
                    r'(MRCP[^\n]*)'
                ]
                qualifications = []
                for pattern in qual_patterns:
                    matches = re.findall(pattern, text, re.IGNORECASE)
                    qualifications.extend(matches)
                if qualifications:
                    profile.qualification = ', '.join(qualifications[:3])
            
            # Extract image
            img_elem = card.select_one(selectors['image'])
            if img_elem:
                img_src = img_elem.get('src') or img_elem.get('data-src')
                if img_src:
                    profile.profile_image = urljoin(base_url, img_src)
            
            # Extract link
            link_elem = card.select_one(selectors['link'])
            if link_elem:
                href = link_elem.get('href')
                if href:
                    profile.source_url = urljoin(base_url, href)
            
            # Mark as seen
            self.seen_doctors.add(doctor_key)
            
            logger.info(f"Extracted doctor profile: {profile.doctor_name} from {hospital_name}")
            return profile
            
        except Exception as e:
            logger.error(f"Error extracting doctor profile: {e}")
            return None
    
    def _scrape_doctor_detail_page(self, profile: DoctorProfile) -> DoctorProfile:
        """Scrape additional details from doctor's profile page"""
        if not profile.source_url:
            return profile
        
        try:
            logger.info(f"Scraping detail page: {profile.source_url}")
            
            # Try with requests first
            soup = self._fetch_with_requests(profile.source_url)
            if not soup:
                soup = self._fetch_with_selenium(profile.source_url)
            
            if not soup:
                return profile
            
            # Extract consultation hours
            hours_selectors = [
                '.consultation-hours', '.schedule', '.availability',
                '.clinic-hours', '.opd-time', '.consulting-time',
                '*:contains("Consultation")', '*:contains("OPD")',
                '*:contains("Clinic Hours")'
            ]
            
            for selector in hours_selectors:
                try:
                    if ':' in selector:
                        # Text-based search
                        elem = soup.find(string=re.compile(selector.replace('*:contains("', '').replace('")', ''), re.I))
                        if elem:
                            parent = elem.parent
                            if parent:
                                profile.consultation_hours = parent.get_text(strip=True)
                                break
                    else:
                        elem = soup.select_one(selector)
                        if elem:
                            profile.consultation_hours = elem.get_text(strip=True)
                            break
                except:
                    continue
            
            # Extract phone
            phone_patterns = [
                r'[+]960\s*\d{3}\s*\d{4}',
                r'[+]960\d{7}',
                r'\d{3}-\d{4}',
                r'Tel[:\s]+([\d\-+\s()]+)',
                r'Phone[:\s]+([\d\-+\s()]+)',
                r'Contact[:\s]+([\d\-+\s()]+)'
            ]
            
            text = soup.get_text()
            for pattern in phone_patterns:
                matches = re.findall(pattern, text)
                if matches:
                    profile.phone_number = matches[0].strip()
                    break
            
            # Extract email
            email_pattern = r'[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}'
            emails = re.findall(email_pattern, text)
            if emails:
                profile.email = emails[0]
            
            # Extract biography
            bio_selectors = [
                '.biography', '.about', '.profile-content',
                '.description', '.doctor-info'
            ]
            
            for selector in bio_selectors:
                elem = soup.select_one(selector)
                if elem:
                    bio_text = elem.get_text(strip=True)
                    if len(bio_text) > 50:
                        profile.biography = bio_text[:500]
                        break
            
            # Better image extraction
            img_selectors = [
                '.doctor-image img', '.profile-image img',
                '.doctor-photo img', 'img[alt*="doctor" i]',
                'img[alt*="Dr"]', '.team-detail img'
            ]
            
            for selector in img_selectors:
                img = soup.select_one(selector)
                if img:
                    src = img.get('src') or img.get('data-src')
                    if src:
                        profile.profile_image = urljoin(profile.source_url, src)
                        break
            
        except Exception as e:
            logger.error(f"Error scraping detail page: {e}")
        
        return profile
    
    def scrape_hospital(self, hospital_key: str) -> List[DoctorProfile]:
        """Scrape doctors from a specific hospital"""
        hospital = self.HOSPITALS.get(hospital_key)
        if not hospital:
            logger.error(f"Unknown hospital: {hospital_key}")
            return []
        
        doctors = []
        
        try:
            logger.info(f"Scraping {hospital['name']}...")
            
            # Try requests first, then Selenium
            soup = self._fetch_with_requests(hospital['doctors_url'])
            if not soup:
                soup = self._fetch_with_selenium(hospital['doctors_url'])
            
            if not soup:
                logger.error(f"Could not fetch {hospital['doctors_url']}")
                return []
            
            # Define selectors to try for finding doctor cards
            selectors_to_try = [
                hospital['selectors']['doctor_card'],
                'article', '.post', '.entry', '.card', '.profile', '.team-member',
                '.elementor-widget-container', '.jet-listing-grid__item',
                '[class*="doctor"]', '[class*="team"]', '[class*="profile"]'
            ]
            
            # Special handling for ADK Hospital - find employee links on department pages
            if hospital_key == 'adk':
                logger.info("Using employee page scraping for ADK Hospital")
                department_urls = hospital.get('department_urls', [])
                
                logger.info(f"Found {len(department_urls)} department pages to check for employees")
                
                # First, collect all employee links from department pages
                employee_links = []
                for dept_url in department_urls[:10]:  # Limit to 10 departments
                    try:
                        logger.info(f"Checking department for employees: {dept_url}")
                        dept_soup = self._fetch_with_requests(dept_url)
                        if not dept_soup:
                            dept_soup = self._fetch_with_selenium(dept_url)
                        
                        if not dept_soup:
                            continue
                        
                        # Find all employee links on this department page
                        all_links = dept_soup.find_all('a', href=True)
                        for link in all_links:
                            href = link.get('href', '')
                            if '/en/employee/' in href:
                                full_url = urljoin(hospital['base_url'], href)
                                if full_url not in employee_links:
                                    employee_links.append(full_url)
                                    logger.info(f"Found employee link: {full_url}")
                        
                        time.sleep(1)  # Brief pause
                        
                    except Exception as e:
                        logger.warning(f"Error checking department {dept_url}: {e}")
                        continue
                
                logger.info(f"Total employee links found: {len(employee_links)}")
                
                # Scrape each employee page
                for emp_url in employee_links[:30]:  # Limit to 30 employees
                    try:
                        logger.info(f"Scraping employee page: {emp_url}")
                        
                        # Use Selenium for ADK employee pages (they need JavaScript)
                        if self.driver:
                            try:
                                self.driver.get(emp_url)
                                time.sleep(3)  # Wait for JavaScript to load
                                html = self.driver.page_source
                                emp_soup = BeautifulSoup(html, 'lxml')
                            except Exception as e:
                                logger.warning(f"Selenium failed for {emp_url}: {e}")
                                emp_soup = None
                        else:
                            emp_soup = None
                        
                        if not emp_soup:
                            continue
                        
                        # Extract doctor info from employee page
                        profile = DoctorProfile(hospital=hospital['name'], source_url=emp_url)
                        
                        # Try multiple selectors for name - ADK uses dynamic content
                        name_selectors = ['h1', '.employee-name', '.doctor-name', '.name', '.title', '[class*="name"]', '[class*="title"]']
                        name_elem = None
                        for selector in name_selectors:
                            name_elem = emp_soup.select_one(selector)
                            if name_elem and name_elem.get_text(strip=True):
                                break
                        
                        if name_elem:
                            profile.doctor_name = name_elem.get_text(strip=True)
                            logger.info(f"Found name from element: {profile.doctor_name}")
                        else:
                            # Try from page title
                            title = emp_soup.find('title')
                            if title:
                                profile.doctor_name = title.get_text(strip=True).replace(' - ADK Hospital', '').replace(' | ADK Hospital', '')
                                logger.info(f"Found name from title: {profile.doctor_name}")
                        
                        if not profile.doctor_name:
                            logger.warning(f"No name found for {emp_url}")
                            continue
                        
                        # Validate it's a doctor name
                        doctor_name = profile.doctor_name.strip()
                        has_doctor_title = any(title in doctor_name.lower() for title in ['dr.', 'dr ', 'doctor'])
                        logger.info(f"Validating: '{doctor_name}' - has_doctor_title={has_doctor_title}, words={len(doctor_name.split())}")
                        
                        if not has_doctor_title and len(doctor_name.split()) < 2:
                            logger.debug(f"Skipping invalid name: {doctor_name}")
                            continue
                        
                        # Check for duplicates
                        doctor_key = f"{hospital['name']}_{doctor_name}"
                        if doctor_key in self.seen_doctors:
                            continue
                        self.seen_doctors.add(doctor_key)
                        
                        # Try to find specialty
                        specialty_elem = emp_soup.select_one('.specialty, .department, .position, .designation')
                        if specialty_elem:
                            profile.specialty = specialty_elem.get_text(strip=True)
                        else:
                            # Infer from URL department
                            for dept in ['anesthesia', 'cardiology', 'dentistry', 'dermatology', 'ent', 'gynecology', 'orthopedics', 'pediatrics', 'surgery']:
                                if dept in emp_url.lower():
                                    profile.specialty = dept.title()
                                    break
                        
                        # Try to find image
                        img_elem = emp_soup.select_one('img.profile-image, img.employee-image, .doctor-image img, img')
                        if img_elem:
                            img_src = img_elem.get('src') or img_elem.get('data-src')
                            if img_src:
                                profile.profile_image = urljoin(emp_url, img_src)
                        
                        doctors.append(profile)
                        logger.info(f"Added ADK doctor: {profile.doctor_name} ({profile.specialty or 'No specialty'})")
                        
                        time.sleep(2)  # Pause between employees
                        
                    except Exception as e:
                        logger.warning(f"Error scraping employee {emp_url}: {e}")
                        continue
                
                logger.info(f"Successfully scraped {len(doctors)} doctors from ADK Hospital")
                return doctors
            
            # For other hospitals, use standard scraping approach
            doctor_cards = []
            
            for selector in selectors_to_try:
                cards = soup.select(selector)
                if cards:
                    doctor_cards = cards
                    logger.info(f"Found {len(cards)} cards with selector: {selector}")
                    break
            
            if not doctor_cards:
                logger.warning(f"No doctor cards found for {hospital['name']}")
                # Try to find any links that might be doctor profiles
                all_links = soup.find_all('a', href=True)
                doctor_links = [
                    link for link in all_links 
                    if any(keyword in link.get('href', '').lower() for keyword in ['doctor', 'team', 'staff', 'physician', 'dr-'])
                ]
                if doctor_links:
                    logger.info(f"Found {len(doctor_links)} potential doctor links")
                    # Process each link as a potential doctor
                    for link in doctor_links[:20]:  # Limit to 20
                        try:
                            profile = DoctorProfile(hospital=hospital['name'])
                            name = link.get_text(strip=True)
                            if name and len(name) > 2 and not name.lower().startswith('http'):
                                profile.doctor_name = name
                                profile.source_url = urljoin(hospital['base_url'], link['href'])
                                # Try to get details
                                profile = self._scrape_doctor_detail_page(profile)
                                if profile.doctor_name:
                                    doctor_key = f"{hospital['name']}_{profile.doctor_name}"
                                    if doctor_key not in self.seen_doctors:
                                        self.seen_doctors.add(doctor_key)
                                        doctors.append(profile)
                                        logger.info(f"Added doctor from link: {profile.doctor_name}")
                        except Exception as e:
                            continue
                return doctors
            
            for card in doctor_cards:
                try:
                    profile = self._extract_doctor_profile(
                        card, 
                        hospital['selectors'],
                        hospital['name'],
                        hospital['base_url']
                    )
                    
                    if profile:
                        # Try to get more details from profile page
                        if profile.source_url:
                            profile = self._scrape_doctor_detail_page(profile)
                        
                        doctors.append(profile)
                        logger.info(f"Added doctor: {profile.doctor_name}")
                        
                except Exception as e:
                    logger.warning(f"Error processing doctor card: {e}")
                    continue
            
            logger.info(f"Successfully scraped {len(doctors)} doctors from {hospital['name']}")
            
        except Exception as e:
            logger.error(f"Error scraping {hospital['name']}: {e}")
        
        return doctors
    
    def run(self, hospitals: Optional[List[str]] = None) -> List[DoctorProfile]:
        """Run scraper for specified hospitals or all"""
        if not hospitals:
            hospitals = list(self.HOSPITALS.keys())
        
        logger.info(f"Starting website scraper for {len(hospitals)} hospitals")
        
        try:
            self.driver = self._setup_driver()
            
            for hospital_key in hospitals:
                try:
                    doctors = self.scrape_hospital(hospital_key)
                    self.results.extend(doctors)
                    
                    # Pause between hospitals
                    time.sleep(3)
                    
                except Exception as e:
                    logger.error(f"Error scraping hospital {hospital_key}: {e}")
                    continue
            
            logger.info(f"Website scraping completed. Total doctors: {len(self.results)}")
            
        finally:
            if self.driver:
                self.driver.quit()
                logger.info("Browser closed")
        
        return self.results
    
    def get_results_as_dict(self) -> List[Dict]:
        """Convert results to list of dictionaries"""
        return [asdict(d) for d in self.results]


class GenericWebsiteScraper:
    """Generic scraper for other healthcare websites"""
    
    def __init__(self):
        self.session = requests.Session()
        ua = UserAgent()
        self.session.headers.update({
            'User-Agent': ua.random,
            'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8',
        })
    
    def scrape_page(self, url: str) -> Dict:
        """Scrape generic information from a webpage"""
        try:
            response = self.session.get(url, timeout=30)
            soup = BeautifulSoup(response.content, 'lxml')
            
            data = {
                'url': url,
                'title': '',
                'content': ''
            }
            
            title = soup.find('title')
            if title:
                data['title'] = title.get_text(strip=True)
            
            # Extract main content
            for tag in ['main', 'article', '[role="main"]', '.content', '#content']:
                content = soup.select_one(tag)
                if content:
                    data['content'] = content.get_text(separator='\n', strip=True)[:2000]
                    break
            
            return data
            
        except Exception as e:
            logger.error(f"Error scraping {url}: {e}")
            return {}


if __name__ == "__main__":
    scraper = HospitalWebsiteScraper(headless=False)
    results = scraper.run()
    
    if results:
        with open('data/website_results.json', 'w', encoding='utf-8') as f:
            json.dump(scraper.get_results_as_dict(), f, indent=2, ensure_ascii=False)
        
        print(f"Scraped {len(results)} doctor profiles")
    else:
        print("No results found")
