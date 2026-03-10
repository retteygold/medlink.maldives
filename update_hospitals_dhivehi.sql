-- Update hospitals with Dhivehi names and addresses
-- Run this in Supabase SQL Editor
-- Generated from hospitals_dhivehi.csv

BEGIN;

UPDATE public.hospitals
SET name_dv = 'އެޓޯލް ކްލިނިކް',
    address_dv = 'ހުޅުމާލެ ލޮޓް 10133، ހަލަވެލި މަގު'
WHERE name = 'Atoll Clinic';

UPDATE public.hospitals
SET name_dv = 'ވެލީ ޑެންޓަލް',
    address_dv = 'މ. ސައިލާ، އިއްޒުއްދީން މަގު، މާލެ'
WHERE name = 'Valley Dental';

UPDATE public.hospitals
SET name_dv = 'މާކިއުރ މޯލްޑިވްސް ކޫއްޑޫ ކްލިނިކް',
    address_dv = 'ގއ. ކޫއްޑޫ'
WHERE name = 'Mercure Maldives Kooddoo Clinic';

UPDATE public.hospitals
SET name_dv = 'ޖޯލި ބީންގް ކްލިނިކް',
    address_dv = 'ރ. ބޮޑުފުށި'
WHERE name = 'Joali Being Clinic';

UPDATE public.hospitals
SET name_dv = 'ނޮވަލަކްސް ޑައިގްނޯސްޓިކްސް',
    address_dv = 'ކ. ތުލުސްދޫ، ދިވެހިރާއްޖެ'
WHERE name = 'Novalux Diagnostics';

UPDATE public.hospitals
SET name_dv = 'މާލިފުށި ބައި ކޯމޯ',
    address_dv = 'ތ. މާލިފުށި'
WHERE name = 'Maalifushi by Como';

UPDATE public.hospitals
SET name_dv = 'ދަ ކްލިނިކް އެޓް ސިއްރު ފެން ފުށި',
    address_dv = 'ށ. ގާކޮށިބީ'
WHERE name = 'The Clinic At Sirru Fen Fushi';

UPDATE public.hospitals
SET name_dv = 'ލޭކޮކާ މެޑިކަލް އެންޑް ރިހެބް',
    address_dv = 'ހ. މީރުބަހުރުގެ، މާލެ'
WHERE name = 'Leykokaa Medical & Rehab';

UPDATE public.hospitals
SET name_dv = 'މޯލްޑިވްސް ޑައިގްނޯސްޓިކް ސެންޓަރު',
    address_dv = 'ގ. ވެލަގަލާ، މާލެ'
WHERE name = 'Maldives Diagnostic Centre';

UPDATE public.hospitals
SET name_dv = 'ފަރުވާ ކްލިނިކް',
    address_dv = 'ގ. ރޯޒަރީ ވެސްޓް، މާލެ'
WHERE name = 'Faruvaa Clinic';

UPDATE public.hospitals
SET name_dv = 'ސައިމާ ކެއަރ ހުޅުމާލެ',
    address_dv = 'ހިތިގަސް މަގު، ހުޅުމާލެ'
WHERE name = 'CyMa Care Hulhumale''';

UPDATE public.hospitals
SET name_dv = 'ޕެރަޑައިސް މެޑިކަލް ސެންޓަރު',
    address_dv = 'ކ. ލަންކަންފިނޮޅު'
WHERE name = 'Paradise Medical Center';

UPDATE public.hospitals
SET name_dv = 'ހީލިންގ ކެއަރ މެޑިކަލް ސެންޓަރު',
    address_dv = 'ކުޅުދުއްފުށި ސިޓީ، މަތިވަރު'
WHERE name = 'Healing Care Medical Center';

UPDATE public.hospitals
SET name_dv = 'ޕްރޯ ކެއަރ ކްލިނިކް އެންޑް ޑެންޓަލް',
    address_dv = 'އދ. މަހިބަދޫ'
WHERE name = 'Pro Care Clinic and Dental';

UPDATE public.hospitals
SET name_dv = 'ޖޯލި މުރަވަަންދޫ ކްލިނިކް',
    address_dv = 'ރ. މުރަވަަންދޫ'
WHERE name = 'Joali Muravandhoo Clinic';

UPDATE public.hospitals
SET name_dv = 'ރިސޯޓް މެޑިކަލް އެންޑް ލެބް ސާވިސަސް',
    address_dv = 'މ. ޗަންބޭލީގެ، މާލެ'
WHERE name = 'Resort Medical & Lab Services';

