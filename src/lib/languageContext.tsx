import { createContext, useContext, useState, ReactNode } from 'react';

type Language = 'en' | 'dv';

interface LanguageContextType {
  language: Language;
  setLanguage: (lang: Language) => void;
  t: (key: string) => string;
  isRTL: boolean;
  fontClass: string;
}

const translations = {
  en: {
    // Navigation
    'nav.home': 'Home',
    'nav.search': 'Search',
    'nav.hospitals': 'Hospitals',
    'nav.profile': 'Profile',
    'nav.smartMatch': 'Smart Match',
    
    // Home Page
    'home.greeting.morning': 'Good morning',
    'home.greeting.afternoon': 'Good afternoon',
    'home.greeting.evening': 'Good evening',
    'home.title': 'Find Your Doctor',
    'home.searchPlaceholder': 'Search doctors, hospitals, specialties...',
    'home.smartMatch.title': 'Not sure which doctor?',
    'home.smartMatch.subtitle': 'Describe your symptoms, we\'ll find the right specialist',
    'home.specialties.title': 'Specialties',
    'home.specialties.seeAll': 'See all',
    'home.doctors.title': 'Top Doctors',
    'home.doctors.viewAll': 'View all',
    'home.hospitals.title': 'Top Hospitals',
    'home.hospitals.viewAll': 'View all',
    
    // Doctors Page
    'doctors.title': 'Find Doctors',
    'doctors.searchPlaceholder': 'Search by name or specialty...',
    'doctors.filters.specialty': 'Specialty',
    'doctors.found': 'doctors found',
    'doctors.loading': 'Loading doctors...',
    
    // Doctor Card
    'doctor.reviews': 'reviews',
    'doctor.bookNow': 'Book Now',
    'doctor.callNow': 'Call Now',
    'doctor.about': 'About',
    'doctor.qualifications': 'Qualifications',
    'doctor.experience': 'Experience',
    'doctor.languages': 'Languages',
    'doctor.available': 'Available Today',
    'doctor.nextAvailable': 'Next Available',
    
    // Hospitals Page
    'hospitals.title': 'Hospitals & Clinics',
    'hospitals.searchPlaceholder': 'Search hospitals...',
    'hospitals.filters.category': 'Category',
    'hospitals.found': 'hospitals found',
    'hospitals.loading': 'Loading hospitals...',
    'hospitals.emergency': '24/7 Emergency',
    'hospitals.pharmacy': 'Pharmacy',
    'hospitals.laboratory': 'Laboratory',
    
    // Hospital Card
    'hospital.callNow': 'Call Now',
    'hospital.directions': 'Directions',
    'hospital.about': 'About',
    'hospital.facilities': 'Facilities',
    'hospital.openingHours': 'Opening Hours',
    'hospital.address': 'Address',
    'hospital.contact': 'Contact',
    'hospital.doctors': 'Doctors at',
    'hospital.noDoctors': 'No doctors listed for this hospital yet.',
    'hospital.viewAllDoctors': 'View all',
    
    // Smart Match
    'smartMatch.title': 'Smart Doctor Finder',
    'smartMatch.subtitle': 'Describe your symptoms and we\'ll find the right specialist',
    'smartMatch.label': 'What symptoms are you experiencing?',
    'smartMatch.placeholder': 'Example: I\'ve been having chest pain and shortness of breath...',
    'smartMatch.button': 'Find Doctors',
    'smartMatch.analyzing': 'Analyzing...',
    'smartMatch.results': 'Analysis Results',
    'smartMatch.recommendedDoctors': 'Recommended Doctors',
    'smartMatch.urgency.emergency': 'Emergency',
    'smartMatch.urgency.high': 'High',
    'smartMatch.urgency.medium': 'Medium',
    'smartMatch.urgency.low': 'Low',
    
    // Search Page
    'search.title': 'Search',
    'search.placeholder': 'Search anything...',
    'search.doctors': 'Doctors',
    'search.hospitals': 'Hospitals',
    'search.specialties': 'Specialties',
    'search.noResults': 'No results found',
    
    // Profile Page
    'profile.title': 'Profile',
    'profile.language': 'Language',
    'profile.english': 'English',
    'profile.dhivehi': 'ދިވެހި',
    'profile.about': 'About MedLink',
    'profile.privacy': 'Privacy Policy',
    'profile.terms': 'Terms of Service',
    'profile.contact': 'Contact Us',

    // Pharmacy Finder
    'pharmacyFinder.title': 'Not sure which pharmacy has your medicine?',
    'pharmacyFinder.subtitle': 'Upload a prescription or medicine photo. Optional: write the medicine name/brand.',

    // Medicine Help
    'medicineHelp.title': 'Need Urgent Medicine from Abroad?',
    'medicineHelp.subtitle': 'Upload prescription and request help.',
    'pharmacyFinder.notesPlaceholder': 'Medicine name / brand (optional)',
    'pharmacyFinder.uploadButton': 'Upload Prescription / Medicine Photo',
    'pharmacyFinder.uploading': 'Uploading...',
    'pharmacyFinder.latestStatus': 'Latest Status',
    'pharmacyFinder.noRequestsYet': 'No requests yet. Upload an image to start.',
    'pharmacyFinder.myRequests': 'My Requests',
    'pharmacyFinder.noRequests': 'No requests.',
    'pharmacyFinder.providerInbox': 'Provider/Admin Inbox',
    'pharmacyFinder.viberFallbackShort': 'If you can’t wait, you can share the image via Viber to Shikavathi Chatline +7951400.',
    'pharmacyFinder.viberFallbackChecking': 'We’re checking pharmacies. If you need urgent help, share the image via Viber to +7951400.',
    'pharmacyFinder.inbox.title': 'Pharmacy Finder Inbox',
    'pharmacyFinder.inbox.openRequests': 'Open requests',
    'pharmacyFinder.inbox.noOpenRequests': 'No open requests.',
    'pharmacyFinder.inbox.request': 'Request',
    'pharmacyFinder.inbox.pharmacyName': 'Pharmacy name',
    'pharmacyFinder.inbox.phoneOptional': 'Phone (optional)',
    'pharmacyFinder.inbox.locationOptional': 'Location (optional)',
    'pharmacyFinder.inbox.submitAnswer': 'Submit Answer',
    'pharmacyFinder.inbox.saving': 'Saving...',
    'pharmacyFinder.inbox.refresh': 'Refresh',
    'pharmacyFinder.inbox.nameRequired': 'Pharmacy name is required',
    'pharmacyFinder.inbox.submitFailed': 'Failed to submit answer (check RLS / permissions)',
    'pharmacyFinder.status.open': 'open',
    'pharmacyFinder.status.answered': 'answered',
    'pharmacyFinder.status.closed': 'closed',
    'pharmacyFinder.availability.in_stock': 'in stock',
    'pharmacyFinder.availability.out_of_stock': 'out of stock',
    'pharmacyFinder.availability.unknown': 'unknown',
    
    // Common
    'common.loading': 'Loading...',
    'common.back': 'Back',
    'common.seeMore': 'See more',
    'common.bookAppointment': 'Book Appointment',
    'common.call': 'Call',
    'common.email': 'Email',
    'common.website': 'Website',
    'common.rating': 'Rating',
    'common.reviews': 'Reviews',
    'common.filterBy': 'Filter by',
    'common.all': 'All',
    'common.apply': 'Apply',
    'common.cancel': 'Cancel',
  },
  dv: {
    // Navigation
    'nav.home': 'މެއިން ސްކްރީން',
    'nav.search': 'ހޯދާ',
    'nav.hospitals': 'ހަސްފަތާލްތައް',
    'nav.profile': 'ތަފްސީލް',
    'nav.smartMatch': 'ޖާދުވީ އެހީ',
    
    // Home Page
    'home.greeting.morning': 'ބާއްޖަވެރި ހެނދުނެއް',
    'home.greeting.afternoon': 'ބާއްޖަވެރި މެންދުރެއް',
    'home.greeting.evening': 'ބާއްޖަވެރި ރޭގަޑެއް',
    'home.title': 'ޑޮކްޓަރ ހޯދުމައް',
    'home.searchPlaceholder': 'ޑޮކްޓަރް، ހަސްފަތާލް، ހާއްސަ ހޯދުމައް',
    'home.smartMatch.title': 'ކޮން ޑޮކްޓަރެއްކަމެއް ނޭނގެ؟',
    'home.smartMatch.subtitle': 'ވާ އުނދަގޫ ތަށް ހިއްސާ ކޮއްލައްވާ، އެކަށީގެންވާ ޑޮކްޓަރ ހޯދުމަށް އެހީ ވެދޭނަން',
    'home.specialties.title': 'ހާއްސަ ޑޮކްޓަރުން',
    'home.specialties.seeAll': 'އެއްކޮން ބެލުމަށް',
    'home.doctors.title': 'އިސް ޑޮކްޓަރުން',
    'home.doctors.viewAll': 'އެއްކޮން ބެލުމަށް',
    'home.hospitals.title': 'އިސް ހަސްފަތާލް',
    'home.hospitals.viewAll': 'އެއްކޮން ބެލުމަށް',
    
    // Doctors Page
    'doctors.title': 'ޑޮކްޓަރެއް ހޯދުމަށް',
    'doctors.searchPlaceholder': 'ނަމުން ތަރުތީބު ކުރަން',
    'doctors.filters.specialty': 'ހާއްސަ ޑޮކްޓަރުން',
    'doctors.found': 'ޑޮކްޓަރުން ފެނިއްޖެ',
    'doctors.loading': 'ޑޮކްޓަރުން ހޯދަނީ',
    
    // Doctor Card
    'doctor.reviews': 'ޑޮކްޓަރުންގެ ފީޑްބެކް',
    'doctor.bookNow': 'ބުކް ކުރުމަށް',
    'doctor.callNow': 'ގުޅާލުމަށް',
    'doctor.about': 'މަޢުލޫމާތު',
    'doctor.qualifications': 'ތަޢުލީމް',
    'doctor.experience': 'ތަޖުރިބާތަށް',
    'doctor.languages': 'ބަސް',
    'doctor.available': 'މިއަދު ލިބޭ',
    'doctor.nextAvailable': 'ދެންލިބެނީ',
    
    // Hospitals Page
    'hospitals.title': 'ހަސްފަތާލް އަދި ސިޢްހީ މަރުކަޒު',
    'hospitals.searchPlaceholder': 'ހަސްފަތާލް ހޯދާ',
    'hospitals.filters.category': 'އެކި ބައިތަށް',
    'hospitals.found': 'ހަސްފަތާލް ފެނިއްޖެ',
    'hospitals.loading': 'ހަސްފަތާލް ހޯދަނީ',
    'hospitals.emergency': 'ކުއްލި ހާލަތް',
    'hospitals.pharmacy': 'ބޭސް ފިހާރަ',
    'hospitals.laboratory': 'ތަހުލީލު ކޮޓަރި',
    
    // Hospital Card
    'hospital.callNow': 'މިހާރު ގުޅުމަށް',
    'hospital.directions': 'ހުރި ތަން ހޯދުމަށް',
    'hospital.about': 'ތަފްސީލު',
    'hospital.facilities': 'ޙިދުމަތް ތަށް',
    'hospital.openingHours': 'ހުޅުވާ ގަޑިތަށް',
    'hospital.address': 'ގެ ނަން',
    'hospital.contact': 'ގުޅޭނެ ނަންބަރ',
    'hospital.doctors': 'ބައްލަވާ ޑޮކްޓަރުން',
    'hospital.noDoctors': 'ޑޮކްޓަރަކު ނެތް',
    'hospital.viewAllDoctors': 'އެއްކޮން ބެލުމަށް',
    
    // Smart Match
    'smartMatch.title': 'Smart Doctor Finder',
    'smartMatch.subtitle': 'ވާ އުނދަގޫ ތަށް ހިއްސާ ކޮއްލައްވާ، އެކަށީގެންވާ ޑޮކްޓަރ ހޯދުމަށް އެހީ ވެދޭނަން',
    'smartMatch.label': 'ކޮންކަހަލަ އުނދަގޫ ތަކެށްތޯ ވަނީ؟',
    'smartMatch.placeholder': 'އަޅުގަނޑު ނޭވާ ހިއްލާފަ މޭގަ ރިއްސަނީ....',
    'smartMatch.button': 'ޑޮކްޓަރ ހޯދުމަށް',
    'smartMatch.analyzing': 'ހޯދަނީ.....',
    'smartMatch.results': 'ފެނުނު ކަންތައްތައް',
    'smartMatch.recommendedDoctors': 'ކަމާ ގުޅޭ ޑޮކްޓަރުން',
    'smartMatch.urgency.emergency': 'ކުއްލި ހާލަތް',
    'smartMatch.urgency.high': 'މަތި',
    'smartMatch.urgency.medium': 'މެދު',
    'smartMatch.urgency.low': 'ތިރި',
    
    // Search Page
    'search.title': 'ހޯދުމަށް',
    'search.placeholder': 'ކޮންމެ އެއްޗެއް ހޯދުމަށް',
    'search.doctors': 'ޑޮކްޓަރުން',
    'search.hospitals': 'ހަސްފަތާލް',
    'search.specialties': 'ހާއްސަ ޑޮކްޓަރުން',
    'search.noResults': 'ނުފެނުން',
    
    // Profile Page
    'profile.title': 'ތަފްސީލް',
    'profile.language': 'ބަސް',
    'profile.english': 'އިނގިރޭސި',
    'profile.dhivehi': 'ދިވެހި',
    'profile.about': 'ތަފްސީލް',
    'profile.privacy': 'ގަވާއިދު',
    'profile.terms': 'ހިދުމަތުގެ އެއްބަސްވުން',
    'profile.contact': 'އަޅުގަނޑުމެންނަށް ގުޅުމަށް',

    // Pharmacy Finder
    'pharmacyFinder.title': 'މާލެ ބޭސް ފިހާރަ އަކުން ބޭސް ނުލިބުނީތަ؟',
    'pharmacyFinder.subtitle': 'ބޭސް ސިޓީ ހިއްސާ ކޮއްލާއްވާ / ބޭހުގެ ނަން ނުނީ މަރުކާ ލިޔުއްވާ',

    // Medicine Help
    'medicineHelp.title': 'އަވަހައް ބޭރުން ބޭހެއް ގެންނަން ބޭނުންވީތަ؟',
    'medicineHelp.subtitle': 'ބޭސް ސިޓީ / ބޭހުގެ ތަސްވީރު ހިއްސާ ކޮއްލާއްވާ',
    'pharmacyFinder.notesPlaceholder': 'ބޭހުގެ ނަން ނުނީ މަރުކާ ލިޔުއްވާ',
    'pharmacyFinder.uploadButton': 'ބޭސް ސިޓީ / ބޭހުގެ ތަސްވީރު ހިއްސާ ކޮއްލާއްވާ',
    'pharmacyFinder.uploading': 'ލޯޑް ވަނީ',
    'pharmacyFinder.latestStatus': 'އެންމެ ފަހުގެ ހަބަރު',
    'pharmacyFinder.noRequestsYet': 'އަދި އެހީއަށް ނޭދޭ. ތަސްވީރު ހިއްސާ ކޮއްލައްވާ',
    'pharmacyFinder.myRequests': 'އަހަރެންގެ އެދުންތަށް',
    'pharmacyFinder.noRequests': 'އަދި އެހީއަށް ނޭދޭ',
    'pharmacyFinder.providerInbox': 'އިސްވެރިންގެ ބައި',
    'pharmacyFinder.viberFallbackShort': 'މަޑުފުޅު ކުރައްވަން ބޭނުން ނޫންނަމަ ށިކާޔަތު އަށް ވައިބަރ ކޮއްލައްވާ +7951400',
    'pharmacyFinder.viberFallbackChecking': 'އަހަރުމެން ބޭސްފިހާރަތަށް މިދަނީ ބަލަމުން. މަޑުފުޅު ކުރައްވަން ބޭނުން ނޫންނަމަ ވައިބަރ ކޮއްލައްވާ +7951400',
    'pharmacyFinder.inbox.title': 'ބޭސްފިހާރަ ހޫދާ ފޮށި',
    'pharmacyFinder.inbox.openRequests': 'އެހީއަށް ހުޅުވިފަ',
    'pharmacyFinder.inbox.noOpenRequests': 'ހުޅުވިފައިވާ އެހީއެއް ނެތް',
    'pharmacyFinder.inbox.request': 'އެދެވިފައި',
    'pharmacyFinder.inbox.pharmacyName': 'ބޭސްފިހާރަ ނަން',
    'pharmacyFinder.inbox.phoneOptional': 'ގުޅޭނެ ނަންބަރ',
    'pharmacyFinder.inbox.locationOptional': 'ފިހާރަ ހުރިތަން',
    'pharmacyFinder.inbox.submitAnswer': 'ޖަވާބު ފޮނުވުމަށް',
    'pharmacyFinder.inbox.saving': 'ފަހައް ފޮރުވެނީ',
    'pharmacyFinder.inbox.refresh': 'ޕޭޖް ތާޒާކޮއްލާ',
    'pharmacyFinder.inbox.nameRequired': 'ފިހާރަނަން ޖެހުން މަޖުބޫރު',
    'pharmacyFinder.inbox.submitFailed': 'ޖަވާބު ފޮނުވުމަށް ނުކުޅެދިފަ',
    'pharmacyFinder.status.open': 'ހުޅުވިފާ',
    'pharmacyFinder.status.answered': 'ޖަވާބު ދެވިފާ',
    'pharmacyFinder.status.closed': 'ބަންދު ކުރެވިފާ',
    'pharmacyFinder.availability.in_stock': 'މުދާ އެބަހުރި',
    'pharmacyFinder.availability.out_of_stock': 'މުދާ ހުސްވެފާ',
    'pharmacyFinder.availability.unknown': 'ނޭނގޭ',
    
    // Common
    'common.loading': 'ލޯޑުވަނީ',
    'common.back': 'ފަހަތައްދޭ',
    'common.seeMore': 'އެއްކޮން ބަލާ',
    'common.bookAppointment': 'އެޕޮއިންޓްމެންޓު ހެދުމަށް',
    'common.call': 'ގުޅާ',
    'common.email': 'ސިޓީ ފޮނުވަން',
    'common.website': 'ވިއުގަ',
    'common.rating': 'ވަނަ',
    'common.reviews': 'ވަނަވަރު',
    'common.filterBy': 'ވަކި ބައެއް ބެލުމަށް',
    'common.all': 'އެއްކޮން',
    'common.apply': 'ހިޔާރުކުރޭ',
    'common.cancel': 'ބެނުންނުވޭ',
  }
};

const LanguageContext = createContext<LanguageContextType | undefined>(undefined);

export function LanguageProvider({ children }: { children: ReactNode }) {
  const [language, setLanguage] = useState<Language>('en');

  const t = (key: string): string => {
    return translations[language][key as keyof typeof translations.en] || key;
  };

  const isRTL = language === 'dv';
  const fontClass = language === 'dv' ? 'dhivehi-font' : '';

  return (
    <LanguageContext.Provider value={{ language, setLanguage, t, isRTL, fontClass }}>
      {children}
    </LanguageContext.Provider>
  );
}

export function useLanguage() {
  const context = useContext(LanguageContext);
  if (context === undefined) {
    throw new Error('useLanguage must be used within a LanguageProvider');
  }
  return context;
}
