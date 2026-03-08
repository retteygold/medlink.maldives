import { useEffect } from 'react';
import { useLanguage } from '../lib/languageContext';

export function RTLWrapper({ children }: { children: React.ReactNode }) {
  const { isRTL, fontClass } = useLanguage();

  useEffect(() => {
    // Apply RTL direction to document
    document.documentElement.dir = isRTL ? 'rtl' : 'ltr';
    document.documentElement.lang = isRTL ? 'dv' : 'en';
    
    // Add/remove Dhivehi font class to body
    if (isRTL) {
      document.body.classList.add('dhivehi-font');
    } else {
      document.body.classList.remove('dhivehi-font');
    }
  }, [isRTL]);

  return (
    <div className={`${fontClass} ${isRTL ? 'rtl-layout' : ''} min-h-screen`}>
      {children}
    </div>
  );
}
