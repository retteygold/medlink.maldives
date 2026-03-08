// Simple transliteration from English to Dhivehi (Thaana) script
// This is a basic mapping for display purposes

const transliterationMap: Record<string, string> = {
  // Vowels and combinations
  'a': 'ަ', 'aa': 'ާ', 'i': 'ި', 'ee': 'ީ', 'u': 'ު', 'oo': 'ޫ',
  'e': 'ެ', 'ey': 'ޭ', 'o': 'ޮ', 'oa': 'ޯ',
  
  // Consonants
  'b': 'ބ', 'bh': 'ު',
  'c': 'ސ', 'ch': 'ޗ',
  'd': 'ދ', 'dh': 'ޱ', 'dr': 'ޑރ',
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
