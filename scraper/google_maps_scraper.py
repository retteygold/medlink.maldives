"""
Google Maps Scraper for Healthcare Facilities in Maldives
Scrapes clinics, hospitals, and doctors from Google Maps
"""

import time
import json
import logging
import re
import os
from typing import List, Dict, Optional
from dataclasses import dataclass, asdict
from urllib.parse import quote_plus

from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.chrome.service import Service as ChromeService
from selenium.webdriver.chrome.options import Options
from selenium.common.exceptions import (
    TimeoutException, NoSuchElementException, 
    ElementNotInteractableException, WebDriverException
)
from webdriver_manager.chrome import ChromeDriverManager
from fake_useragent import UserAgent

# Ensure logs directory exists
os.makedirs('logs', exist_ok=True)

# Configure logging
logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - %(name)s - %(levelname)s - %(message)s',
    handlers=[
        logging.FileHandler('logs/google_maps_scraper.log'),
        logging.StreamHandler()
    ]
)
logger = logging.getLogger(__name__)


@dataclass
class HealthcareFacility:
    """Data class for healthcare facility information"""
    clinic_name: str = ""
    doctor_name: str = ""
    specialty: str = ""
    address: str = ""
    city: str = ""
    phone_number: str = ""
    website: str = ""
    google_maps_link: str = ""
    latitude: str = ""
    longitude: str = ""
    opening_hours: str = ""
    rating: str = ""
    reviews_count: str = ""
    image_url: str = ""
    source: str = "google_maps"
    search_keyword: str = ""