UPDATE public.hospitals
SET name_dv = 'ތުނޑުފުށި މެޑިކަލް ކްލިނިކް',
    address_dv = 'ޑައިމަންޑްސް ތުނޑުފުށި ރިސޯޓް'
WHERE name = 'Thundufushi Medical Clinic';

UPDATE public.hospitals
SET name_dv = 'މޯލްޑިވްސް އަލްޓަނޭޓިވް މެޑިކަލް',
    address_dv = 'މ. އަލުވިމާގެ އާގެ، މާލެ'
WHERE name = 'Maldives Alternative Medical';

UPDATE public.hospitals
SET name_dv = 'ފިހާޅޯހި ކްލިނިކް',
    address_dv = 'ފިހާޅޯހި އައިލެންޑް ރިސޯޓް'
WHERE name = 'Fihalhohi Clinic';

UPDATE public.hospitals
SET name_dv = 'ޕްރައިމެކްސް މެޑިކެއަރ',
    address_dv = 'މ. ހުވަަންދޫ ގަންދަކޯޅިގެ، މާލެ'
WHERE name = 'Primax Medicare';

UPDATE public.hospitals
SET name_dv = 'އީވް ކްލިނިކް ވެސްޓް ޕާކް',
    address_dv = 'މ. ލާލްޕޫލްގެ އާގެ، މާލެ'
WHERE name = 'Eve Clinic West Park';

UPDATE public.hospitals
SET name_dv = 'މާލެ އައި ކްލިނިކް',
    address_dv = 'މ. ކެނޯޕަސް، އޯކިޑް މަގު، މާލެ'
WHERE name = 'Male'' Eye Clinic';

UPDATE public.hospitals
SET name_dv = 'އައި ކެއަރ ހޮސްޕިޓަލް އެނެކްސް',
    address_dv = 'ލޮޓް 10420، ހުޅުމާލެ'
WHERE name = 'Eye Care Hospital Annex';

UPDATE public.hospitals
SET name_dv = 'އައި ޒޯން ކްލިނިކް',
    address_dv = 'ގދ. ތިނަދޫ، ޒެނިތް'
WHERE name = 'Eye Zone Clinic';

UPDATE public.hospitals
SET name_dv = 'އޮރަކެއަރ ޑެންޓަލް',
    address_dv = 'ލޮޓް 10110، ހުޅުމާލެ'
WHERE name = 'Oracare Dental';

UPDATE public.hospitals
SET name_dv = 'މޮޑަން މެޑިކަލް ސެންޓަރު',
    address_dv = 'ފެހިފަރުދާގެ، ލ. ފޮަނަދޫ'
WHERE name = 'Modern Medical Centre';

UPDATE public.hospitals
SET name_dv = 'ހަރްބަލް މެޑި ކްލިނިކް',
    address_dv = 'މ. މިވަރު، ކަރްނޭޝަން މަގު، މާލެ'
WHERE name = 'Herbal Medi Clinic';

UPDATE public.hospitals
SET name_dv = 'ކަނދޮޅު ކްލިނިކް',
    address_dv = 'އއ. ކަނދޮޅުދޫ'
WHERE name = 'Kandolhu Clinic';

UPDATE public.hospitals
SET name_dv = 'ވިޜަން ކެއަރ އޮޕްޓިކަލް',
    address_dv = 'ގއ. ވިލިނގިލި'
WHERE name = 'Vision Care Optical';

UPDATE public.hospitals
SET name_dv = 'މޯލްޑިވްސް ނިއުރޯ އެންޑަކްރިން',
    address_dv = 'ގ. މާޖެހި އެނެކްސް، މާލެ'
WHERE name = 'Maldives Neuro Endocrine';

UPDATE public.hospitals
SET name_dv = 'މެޑިފްލެކްސް ލެބޯޓްރީސް',
    address_dv = 'މ. ކޮޓޭޖް، މާލެ'
WHERE name = 'Mediflex Laboratories';

UPDATE public.hospitals
SET name_dv = 'އޮލިވް މެޑިކަލް ސެންޓަރު',
    address_dv = 'ގދ. ތިނަދޫ، އަލިދޯދި'
WHERE name = 'Olive Medical Centre';

UPDATE public.hospitals
SET name_dv = 'ވެލިގަނޑު ކްލިނިކް',
    address_dv = 'ވެލިގަނޑު އައިލެންޑް ރިސޯޓް'
WHERE name = 'Veligandu Clinic';

UPDATE public.hospitals
SET name_dv = 'ތަސައްލީ މެޑިކަލް ކެއަރ',
    address_dv = 'ހ. ފެންނާގެ، ބުރުޒުމަގު، މާލެ'
WHERE name = 'Thasalli Medical Care';

