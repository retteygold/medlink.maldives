BEGIN;

UPDATE public.hospitals SET name_dv = 'ފުވައްމުލަކު ހޮސްޕިޓަލް', address_dv = 'ޏ. ފުވައްމުލައް' WHERE name = 'Fuvahmulah Hospital';
UPDATE public.hospitals SET name_dv = 'އައްޑޫ އިކުއަޓޯރިއަލް ހޮސްޕިޓަލް', address_dv = 'ސ. ހިތަދޫ' WHERE name = 'Addu Equatorial Hospital';
UPDATE public.hospitals SET name_dv = 'ސ. ފޭދޫ ޞިއްޙީ މަރުކަޒު', address_dv = 'ސ. ފޭދޫ' WHERE name = 'S. Feydhoo Health Centre';
UPDATE public.hospitals SET name_dv = 'ސ. ހުޅުދޫ ޞިއްޙީ މަރުކަޒު', address_dv = 'ސ. ހުޅުދޫ' WHERE name = 'S. Hulhudhoo Health Centre';

UPDATE public.hospitals SET name_dv = 'ގއ. އަތޮޅު ހޮސްޕިޓަލް', address_dv = 'ގއ. ވިލިނގިލި' WHERE name = 'GA. Atoll Hospital';
UPDATE public.hospitals SET name_dv = 'ގއ. ދާންދޫ ޞިއްޙީ މަރުކަޒު', address_dv = 'ގއ. ދާންދޫ' WHERE name = 'GA. Dhaandhoo Health Centre';

UPDATE public.hospitals SET name_dv = 'ގދ. އަތޮޅު ހޮސްޕިޓަލް', address_dv = 'ގދ. ތިނަދޫ' WHERE name = 'GDh. Atoll Hospital';
UPDATE public.hospitals SET name_dv = 'ގދ. ގައްދޫ ޞިއްޙީ މަރުކަޒު', address_dv = 'ގދ. ގައްދޫ' WHERE name = 'GDh. Gadhdhoo Health Centre';
UPDATE public.hospitals SET name_dv = 'ގދ. ވާދޫ ޞިއްޙީ މަރުކަޒު', address_dv = 'ގދ. ވާދޫ' WHERE name = 'GDh. Vaadhoo Health Centre';

UPDATE public.hospitals SET name_dv = 'ދ. އަތޮޅު ހޮސްޕިޓަލް', address_dv = 'ދ. ކުޑަހުވަދޫ' WHERE name = 'Dh. Atoll Hospital';
UPDATE public.hospitals SET name_dv = 'ދ. މީދޫ ޞިއްޙީ މަރުކަޒު', address_dv = 'ދ. މީދޫ' WHERE name = 'Dh. Meedhoo Health Center';

UPDATE public.hospitals SET name_dv = 'ތ. އަތޮޅު ހޮސްޕިޓަލް', address_dv = 'ތ. ވޭމަންޑޫ' WHERE name = 'Th. Atoll Hospital';
UPDATE public.hospitals SET name_dv = 'ތ. ތިމަރަފުށީ ޞިއްޙީ މަރުކަޒު', address_dv = 'ތ. ތިމަރަފުށި' WHERE name = 'Th. Thimarafushi Health Centre';

UPDATE public.hospitals SET name_dv = 'ލ. ގަން ރީޖަނަލް ހޮސްޕިޓަލް', address_dv = 'ލ. ގަން' WHERE name = 'Laamu Regional Hospital';
UPDATE public.hospitals SET name_dv = 'ލ. ފޮނަދޫ ޞިއްޙީ މަރުކަޒު', address_dv = 'ލ. ފޮނަދޫ' WHERE name = 'L. Fonadhoo Health Centre';

UPDATE public.hospitals SET name_dv = 'ޅ. އަތޮޅު ހޮސްޕިޓަލް', address_dv = 'ޅ. ނައިފަރު' WHERE name = 'Lh. Atoll Hospital';
UPDATE public.hospitals SET name_dv = 'ޅ. ހިންނަވަރު ޞިއްޙީ މަރުކަޒު', address_dv = 'ޅ. ހިންނަވަރު' WHERE name = 'Lh. Hinnavaru Health Centre';
UPDATE public.hospitals SET name_dv = 'ޅ. ކުރެންދޫ ޞިއްޙީ މަރުކަޒު', address_dv = 'ޅ. ކުރެންދޫ' WHERE name = 'Lh. Kurendhoo Health Centre';

UPDATE public.hospitals SET name_dv = 'މ. އަތޮޅު ހޮސްޕިޓަލް', address_dv = 'މ. މުލި' WHERE name = 'M. Atoll Hospital';
UPDATE public.hospitals SET name_dv = 'މ. ދިއްގަރު ޞިއްޙީ މަރުކަޒު', address_dv = 'މ. ދިއްގަރު' WHERE name = 'M. Dhiggaru Health Centre';

UPDATE public.hospitals SET name_dv = 'ފ. އަތޮޅު ހޮސްޕިޓަލް', address_dv = 'ފ. ނިލަންދޫ' WHERE name = 'F. Atoll Hospital';
UPDATE public.hospitals SET name_dv = 'ފ. މަގޫދޫ ޞިއްޙީ މަރުކަޒު', address_dv = 'ފ. މަގޫދޫ' WHERE name = 'F. Magoodhoo Health Centre';

COMMIT;