class GoogleMapsScraper:
    """Scraper for Google Maps healthcare facilities"""
    
    SEARCH_KEYWORDS = [
        "clinic male maldives",
        "hospital male maldives",
        "doctor male maldives",
        "clinic hulhumale maldives",
        "hospital hulhumale maldives",
        "health center male maldives",
        "medical center male maldives",
        "dental clinic male maldives",
        "pharmacy male maldives",
        "specialist doctor maldives",
        "private hospital maldives",
        "medical clinic hulhumale"
    ]
    
    def __init__(self, headless: bool = True, delay: float = 2.0):
        self.headless = headless
        self.delay = delay
        self.driver = None
        self.wait = None
        self.results: List[HealthcareFacility] = []
        self.seen_names: set = set()
        
    def _setup_driver(self) -> webdriver.Chrome:
        """Initialize and configure Chrome WebDriver"""
        try:
            chrome_options = Options()
            
            if self.headless:
                chrome_options.add_argument('--headless=new')
            
            chrome_options.add_argument('--no-sandbox')
            chrome_options.add_argument('--disable-dev-shm-usage')
            chrome_options.add_argument('--disable-gpu')
            chrome_options.add_argument('--disable-blink-features=AutomationControlled')
            chrome_options.add_argument('--window-size=1920,1080')
            chrome_options.add_argument('--start-maximized')
            
            # Random user agent
            ua = UserAgent()
            chrome_options.add_argument(f'--user-agent={ua.random}')
            
            # Disable automation flags
            chrome_options.add_experimental_option('excludeSwitches', ['enable-automation'])
            chrome_options.add_experimental_option('useAutomationExtension', False)
            
            # Disable images for faster loading
            prefs = {
                'profile.managed_default_content_settings.images': 2,
                'profile.default_content_setting_values.notifications': 2
            }
            chrome_options.add_experimental_option('prefs', prefs)
            
            service = ChromeService(ChromeDriverManager().install())
            driver = webdriver.Chrome(service=service, options=chrome_options)
            driver.execute_cdp_cmd('Page.addScriptToEvaluateOnNewDocument', {
                'source': 'Object.defineProperty(navigator, "webdriver", {get: () => undefined})'
            })
            
            self.wait = WebDriverWait(driver, 15)
            logger.info("Chrome WebDriver initialized successfully")
            return driver
            
        except Exception as e:
            logger.error(f"Failed to initialize WebDriver: {e}")
            raise
    
    def start(self):
        """Start the scraper"""
        self.driver = self._setup_driver()
        
    def stop(self):
        """Stop the scraper and close browser"""
        if self.driver:
            self.driver.quit()
            logger.info("Browser closed")
    
    def _scroll_results(self, scroll_container, max_attempts: int = 50) -> int:
        """Scroll through results to load all listings"""
        last_height = self.driver.execute_script(
            "return arguments[0].scrollHeight", scroll_container
        )
        scroll_attempts = 0
        no_change_count = 0
        
        while scroll_attempts < max_attempts and no_change_count < 3:
            try:
                # Scroll down
                self.driver.execute_script(
                    "arguments[0].scrollTo(0, arguments[0].scrollHeight);", 
                    scroll_container
                )
                time.sleep(self.delay)
                
                new_height = self.driver.execute_script(
                    "return arguments[0].scrollHeight", scroll_container
                )
                
                if new_height == last_height:
                    no_change_count += 1
                else:
                    no_change_count = 0
                    
                last_height = new_height
                scroll_attempts += 1
                
                # Log progress every 10 scrolls
                if scroll_attempts % 10 == 0:
                    logger.info(f"Scrolled {scroll_attempts} times, current height: {new_height}")
                    
            except Exception as e:
                logger.warning(f"Scroll error: {e}")
                break
                
        logger.info(f"Completed scrolling after {scroll_attempts} attempts")
        return scroll_attempts
    
    def _click_element_safely(self, element) -> bool:
        """Safely click an element with retries using JavaScript if needed"""
        for attempt in range(3):
            try:
                # Scroll element into view
                self.driver.execute_script("arguments[0].scrollIntoView({block: 'center', behavior: 'smooth'});", element)
                time.sleep(0.5)
                
                # Try regular click first
                try:
                    element.click()
                    return True
                except:
                    # If regular click fails, use JavaScript click
                    self.driver.execute_script("arguments[0].click();", element)
                    return True
            except Exception as e:
                logger.warning(f"Click attempt {attempt + 1} failed: {e}")
                time.sleep(1)
        return False
    
    def _extract_coordinates_from_url(self, url: str) -> tuple:
        """Extract latitude and longitude from Google Maps URL"""
        try:
            # Pattern for coordinates in URL
            coord_patterns = [
                r'!3d(-?\d+\.\d+)!4d(-?\d+\.\d+)',
                r'@(-?\d+\.\d+),(-?\d+\.\d+)',
                r'place/[^/]+/@(-?\d+\.\d+),(-?\d+\.\d+)',
            ]
            
            for pattern in coord_patterns:
                match = re.search(pattern, url)
                if match:
                    return match.group(1), match.group(2)
            return "", ""
        except Exception as e:
            logger.error(f"Error extracting coordinates: {e}")
            return "", ""
    
    def _extract_data_from_detail_page(self, keyword: str) -> Optional[HealthcareFacility]:
        """Extract data from the detail panel"""
        try:
            facility = HealthcareFacility(search_keyword=keyword)
            
            # Wait for detail panel to load
            time.sleep(2)
            
            # Extract name
            try:
                name_elem = self.wait.until(
                    EC.presence_of_element_located((By.CSS_SELECTOR, 'h1'))
                )
                facility.clinic_name = name_elem.text.strip()
            except:
                try:
                    name_elem = self.driver.find_element(By.CSS_SELECTOR, '[role="main"] h1')
                    facility.clinic_name = name_elem.text.strip()
                except:
                    pass
            
            # Check for duplicates
            if facility.clinic_name in self.seen_names:
                logger.info(f"Skipping duplicate: {facility.clinic_name}")
                return None
            
            # Extract rating and reviews
            try:
                rating_selectors = [
                    'span[role="img"][aria-label*="star"]',
                    '.F7nice',
                    'div[role="img"] span',
                    '[data-value]'
                ]
                for selector in rating_selectors:
                    try:
                        rating_elem = self.driver.find_element(By.CSS_SELECTOR, selector)
                        rating_text = rating_elem.get_attribute('aria-label') or rating_elem.text
                        if rating_text:
                            # Extract rating number
                            rating_match = re.search(r'(\d+\.?\d*)', rating_text)
                            if rating_match:
                                facility.rating = rating_match.group(1)
                            # Extract reviews count
                            reviews_match = re.search(r'(\d+)\s*review', rating_text)
                            if reviews_match:
                                facility.reviews_count = reviews_match.group(1)
                            break
                    except:
                        continue
            except Exception as e:
                logger.debug(f"Could not extract rating: {e}")
            
            # Extract address
            try:
                address_selectors = [
                    'button[data-item-id="address"]',
                    '[data-tooltip="Copy address"]',
                    'span[aria-label*="Address"]',
                    'div[class*="address"]'
                ]
                for selector in address_selectors:
                    try:
                        addr_elem = self.driver.find_element(By.CSS_SELECTOR, selector)
                        address = addr_elem.text.strip() or addr_elem.get_attribute('aria-label')
                        if address:
                            facility.address = address.replace('Address: ', '').strip()
                            # Extract city from address
                            if 'male' in facility.address.lower():
                                facility.city = 'Male'
                            elif 'hulhumale' in facility.address.lower():
                                facility.city = 'Hulhumale'
                            break
                    except:
                        continue
            except Exception as e:
                logger.debug(f"Could not extract address: {e}")
            
            # Extract phone number
            try:
                phone_selectors = [
                    'button[data-item-id^="phone:tel:"]',
                    '[data-tooltip="Copy phone number"]',
                    'span[aria-label*="Phone"]'
                ]
                for selector in phone_selectors:
                    try:
                        phone_elem = self.driver.find_element(By.CSS_SELECTOR, selector)
                        phone = phone_elem.text.strip() or phone_elem.get_attribute('aria-label')
                        if phone:
                            facility.phone_number = phone.replace('Phone: ', '').strip()
                            break
                    except:
                        continue
            except Exception as e:
                logger.debug(f"Could not extract phone: {e}")
            
            # Extract website
            try:
                website_selectors = [
                    'a[data-item-id="authority"]',
                    '[data-tooltip="Open website"]',
                    'a[href^="http"][target="_blank"]'
                ]
                for selector in website_selectors:
                    try:
                        web_elem = self.driver.find_element(By.CSS_SELECTOR, selector)
                        website = web_elem.get_attribute('href')
                        if website and 'google.com' not in website:
                            facility.website = website
                            break
                    except:
                        continue
            except Exception as e:
                logger.debug(f"Could not extract website: {e}")
            
            # Extract opening hours
            try:
                hours_selectors = [
                    'div[aria-label*="hours"]',
                    'button[data-item-id="oh"]',
                    'span:contains("Open")',
                    'span:contains("Closed")'
                ]
                hours_text = []
                for selector in hours_selectors:
                    try:
                        hours_elems = self.driver.find_elements(By.CSS_SELECTOR, selector)
                        for elem in hours_elems:
                            text = elem.text.strip()
                            if text and len(text) > 3:
                                hours_text.append(text)
                        if hours_text:
                            facility.opening_hours = '; '.join(hours_text[:3])
                            break
                    except:
                        continue
            except Exception as e:
                logger.debug(f"Could not extract hours: {e}")
            
            # Get current URL for Google Maps link
            try:
                facility.google_maps_link = self.driver.current_url
                facility.latitude, facility.longitude = self._extract_coordinates_from_url(
                    facility.google_maps_link
                )
            except Exception as e:
                logger.debug(f"Could not extract URL/coordinates: {e}")
            
            # Extract image
            try:
                img_selectors = [
                    'img[class*="image"][decoding="async"]',
                    'button[jsaction*="pane"] img',
                    '[role="main"] img[src*="googleusercontent"]'
                ]
                for selector in img_selectors:
                    try:
                        img_elem = self.driver.find_element(By.CSS_SELECTOR, selector)
                        img_url = img_elem.get_attribute('src')
                        if img_url and 'googleusercontent' in img_url:
                            facility.image_url = img_url
                            break
                    except:
                        continue
            except Exception as e:
                logger.debug(f"Could not extract image: {e}")
            
            # Mark as seen and add to results
            if facility.clinic_name:
                self.seen_names.add(facility.clinic_name)
                logger.info(f"Extracted: {facility.clinic_name}")
                return facility
            
            return None
            
        except Exception as e:
            logger.error(f"Error extracting detail data: {e}")
            return None
    
    def search_keyword(self, keyword: str) -> List[HealthcareFacility]:
        """Search for a keyword and extract all results"""
        facilities = []
        
        try:
            logger.info(f"Searching for: {keyword}")
            
            # Navigate to Google Maps
            encoded_keyword = quote_plus(keyword)
            search_url = f"https://www.google.com/maps/search/{encoded_keyword}"
            self.driver.get(search_url)
            
            # Wait for page to load
            time.sleep(5)
            
            # Try to accept cookies if present
            try:
                cookie_buttons = self.driver.find_elements(
                    By.CSS_SELECTOR, 
                    'button[aria-label*="Accept"], button:contains("Accept"), button:contains("I agree")'
                )
                for btn in cookie_buttons:
                    if btn.is_displayed():
                        btn.click()
                        time.sleep(2)
                        break
            except:
                pass
            
            # Wait for results container - try multiple selectors
            results_container = None
            container_selectors = [
                'div[role="feed"]',
                '[data-testid="search-results-feed"]',
                'div.m6QErb[role="main"]',
                'div.m6QErb.DxyBCb.kA9KIf.dS8AEf',
                'div[role="main"] > div > div > div',
                '.section-scrollbox',
                'div[aria-label][role="feed"]'
            ]
            
            for selector in container_selectors:
                try:
                    results_container = self.wait.until(
                        EC.presence_of_element_located((By.CSS_SELECTOR, selector))
                    )
                    logger.info(f"Found results container with selector: {selector}")
                    break
                except:
                    continue
            
            if not results_container:
                logger.error("Could not find results container with any selector")
                return facilities
            
            # Scroll to load all results
            self._scroll_results(results_container, max_attempts=30)
            
            # Find all result cards - try multiple selector strategies
            result_cards = []
            card_selectors = [
                'div[role="feed"] > div[data-result-index]',
                'div[role="feed"] > div > div',
                'a[href*="/maps/place/"]',
                'div[data-testid="place-card"]',
                'div.V0h1Ob',
                'div[jsaction*="mouseover"]',
                'div[role="article"]',
                '.section-result-content',
                'div[aria-label] > div'
            ]
            
            for selector in card_selectors:
                cards = self.driver.find_elements(By.CSS_SELECTOR, selector)
                if cards:
                    result_cards = cards
                    logger.info(f"Found {len(cards)} cards with selector: {selector}")
                    break
            
            # Extract data directly from list cards without clicking
            processed_names = set()
            for idx, card in enumerate(result_cards[:30]):  # Limit to 30 per keyword
                try:
                    facility = HealthcareFacility(search_keyword=keyword)
                    
                    # Extract name from aria-label or text content
                    try:
                        name = card.get_attribute('aria-label')
                        if not name:
                            # Try to find name in child elements
                            name_elem = card.find_element(By.CSS_SELECTOR, 'div.fontHeadlineSmall, span, h3, div[role="heading"]')
                            name = name_elem.text.strip() if name_elem else ''
                        facility.clinic_name = name.strip() if name else ''
                    except:
                        pass
                    
                    # Skip if no name or already processed
                    if not facility.clinic_name or facility.clinic_name in processed_names:
                        continue
                    
                    # Check for duplicates across all results
                    if facility.clinic_name in self.seen_names:
                        continue
                    
                    processed_names.add(facility.clinic_name)
                    
                    # Extract address from card text
                    try:
                        card_text = card.text
                        lines = card_text.split('\n')
                        for line in lines:
                            # Look for address indicators
                            if any(indicator in line.lower() for indicator in ['road', 'street', 'building', 'floor', 'malé', 'male', 'hulhumale', 'kaafu', 'atoll']):
                                facility.address = line.strip()
                                # Extract city
                                if 'hulhumale' in line.lower():
                                    facility.city = 'Hulhumale'
                                elif 'malé' in line.lower() or 'male' in line.lower():
                                    facility.city = 'Male'
                                break
                    except:
                        pass
                    
                    # Extract phone number
                    try:
                        card_text = card.text
                        phone_match = re.search(r'(\+?960[-\s]?\d{3}[-\s]?\d{4}|\d{3}[-\s]?\d{4})', card_text)
                        if phone_match:
                            facility.phone_number = phone_match.group(1)
                    except:
                        pass
                    
                    # Extract rating
                    try:
                        rating_elem = card.find_element(By.CSS_SELECTOR, 'span[role="img"][aria-label*="star"], span.fontBodyMedium')
                        if rating_elem:
                            rating_text = rating_elem.get_attribute('aria-label') or rating_elem.text
                            rating_match = re.search(r'(\d+\.?\d*)', rating_text)
                            if rating_match:
                                facility.rating = rating_match.group(1)
                    except:
                        pass
                    
                    # Extract website from link
                    try:
                        link_elems = card.find_elements(By.CSS_SELECTOR, 'a[href*="/maps/place/"]')
                        if link_elems:
                            facility.google_maps_link = link_elems[0].get_attribute('href')
                            # Extract coordinates
                            facility.latitude, facility.longitude = self._extract_coordinates_from_url(
                                facility.google_maps_link
                            )
                    except:
                        pass
                    
                    # Extract opening hours
                    try:
                        hours_indicators = ['Open', 'Closed', '24 hours']
                        card_text = card.text
                        for indicator in hours_indicators:
                            if indicator in card_text:
                                # Find the line with hours
                                lines = card_text.split('\n')
                                for line in lines:
                                    if indicator in line:
                                        facility.opening_hours = line.strip()
                                        break
                                break
                    except:
                        pass
                    
                    # Add to results
                    if facility.clinic_name:
                        self.seen_names.add(facility.clinic_name)
                        facilities.append(facility)
                        logger.info(f"Extracted facility: {facility.clinic_name}")
                    
                except Exception as e:
                    logger.warning(f"Error processing card {idx}: {e}")
                    continue
            
            logger.info(f"Completed search for '{keyword}': found {len(facilities)} facilities")
            
        except Exception as e:
            logger.error(f"Error searching for '{keyword}': {e}")
        
        return facilities
    
    def run(self, keywords: Optional[List[str]] = None) -> List[HealthcareFacility]:
        """Run the scraper for all keywords"""
        if not keywords:
            keywords = self.SEARCH_KEYWORDS
        
        logger.info(f"Starting Google Maps scraper with {len(keywords)} keywords")
        
        try:
            self.start()
            
            for keyword in keywords:
                try:
                    facilities = self.search_keyword(keyword)
                    self.results.extend(facilities)
                    logger.info(f"Total results so far: {len(self.results)}")
                    
                    # Pause between searches to avoid rate limiting
                    time.sleep(5)
                    
                except Exception as e:
                    logger.error(f"Error processing keyword '{keyword}': {e}")
                    continue
            
            logger.info(f"Scraping completed. Total facilities: {len(self.results)}")
            
        finally:
            self.stop()
        
        return self.results
    
    def get_results_as_dict(self) -> List[Dict]:
        """Convert results to list of dictionaries"""
        return [asdict(f) for f in self.results]


if __name__ == "__main__":
    scraper = GoogleMapsScraper(headless=False, delay=2.0)
    results = scraper.run()
    
    # Save results
    if results:
        with open('data/google_maps_results.json', 'w', encoding='utf-8') as f:
            json.dump(scraper.get_results_as_dict(), f, indent=2, ensure_ascii=False)
        
        print(f"Scraped {len(results)} facilities")
    else:
        print("No results found")
