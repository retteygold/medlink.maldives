-- Update remaining 37 doctors with exact Dhivehi names (CORRECTED for exact DB names)
-- Run this in Supabase SQL Editor

BEGIN;

UPDATE public.doctors SET name_dv = 'ޑރ. މުޙައްމަދު ޝަރީފް ޢަބްދުލް މަޖީދު', specialty_dv = 'އެނެސްތީސިއޮލޮޖީ' WHERE name = 'Dr. Mohamed Shareef Abdul Majeed';
UPDATE public.doctors SET name_dv = 'ޑރ. މުޢާޛް މޫސާ', specialty_dv = 'އެނެސްތީސިއޮލޮޖީ' WHERE name = 'Dr. Muaz Moosa';
UPDATE public.doctors SET name_dv = 'ޑރ. މުރާރީ ޕްރަސާދު ބަރަކޯޓީ', specialty_dv = 'ހިތުގެ ބަލިތައް' WHERE name = 'Dr. Murari Prasad Barakoti';
UPDATE public.doctors SET name_dv = 'ޑރ. ނަފީސާ ޢަބްދުލް ލަޠީފް', specialty_dv = 'ލޮލުގެ ބަލިތައް' WHERE name = 'Dr. Nafeesa Abdul Latheef';
UPDATE public.doctors SET name_dv = 'ޑރ. ނަފްޙާ ޢަބްދުﷲ', specialty_dv = 'މެޑިކަލް އޮފިސަރުން' WHERE name = 'Dr. Nafha Abdulla';
UPDATE public.doctors SET name_dv = 'ޑރ. ނަޒްލާ މުޞްޠަފާ ލުޠުފީ', specialty_dv = 'އެނެސްތީސިއޮލޮޖީ' WHERE name = 'Dr. Nazla Musthafa Luthfee';
UPDATE public.doctors SET name_dv = 'ޑރ. ނިޔާޝާ އިބްރާހީމް މުޙައްމަދު', specialty_dv = 'އެނެސްތީސިއޮލޮޖީ' WHERE name = 'Dr. Niyasha Ibrahim Mohamed';
UPDATE public.doctors SET name_dv = 'ޑރ. ނުސައިބާ ފާރޫޤް ޙަސަން', specialty_dv = 'ކުޑަކުދިންގެ ބަލިތައް' WHERE name = 'Dr. Nusaiba Farouk Hassan';
UPDATE public.doctors SET name_dv = 'ޑރ. ޕްރަބާވް އުޕަދްޔާޔާ', specialty_dv = 'އެތެރެހަށީގެ ބަލިތައް' WHERE name = 'Dr. Prabhaw Upadhyaya';
UPDATE public.doctors SET name_dv = 'ޑރ. ޕްރަވީން ޖެޔާ ޗިދަމްބަރާ ޕާންޑިޔަން', specialty_dv = 'ދަތުގެ ބަލިތައް' WHERE name = 'Dr. Praveen Jeya Chidambara Pandian';
UPDATE public.doctors SET name_dv = 'ޑރ. ރަޖީބް ކުމާރު ދޭ', specialty_dv = 'އެނެސްތީސިއޮލޮޖީ' WHERE name = 'Dr. Rajib Kumar Dey';
UPDATE public.doctors SET name_dv = 'ޑރ. ރާޖޫ ބަންޑާރީ', specialty_dv = 'ސާޖަރީ' WHERE name = 'Dr. Raju Bhandari';
UPDATE public.doctors SET name_dv = 'ޑރ. ރާމްޕްރަސާދު ރަމަލިންގަމް', specialty_dv = 'އެނެސްތީސިއޮލޮޖީ' WHERE name = 'Dr. Ramprasad Ramalingam';
UPDATE public.doctors SET name_dv = 'ޑރ. ސަމްޔަމް ޕަރަޖޫލީ', specialty_dv = 'ކަންފަތް، ނޭފަތް، ކަރުގެ ބަލިތައް' WHERE name = 'Dr. Samyam Parajuli';
UPDATE public.doctors SET name_dv = 'ޑރ. ސަސީ ސީރައްޕަން', specialty_dv = 'އަންހެނުންގެ ބަލިތައް' WHERE name = 'Dr. Sasi Seerappan';
UPDATE public.doctors SET name_dv = 'ޑރ. ޝަފްރާޒް މުޙައްމަދު ޝަހީދު', specialty_dv = 'ކަށީގެ ބަލިތައް' WHERE name = 'Dr. Shafraz Mohamed Shaheid';
UPDATE public.doctors SET name_dv = 'ޑރ. ޝަހީލާ މުޙައްމަދު ނަޞީރު', specialty_dv = 'މެޑިކަލް އޮފިސަރުން' WHERE name = 'Dr. Shaheela Mohamed Naseer';
UPDATE public.doctors SET name_dv = 'ޑރ. ޝިރިޝް ޝަކްތީ މަސްކޭ', specialty_dv = 'އެނެސްތީސިއޮލޮޖީ' WHERE name = 'Dr. Shirish Shakti Maskay';
UPDATE public.doctors SET name_dv = 'ޑރ. ޝިވިރް ޝަރުމާ ދަހާލް', specialty_dv = 'އެތެރެހަށީގެ ބަލިތައް' WHERE name = 'Dr. Shivir Sharma Dahal';
UPDATE public.doctors SET name_dv = 'ޑރ. ސިނާނަތު ޙުސައިން', specialty_dv = 'އެނެސްތީސިއޮލޮޖީ' WHERE name = 'Dr. Sinaanath Hussain';
UPDATE public.doctors SET name_dv = 'ޑރ. ސައްޔިދު ފަރްހާން ޢަލީ', specialty_dv = 'ދަތުގެ ބަލިތައް' WHERE name = 'Dr. Syed Farhan Ali';
UPDATE public.doctors SET name_dv = 'ޑރ. ތަސްނީމް ފާރޫޤް', specialty_dv = 'އަންހެނުންގެ ބަލިތައް' WHERE name = 'Dr. Thasneem Farooq';
UPDATE public.doctors SET name_dv = 'ޑރ. ތުލަޕިޓިޔާގޭ ނިޝާރާ ޕްރިޔަންޖީ ވީރަސިންގޭ', specialty_dv = 'މެޑިކަލް އޮފިސަރުން' WHERE name = 'Dr. Thulapitiyage Nishara Priyanji Weerasinghe';
UPDATE public.doctors SET name_dv = 'ޑރ. އުބައިދުﷲ ޙަމޫދު ރަޝީދު', specialty_dv = 'މެޑިކަލް އޮފިސަރުން' WHERE name = 'Dr. Ubaidullah Hamoodh Rasheed';
UPDATE public.doctors SET name_dv = 'ޑރ. އުއްމެ ސަލްމާ ތާލުކްދަރު', specialty_dv = 'ނަފްސާނީ ބަލިތައް' WHERE name = 'Dr. Umme Salma Talukder';
UPDATE public.doctors SET name_dv = 'ޑރ. އުޒޮއެޗީ އެޒޭ ޗިކެޒީ', specialty_dv = 'ނަފްސާނީ ބަލިތައް' WHERE name = 'Dr. Uzoehchi Eze Chikezie';
UPDATE public.doctors SET name_dv = 'ޑރ. ވިވެކް ކުމާރު ރައުނިޔާރު', specialty_dv = 'ނިއުރޮލޮޖީ' WHERE name = 'Dr. Vivek Kumar Rauniyar';
UPDATE public.doctors SET name_dv = 'ޑރ. ޔަސްމީން މުޙައްމަދު އަޙްމަދު އެލްހަނަފީ ޝަހާތެ', specialty_dv = 'ރޭޑިއޮލޮޖީ' WHERE name = 'Dr. Yasimin Mohamed Ahmed Elhanafy Shehate';
UPDATE public.doctors SET name_dv = 'ޑރ. ޒުލައިޚާ މައީ', specialty_dv = 'އެނެސްތީސިއޮލޮޖީ' WHERE name = 'Dr. Zulaikha Maee';
UPDATE public.doctors SET name_dv = 'ޑރ. ފާތިމަތު ސީނާ', specialty_dv = 'ކަންފަތް، ނޭފަތް، ކަރުގެ ބަލިތައް' WHERE name = 'Dr.Fathimath Seena';
UPDATE public.doctors SET name_dv = 'އަނިލް ރިމާލް', specialty_dv = 'ފިޒިއޮތެރަޕީ އެންޑް ރިހެބިލިޓޭޝަން' WHERE name = 'Mr Anil Rimal';
UPDATE public.doctors SET name_dv = 'ގިތިން ޖޯޖް', specialty_dv = 'ފިޒިއޮތެރަޕީ އެންޑް ރިހެބިލިޓޭޝަން' WHERE name = 'Mr Githin George';
UPDATE public.doctors SET name_dv = 'އިބްރާހީމް އިރުފާން', specialty_dv = 'ފިޒިއޮތެރަޕީ އެންޑް ރިހެބިލިޓޭޝަން' WHERE name = 'Mr Ibrahim Irufaan';
UPDATE public.doctors SET name_dv = 'ތާރިޤް މަޖީދު', specialty_dv = 'ފިޒިއޮތެރަޕީ އެންޑް ރިހެބިލިޓޭޝަން' WHERE name = 'Mr Tharig Majeedh';
UPDATE public.doctors SET name_dv = 'ޢާއިޝަތު ދިމްނާ', specialty_dv = 'ފިޒިއޮތެރަޕީ އެންޑް ރިހެބިލިޓޭޝަން' WHERE name = 'Ms Aishath Dhimna';
UPDATE public.doctors SET name_dv = 'ޢާއިޝަތު ޒިމްނާ ޙުސައިން', specialty_dv = 'ސްޕީޗް ތެރަޕީ' WHERE name = 'Ms Aishath Zimna Hussain';
UPDATE public.doctors SET name_dv = 'މަރްޔަމް ނަޖްލާ', specialty_dv = 'ނިއުޓްރިޝަން އެންޑް ޑައިޓެޓިކްސް' WHERE name = 'Ms Mariyam Najla';
UPDATE public.doctors SET name_dv = 'ޕިއުމީ ދިލްހާރާ ވިތާނާ ޕަލެތިޔާނާ ވިތާނަގޭ', specialty_dv = 'މެޑިކަލް އޮފިސަރުން' WHERE name = 'Piumi Dilhara Vithana Paletiyana Vithanage';

COMMIT;
