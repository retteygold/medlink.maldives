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
    'pharmacyFinder.title': 'Pharmacy Finder',
    'pharmacyFinder.subtitle': 'Upload a prescription/medicine photo and we’ll help find a pharmacy.',
    'pharmacyFinder.notesPlaceholder': 'Optional notes (medicine name, dosage, where you searched, etc.)',
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
    'nav.home': 'މައި ޞަފްޙާ',
    'nav.search': 'ހޯދާ',
    'nav.hospitals': 'ހޮސްޕިޓަލް',
    'nav.profile': 'ޕްރޮފައިލް',
    'nav.smartMatch': 'ސްމާރޓް މޭޗް',
    
    // Home Page
    'home.greeting.morning': 'ބާއްޖަވެރި ހެނދުނ',
    'home.greeting.afternoon': 'ބާއްޖަވެރި މެންދުރު',
    'home.greeting.evening': 'ބާއްޖަވެރި ހަވީރު',
    'home.title': 'ޑޮކްޓަރ ހޯދާ',
    'home.searchPlaceholder': 'ޑޮކްޓަރ، ހޮސްޕިޓަލް، ސްޕެޝަލިޓީ ހޯދާ...',
    'home.smartMatch.title': 'ކޮން ޑޮކްޓަރަކާ ބައްދަވާ؟',
    'home.smartMatch.subtitle': 'ތަކުރާރު ކިޔާ، ރަނގަޅު ސްޕެޝަލިސްޓަކު ހޯދައިދެން',
    'home.specialties.title': 'ސްޕެޝަލިޓީތައް',
    'home.specialties.seeAll': 'މުޅިން ދައްކާ',
    'home.doctors.title': 'މީގެ މަތީ ޑޮކްޓަރުން',
    'home.doctors.viewAll': 'މުޅިން ދައްކާ',
    'home.hospitals.title': 'މީގެ މަތީ ހޮސްޕިޓަލް',
    'home.hospitals.viewAll': 'މުޅިން ދައްކާ',
    
    // Doctors Page
    'doctors.title': 'ޑޮކްޓަރުން ހޯދާ',
    'doctors.searchPlaceholder': 'ނަމުން ނުވަތަ ސްޕެޝަލިޓީން ހޯދާ...',
    'doctors.filters.specialty': 'ސްޕެޝަލިޓީ',
    'doctors.found': 'ޑޮކްޓަރުން ފެނުނު',
    'doctors.loading': 'ޑޮކްޓަރުން ލޯޑްކުރަން...',
    
    // Doctor Card
    'doctor.reviews': 'ރިވިއު',
    'doctor.bookNow': 'ބުކްކުރޭ',
    'doctor.callNow': 'ގުޅާ',
    'doctor.about': 'މަޢުލޫމާތު',
    'doctor.qualifications': 'ފަސްމާލިއަތް',
    'doctor.experience': 'ތަޖުރިބާ',
    'doctor.languages': 'ބަހުތައް',
    'doctor.available': 'މިއަދު މުވައްދަވާ',
    'doctor.nextAvailable': 'ދެން މުވައްދަވާ',
    
    // Hospitals Page
    'hospitals.title': 'ހޮސްޕިޓަލް & ކްލިނިކް',
    'hospitals.searchPlaceholder': 'ހޮސްޕިޓަލް ހޯދާ...',
    'hospitals.filters.category': 'ކެޓަގަރީ',
    'hospitals.found': 'ހޮސްޕިޓަލް ފެނުނު',
    'hospitals.loading': 'ހޮސްޕިޓަލް ލޯޑްކުރަން...',
    'hospitals.emergency': '24/7 އިމަރޖެންސީ',
    'hospitals.pharmacy': 'ފަރުމަސީ',
    'hospitals.laboratory': 'ލޭބޮރެޓަރީ',
    
    // Hospital Card
    'hospital.callNow': 'ގުޅާ',
    'hospital.directions': 'ދިމާވޭ ގޮތް',
    'hospital.about': 'މަޢުލޫމާތު',
    'hospital.facilities': 'ސުލޫތައް',
    'hospital.openingHours': 'އަޅާ ގަޑި',
    'hospital.address': 'ވެރިސް',
    'hospital.contact': 'ގުޅުން',
    'hospital.doctors': 'ޑޮކްޓަރުން',
    'hospital.noDoctors': 'މި ހޮސްޕިޓަލުގައި ޑޮކްޓަރުން ލިސްޓް ނުކުރައްވާ.',
    'hospital.viewAllDoctors': 'މުޅިން ދައްކާ',
    
    // Smart Match
    'smartMatch.title': 'ސްމާރޓް ޑޮކްޓަރ ފައިނޑަރ',
    'smartMatch.subtitle': 'ތަކުރާރު ކިޔާ، ރަނގަޅު ސްޕެޝަލިސްޓަކު ހޯދައިދެން',
    'smartMatch.label': 'ކޮން ތަކުރާރަކާ ހުރި؟',
    'smartMatch.placeholder': 'މިސާލަކަށް: މަގައިގަނޑުގައި ރިއްސާ، ނާފުސާ ދަނީ...',
    'smartMatch.button': 'ޑޮކްޓަރުން ހޯދާ',
    'smartMatch.analyzing': 'ހޯދަން...',
    'smartMatch.results': 'އެނެލައިސިސް ނަތީޖާ',
    'smartMatch.recommendedDoctors': 'ރިކަމަންޑް ޑޮކްޓަރުން',
    'smartMatch.urgency.emergency': 'އިމަރޖެންސީ',
    'smartMatch.urgency.high': 'މަތި',
    'smartMatch.urgency.medium': 'މެދު',
    'smartMatch.urgency.low': 'ދަށް',
    
    // Search Page
    'search.title': 'ހޯދާ',
    'search.placeholder': 'ކަމެއް ހޯދާ...',
    'search.doctors': 'ޑޮކްޓަރުން',
    'search.hospitals': 'ހޮސްޕިޓަލް',
    'search.specialties': 'ސްޕެޝަލިޓީތައް',
    'search.noResults': 'ނަތީޖާއެއް ނުފެނުނު',
    
    // Profile Page
    'profile.title': 'ޕްރޮފައިލް',
    'profile.language': 'ބަސް',
    'profile.english': 'English',
    'profile.dhivehi': 'ދިވެހި',
    'profile.about': 'މެޑްލިންކް މިއުޗާ',
    'profile.privacy': 'ޕްރައިވެސީ ޕޮލިސީ',
    'profile.terms': 'ޓަރމްސް އޮފް ސާވިސް',
    'profile.contact': 'ކޮންޓެކްޓް އަސް',

    // Pharmacy Finder
    'pharmacyFinder.title': 'ފަރުމަސީ ހޯދާ',
    'pharmacyFinder.subtitle': 'ރެސިޕީ/މެޑިސިން ފޮޓޯ އަޕްލޯޑް ކޮށް ފަރުމަސީއެއް ހޯދައިދެން.',
    'pharmacyFinder.notesPlaceholder': 'އިންތިޒާމީ ނޯޓް (މެޑިސިން ނަން، ޑޮސޭޖް، ހޯދި ތަން އެއްޗެއް...)',
    'pharmacyFinder.uploadButton': 'ރެސިޕީ / މެޑިސިން ފޮޓޯ އަޕްލޯޑް',
    'pharmacyFinder.uploading': 'އަޕްލޯޑް ކުރަން...',
    'pharmacyFinder.latestStatus': 'އެންމެ އާ ހާލަތް',
    'pharmacyFinder.noRequestsYet': 'އަދި ރިކުއެސްޓެއް ނެތް. ފޮޓޯ އެއް އަޕްލޯޑް ކޮށް ފެށުން.',
    'pharmacyFinder.myRequests': 'މަގޭ ރިކުއެސްޓްތައް',
    'pharmacyFinder.noRequests': 'ރިކުއެސްޓެއް ނެތް.',
    'pharmacyFinder.providerInbox': 'ޕްރޮވައިޑަރ/އެޑްމިން އިންބޮކްސް',
    'pharmacyFinder.viberFallbackShort': 'ދެން މަޑުކޮށްލެވޭނެ ނުވަތަ، Viber އަށް ފޮޓޯ ފޮނުވަން: Shikavathi Chatline +7951400',
    'pharmacyFinder.viberFallbackChecking': 'ފަރުމަސީތައް ހޯދަމުންދަނީ. އަވަސް އެހީ ބޭނުން ނަމަ Viber އަށް +7951400 އަށް ފޮޓޯ ފޮނުވާ.',
    'pharmacyFinder.inbox.title': 'ފަރުމަސީ ހޯދާ އިންބޮކްސް',
    'pharmacyFinder.inbox.openRequests': 'ހުޅުވި ރިކުއެސްޓް',
    'pharmacyFinder.inbox.noOpenRequests': 'ހުޅުވި ރިކުއެސްޓެއް ނެތް.',
    'pharmacyFinder.inbox.request': 'ރިކުއެސްޓް',
    'pharmacyFinder.inbox.pharmacyName': 'ފަރުމަސީ ނަން',
    'pharmacyFinder.inbox.phoneOptional': 'ފޯނު (އިޚްތިޔާރީ)',
    'pharmacyFinder.inbox.locationOptional': 'ތަން (އިޚްތިޔާރީ)',
    'pharmacyFinder.inbox.submitAnswer': 'ޖަވާބު ފޮނުވާ',
    'pharmacyFinder.inbox.saving': 'ސޭވް ކުރަން...',
    'pharmacyFinder.inbox.refresh': 'ރިފްރެޝް',
    'pharmacyFinder.inbox.nameRequired': 'ފަރުމަސީ ނަން ލިޔުން ލާޒިމް',
    'pharmacyFinder.inbox.submitFailed': 'ޖަވާބު ފޮނުވުމުން ނުކުރެވުނު (RLS/އިޖާޒަތް ޗެކް ކޮށްލާ)',
    'pharmacyFinder.status.open': 'ހުޅުވި',
    'pharmacyFinder.status.answered': 'ޖަވާބު ލިބިފަ',
    'pharmacyFinder.status.closed': 'ބަންދު',
    'pharmacyFinder.availability.in_stock': 'ސްޓޮކް ހުރި',
    'pharmacyFinder.availability.out_of_stock': 'ސްޓޮކް ނެތް',
    'pharmacyFinder.availability.unknown': 'ނޭނގޭ',
    
    // Common
    'common.loading': 'ލޯޑްކުރަން...',
    'common.back': 'ފަހަތަށް',
    'common.seeMore': 'އިތިރަސް ދައްކާ',
    'common.bookAppointment': 'ބުކް އެޕޮއިންޓްމަންޓް',
    'common.call': 'ގުޅާ',
    'common.email': 'އީމެއިލް',
    'common.website': 'ވެބްސައިޓް',
    'common.rating': 'ރޭޓިންގ',
    'common.reviews': 'ރިވިއުތައް',
    'common.filterBy': 'ފިލްޓަރ ބައި',
    'common.all': 'މުޅިން',
    'common.apply': 'އެޕްލައި',
    'common.cancel': 'ކެންސަލް',
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
