// Simple transliteration from English to Dhivehi (Thaana) script
// This is a basic mapping for display purposes

const transliterationMap: Record<string, string> = {
  // Vowels and combinations
  'a': 'ަ', 'aa': 'ާ', 'i': 'ި', 'ee': 'ީ', 'u': 'ު', 'oo': 'ޫ',
  'e': 'ެ', 'ey': 'ޭ', 'o': 'ޮ', 'oa': 'ޯ',
  
  // Consonants
  'b': 'ބ', 'bh': 'ު',
  'c': 'ސ', 'ch': 'ޗ',
  'd': 'ދ', 'dh': 'ޱ',
  'f': 'ފ', 'g': 'ގ', 'gh': 'ޣ',
  'h': 'ހ', 'j': 'ޖ', 'jh': 'ޛ',
  'k': 'ކ', 'kh': 'ޚ', 'l': 'ލ', 'm': 'މ',
  'n': 'ނ', 'ng': 'ޏ', 'ny': 'ޕ',
  'p': 'ޕ', 'q': 'ޤ', 'r': 'ރ', 's': 'ސ', 'sh': 'ށ',
  't': 'ތ', 'th': 'ޠ', 'v': 'ވ', 'w': 'ވ', 'x': 'ކްސް',
  'y': 'ޔ', 'z': 'ޒ',
  
  // Special combinations for Maldivian names
  'ahmed': 'އަޙްމަދު', 'naseem': 'ނަސީމް',
  'mohamed': 'މުޙައްމަދު', 'ali': 'ޢަލީ',
  'ibrahim': 'އިބްރާހީމް', 'hassan': 'ޙަސަން',
  'hussain': 'ޙުސައިން', 'fatima': 'ފާތިމާ',
  'ayesha': 'ޢާއިޝާ', 'mariyam': 'މަރިޔަމް',
  'zainab': 'ޒައިނަބު', 'yusuf': 'ޔޫސުފް',
  'ismail': 'އިސްމާޢީލް', 'latheef': 'ލަޠީފް',
  'rashad': 'ރަޝާދު', 'shareef': 'ޝަރީފް',
  'asim': 'ޢާޞިމް', 'zubair': 'ޒުބައިރު',
  'hospital': 'ހޮސްޕިޓަލް', 'clinic': 'ކްލިނިކް',
  'medical': 'މެޑިކަލް', 'center': 'ސެންޓަރު',
  'doctor': 'ޑޮކްޓަރު', 'dr': 'ޑރ',
  'mr': 'މިސްޓަރު', 'ms': 'މިސް',
  'adk': 'އެޑީކޭ', 'tree top': 'ޓްރީ ޓޮޕް',
  'indira gandhi': 'އިންދިރާ ގާންދީ',
  'atolls': 'އަޓޯޅް',
};

export function transliterateToDhivehi(text: string): string {
  if (!text) return '';
  
  // First try exact matches for common names/phrases
  const lowerText = text.toLowerCase().trim();
  
  // Check for exact match first
  if (transliterationMap[lowerText]) {
    return transliterationMap[lowerText];
  }
  
  // Check for multi-word phrases
  for (const [key, value] of Object.entries(transliterationMap)) {
    if (key.includes(' ') && lowerText.includes(key)) {
      return text.toLowerCase().replace(key, value);
    }
  }
  
  // Character-by-character transliteration for unknown words
  let result = '';
  const words = text.split(' ');
  
  for (let i = 0; i < words.length; i++) {
    const word = words[i].toLowerCase();
    
    // Check if whole word has a mapping
    if (transliterationMap[word]) {
      result += transliterationMap[word];
    } else {
      // Character by character
      let j = 0;
      while (j < word.length) {
        // Try 2-character match first
        const twoChar = word.substring(j, j + 2);
        if (transliterationMap[twoChar]) {
          result += transliterationMap[twoChar];
          j += 2;
        } else {
          // Single character
          const char = word[j];
          result += transliterationMap[char] || char;
          j++;
        }
      }
    }
    
    if (i < words.length - 1) {
      result += ' ';
    }
  }
  
  return result || text; // Fallback to original if empty
}

// Reverse mapping for Dhivehi to English (for search support)
const reverseTransliterationMap: Record<string, string> = Object.fromEntries(
  Object.entries(transliterationMap).map(([en, dv]) => [dv, en])
);

// Common Thaana characters to Latin mapping
const thaanaToLatinMap: Record<string, string> = {
  'ަ': 'a', 'ާ': 'aa', 'ި': 'i', 'ީ': 'ee', 'ު': 'u', 'ޫ': 'oo',
  'ެ': 'e', 'ޭ': 'ey', 'ޮ': 'o', 'ޯ': 'oa',
  'ހ': 'h', 'ށ': 'sh', 'ނ': 'n', 'ރ': 'r', 'ބ': 'b', 'ޅ': 'lh',
  'ކ': 'k', 'އ': 'a', 'ވ': 'v', 'މ': 'm', 'ފ': 'f', 'ދ': 'd',
  'ތ': 't', 'ލ': 'l', 'ގ': 'g', 'ޏ': 'ng', 'ސ': 's', 'ޑ': 'd',
  'ޒ': 'z', 'ޓ': 't', 'ޔ': 'y', 'ޕ': 'p', 'ޖ': 'j', 'ޗ': 'ch',
  'ޘ': 'th', 'ޙ': 'h', 'ޚ': 'kh', 'ޛ': 'z', 'ޜ': 'th', 'ޝ': 's',
  'ޞ': 's', 'ޟ': 'd', 'ޠ': 'th', 'ޡ': 'z', 'ޢ': 'a', 'ޤ': 'q',
  'ޥ': 'w', 'ަް': '', 'ާް': '', 'ިް': '', 'ުް': '', 'ެް': '',
  'ް': '', // sukun (no vowel)
};

export function transliterateFromDhivehi(text: string): string {
  if (!text) return '';
  
  let result = '';
  for (const char of text) {
    result += thaanaToLatinMap[char] || char;
  }
  
  return result || text;
}

// Check if text contains Thaana (Dhivehi) characters
export function containsThaana(text: string): boolean {
  if (!text) return false;
  // Thaana Unicode range: U+0780 to U+07BF
  return /[\u0780-\u07BF]/.test(text);
}