UPDATE public.hospitals
SET name_dv = 'އެފް އެންޑް ސީ މެޑިކެއަރ',
    address_dv = 'ސ. މަރަދޫފޭދޫ، ބަގީޗާގެ'
WHERE name = 'F&C Medicare';

UPDATE public.hospitals
SET name_dv = 'އައި ކެއަރ ކްލިނިކް (އައްޑޫ)',
    address_dv = 'ސ. ހިތަދޫ، ސިލްވަރ ލީފް'
WHERE name = 'Eye Care Clinic (Addu)';

UPDATE public.hospitals
SET name_dv = 'އެޓޯލް ގެސްޓް ކްލިނިކް',
    address_dv = 'މާފުށި، ގަދިފަރު'
WHERE name = 'Atoll Guest Clinic';

UPDATE public.hospitals
SET name_dv = 'މައި ކެއަރ މެޑިކަލް ސެންޓަރު',
    address_dv = 'މާ. ކިނާރާ ހައުސް، މާލެ'
WHERE name = 'My Care Medical Centre';

UPDATE public.hospitals
SET name_dv = 'ކަނީ މެޑިކަލް ކްލިނިކް',
    address_dv = 'ކ. ކަނިފިނޮޅު'
WHERE name = 'Kani Medical Clinic';

UPDATE public.hospitals
SET name_dv = 'މޯލްޑިވްސް މޯބައިލް ނާސިންގ ކެއަރ',
    address_dv = 'މާ. ޖަންބުރޯލުގެ، މާލެ'
WHERE name = 'Maldives Mobile Nursing Care';

UPDATE public.hospitals
SET name_dv = 'ލިސަން ކްލިނިކް',
    address_dv = 'ގ. ކޯހީން، މާލެ'
WHERE name = 'Listen Clinic';

UPDATE public.hospitals
SET name_dv = 'ހޯޕް ޑެންޓަލް ކެއަރ',
    address_dv = '1 ވަނަ ފަންގިފިލާ، ހ. ހިކިގުޅަ، މާލެ'
WHERE name = 'Hope Dental Care';

UPDATE public.hospitals
SET name_dv = 'ދިގަލި ކްލިނިކް',
    address_dv = 'ރ. ދިގަލި މޯލްޑިވްސް'
WHERE name = 'Dhigali Clinic';

UPDATE public.hospitals
SET name_dv = 'ކޯކޯ ޝިކް ކްލިނިކް',
    address_dv = '4 ވަނަ ފަންގިފިލާ، ހ. ގާމަތީގެ، މާލެ'
WHERE name = 'Coco Chic Clinic';

UPDATE public.hospitals
SET name_dv = 'ނާދާ ކްލިނިކް',
    address_dv = 'ހ. ގާމަތީގެ، މާލެ'
WHERE name = 'Nada Clinic';

UPDATE public.hospitals
SET name_dv = 'ފުށި ކްލިނިކް',
    address_dv = 'ޅ. ފުށިފަރު، ދިވެހިރާއްޖެ'
WHERE name = 'Fushi Clinic';

UPDATE public.hospitals
SET name_dv = 'ޓްރީޓޮޕް ހޮސްޕިޓަލް',
    address_dv = 'ލޮޓް 10608، ދިއްގާ މަގު، ހުޅުމާލެ'
WHERE name = 'TreeTop Hospital';

UPDATE public.hospitals
SET name_dv = 'ސުކޫން ކްލިނިކް',
    address_dv = 'ހުޅުމާލެ'
WHERE name = 'Sukoon Clinic';

UPDATE public.hospitals
SET name_dv = 'އިލާ ޢަލީ އާދަމް ކްލިނިކް',
    address_dv = 'ޒުރީތު އިން، މާލެ'
WHERE name = 'Ilaa Ali Adam Clinic';

UPDATE public.hospitals
SET name_dv = 'ދަ ރެސިޑެންސް މޯލްޑިވްސް ކްލިނިކް',
    address_dv = 'ގއ. ފަޅުމާފުށި'
WHERE name = 'The Residence Maldives Clinic';

UPDATE public.hospitals
SET name_dv = 'މެޑްޕްލަސް ޑެންޓަލް',
    address_dv = 'ހަނދުވަރީ މަގު، މާލެ'
WHERE name = 'Medplus Dental';

UPDATE public.hospitals
SET name_dv = 'ޑރ. އުސާމާގެ ކްލިނިކް މާފަންނު',
    address_dv = 'މ. ގްރީން ލިނެޓް، މާލެ'
WHERE name = 'ޑރ. Usama''s Clinic Maafannu';

