import { useLanguage } from '../lib/languageContext';
import { Globe } from 'lucide-react';

export function LanguageToggle() {
  const { language, setLanguage } = useLanguage();

  return (
    <button
      onClick={() => setLanguage(language === 'en' ? 'dv' : 'en')}
      className="flex items-center gap-2 px-3 py-2 rounded-lg bg-white/10 hover:bg-white/20 transition-colors text-white"
    >
      <Globe size={18} />
      <span className="font-medium text-sm">
        {language === 'en' ? 'English' : 'ދިވެހި'}
      </span>
    </button>
  );
}