UPDATE public.hospitals
SET name_dv = 'ޖީބޯން ކްލިނިކް',
    address_dv = 'މާ. ހީރާ ކުރި، މާލެ'
WHERE name = 'Jibon Clinic';

UPDATE public.hospitals
SET name_dv = 'އޭއެމްޖީ ކްލިނިކް',
    address_dv = 'ރ. މީދޫ، ވިނަވި'
WHERE name = 'AMG Clinic';

UPDATE public.hospitals
SET name_dv = 'ސަން ސިޔާމް އޮޅުވެލި ކްލިނިކް',
    address_dv = 'ކ. އޮޅުވެލި'
WHERE name = 'Sun Siyam Olhuveli Clinic';

UPDATE public.hospitals
SET name_dv = 'ކްލިނިކާ',
    address_dv = 'ގ. މަލްވީނާ، މާލެ'
WHERE name = 'Clinica';

UPDATE public.hospitals
SET name_dv = 'އޭއެމްޑީސީ ފިޒިއޮތެރަޕީ',
    address_dv = 'މ. މިސުރުރުގެ، މާލެ'
WHERE name = 'AMDC Physiotherapy';

UPDATE public.hospitals
SET name_dv = 'ކްރިސްޓަލް މެޑިކަލްސް',
    address_dv = 'މ. ޒެފެލިން، މާލެ'
WHERE name = 'Crystal Medicals';

UPDATE public.hospitals
SET name_dv = 'އައިޖީއެމްއެޗް',
    address_dv = 'ބޮޑުތަކުރުފާނު މަގު، މާލެ'
WHERE name = 'Indira Gandhi Memorial Hospital';

UPDATE public.hospitals
SET name_dv = 'އާޔުރްވެދިކް ތެރަޕީ',
    address_dv = 'ހުޅުމާލެ'
WHERE name = 'Ayurvedic Therapy';

UPDATE public.hospitals
SET name_dv = 'މެޑްލެބް ޑައިގްނޯސްޓިކްސް',
    address_dv = 'މ. ޝީ ބިލްޑިންގ، މާލެ'
WHERE name = 'Medlab Diagnostics';

UPDATE public.hospitals
SET name_dv = 'ސަން އައިލެންޑް މެޑިކަލް ސެންޓަރު',
    address_dv = 'އދ. ސަން އައިލެންޑް'
WHERE name = 'Sun Island Medical Centre';

UPDATE public.hospitals
SET name_dv = 'ސައިމާ ކެއަރ',
    address_dv = 'މ. ނާއިިންފަރުގެ، މާލެ'
WHERE name = 'CyMa Care';

UPDATE public.hospitals
SET name_dv = 'އިންސްޓިޓިއުޓް ފޯ ކައުންސެލިންގ',
    address_dv = 'ހ. ހައިފާ، މާލެ'
WHERE name = 'Institute for Counselling';

UPDATE public.hospitals
SET name_dv = 'ހިޔާ މެޑިކަލް ސެންޓަރު',
    address_dv = 'ހިޔާ ޓަވަރު، ހުޅުމާލެ'
WHERE name = 'Hiyaa Medical Centre';

UPDATE public.hospitals
SET name_dv = 'މައި ޑެންޓަލް ކެއަރ',
    address_dv = 'އދ. މާމިގިލި'
WHERE name = 'My Dental Care';

UPDATE public.hospitals
SET name_dv = 'އެމްވީޑީއެކްސް ޑައިގްނޯސްޓިކްސް',
    address_dv = 'މ. ރިހާބް، މާލެ'
WHERE name = 'MVDX Diagnostics';

UPDATE public.hospitals
SET name_dv = 'އިންސްޓިޓިއުޓް ފޯ މެންޓަލް ވެލްބީންގ',
    address_dv = 'ހ. ހުުޅުގަލި، މާލެ'
WHERE name = 'Institute for Mental Wellbeing';

UPDATE public.hospitals
SET name_dv = 'އަވާނީ ކްލިނިކް',
    address_dv = 'ބ. ފަރެސް، އަވާނީ'
WHERE name = 'Avani Clinic';

UPDATE public.hospitals
SET name_dv = 'މޯލްޑިކެއަރ ކްލިނިކް',
    address_dv = 'ގ. މާވެހި، މާލެ'
WHERE name = 'Maldicare Clinic';

UPDATE public.hospitals
SET name_dv = 'މެޑިފްލެކްސް ޑެންޓަލް',
    address_dv = 'މ. މާޔާ، މާލެ'
WHERE name = 'Mediflex Dental';

UPDATE public.hospitals
SET name_dv = 'ވީކެއަރ ކައުންސެލިންގ ސެންޓަރު',
    address_dv = 'ވިލާ ކޮލެޖް، މާލެ'
WHERE name = 'VCare Counselling Centre';

UPDATE public.hospitals
SET name_dv = 'ބުލްބުލް މަލްޓި ރިހެބް ކްލިނިކް',
    address_dv = 'ސަނީ ލޮޖް، ހުޅުމާލެ'
WHERE name = 'Bulbul Multi Rehab Clinic';

UPDATE public.hospitals
SET name_dv = 'ޔުނީކް ޑެންޓަލް',
    address_dv = 'ސީ1-03، ހުޅުމާލެ'
WHERE name = 'Unique Dental';

UPDATE public.hospitals
SET name_dv = 'ފިޒިއޯ ސޮލިއުޝަންސް',
    address_dv = 'ގ. ހިޔާކުރި، މާލެ'
WHERE name = 'Physio Solutions';

UPDATE public.hospitals
SET name_dv = 'ޢަލީ ރަޝީދު ދިވެހި ބޭސް ކްލިނިކް',
    address_dv = 'ހ. ވެލިރާޅު، މާލެ'
WHERE name = 'Ali Rasheed Dhivehi Beys Clinic';

UPDATE public.hospitals
SET name_dv = 'ވަން މެޑިކަލް ކެއަރ',
    address_dv = 'މ. ފެޝަން، މާލެ'
WHERE name = 'One Medical Care';

UPDATE public.hospitals
SET name_dv = 'ޑރ. އުސާމާ ޑެންޓަލް ކްލިނިކް',
    address_dv = 'ހ. ރެލިކް، މާލެ'
WHERE name = 'ޑރ. Usama Dental Clinic';

UPDATE public.hospitals
SET name_dv = 'ރަންނާލި ކްލިނިކް',
    address_dv = 'ކ. ރަންނާލި'
WHERE name = 'Rannalhi Clinic';

UPDATE public.hospitals
SET name_dv = 'ފިނޮޅު ކްލިނިކް',
    address_dv = 'ބ. ފިނޮޅު'
WHERE name = 'Finolhu Clinic';

UPDATE public.hospitals
SET name_dv = 'ހަވޮއްޑާ ކްލިނިކް',
    address_dv = 'ގދ. ހަވޮއްޑާ'
WHERE name = 'Havodda Clinic';

UPDATE public.hospitals
SET name_dv = 'އަނަންތަރާ ދިގު ކްލިނިކް',
    address_dv = 'ކ. އަނަންތަރާ ދިގު'
WHERE name = 'Anantara Dhigu Clinic';

UPDATE public.hospitals
SET name_dv = 'އާރަށު ކްލިނިކް',
    address_dv = 'ރ. އާރަށް'
WHERE name = 'Aarah Clinic';

UPDATE public.hospitals
SET name_dv = 'ހަދަހާ ކްލިނިކް',
    address_dv = 'ގއ. ހަދަހާ'
WHERE name = 'Hadahaa Clinic';

UPDATE public.hospitals
SET name_dv = 'ކަންޑީމާ މެޑިކަލް ސެންޓަރު',
    address_dv = 'ދ. ކަންޑީމާ'
WHERE name = 'Kandima Medical Centre';

UPDATE public.hospitals
SET name_dv = 'ފޯ ސީޒަންސް ކުޑަ ހުރާ ކްލިނިކް',
    address_dv = 'ކ. ކުޑަ ހުރާ'
WHERE name = 'Four Seasons Kuda Huraa Clinic';

UPDATE public.hospitals
SET name_dv = 'އަލައި ކްލިނިކް',
    address_dv = 'ގ. ޑައިމްލައިޓް، މާލެ'
WHERE name = 'Alai Clinic';

UPDATE public.hospitals
SET name_dv = 'ފިނޮޅު ކްލިނިކް ޕްލަސް',
    address_dv = 'ބ. ފިނޮޅު'
WHERE name = 'Finolhu Clinic Plus';

UPDATE public.hospitals
SET name_dv = 'ގިލި ގެޓްސް ވެލް',
    address_dv = 'ކ. ގިލި ލަންކަންފުށި'
WHERE name = 'Gilli Gets Well';

UPDATE public.hospitals
SET name_dv = 'ވައްބިންފަރު ކްލިނިކް',
    address_dv = 'ކ. ވައްބިންފަރު'
WHERE name = 'Vabbinfaru Clinic';

UPDATE public.hospitals
SET name_dv = 'އައި ވެއަރ',
    address_dv = 'މ. ބްލޫ ޗިޕް، މާލެ'
WHERE name = 'I wear (Optical)';

COMMIT;
