-- Update doctors with Dhivehi names and specialties
-- Run this in Supabase SQL Editor
-- Generated from doctors_dhivehi.csv
-- NOTE: Names with 'ޑރ.' prefix converted to 'Dr.' for matching

BEGIN;

UPDATE public.doctors
SET name_dv = 'ޑރ. އާދަމް ޚަލީލް ޔޫސުފް',
    specialty_dv = 'ޕެތޮލޮޖީ / ލެބޯޓްރީ'
WHERE name = 'Dr. Adam Khaleel Yoosuf';

UPDATE public.doctors
SET name_dv = 'ޑރ. މުޙައްމަދު ޝާމް',
    specialty_dv = 'ބަލިތަކަށް ފަރުވާދޭ'
WHERE name = 'Dr. Mohamed Sham';

UPDATE public.doctors
SET name_dv = 'ޑރ. ދީޕަކް ކުމާރު',
    specialty_dv = 'އެނެސްތީސިއޮލޮޖީ'
WHERE name = 'Dr. Deepak Kumar';

UPDATE public.doctors
SET name_dv = 'ޑރ. ސަދީމާ ރަޝީދު',
    specialty_dv = 'އެނެސްތީސިއޮލޮޖީ'
WHERE name = 'Dr. Sadhima Rasheed';

UPDATE public.doctors
SET name_dv = 'ޑރ. ޢަލީ ޝަފީޤް',
    specialty_dv = 'އެނެސްތީސިއޮލޮޖީ'
WHERE name = 'Dr. Ali shafeeq';

UPDATE public.doctors
SET name_dv = 'ޑރ. ޕްރަވީން ޖެޔާ',
    specialty_dv = 'ދަތުގެ ބަލިތައް'
WHERE name = 'Dr. Praveen Jeya';

UPDATE public.doctors
SET name_dv = 'ޑރ. މަރްޔަމް ނަޝްވާ ނަސީމް',
    specialty_dv = 'މެޑިކަލް އޮފިސަރުން'
WHERE name = 'Dr. Mariyam Nashwa Naseem';

UPDATE public.doctors
SET name_dv = 'ޑރ. މުޙައްމަދު ޝިފާން',
    specialty_dv = 'އެނެސްތީސިއޮލޮޖީ'
WHERE name = 'Dr. Mohamed Shifan';

UPDATE public.doctors
SET name_dv = 'ޑރ. އެލީނާ ބައިކޯވާ',
    specialty_dv = 'އެނެސްތީސިއޮލޮޖީ'
WHERE name = 'Dr. Elena Bykova';

UPDATE public.doctors
SET name_dv = 'ޑރ. ޢާއިޝަތު އިބްނާ އަދުނާން',
    specialty_dv = 'ލޮލުގެ ބަލިތައް'
WHERE name = 'Dr. Aishath Ibna Adnan';

UPDATE public.doctors
SET name_dv = 'ޑރ. މަމާތާ ޗެންޗުގައްލާ',
    specialty_dv = 'އެނެސްތީސިއޮލޮޖީ'
WHERE name = 'Dr. Mamatha Chenchugalla';

UPDATE public.doctors
SET name_dv = 'ޑރ. ސަމާޙަތު',
    specialty_dv = 'ކުޑަކުދިންގެ ބަލިތައް'
WHERE name = 'Dr. Samahath';

UPDATE public.doctors
SET name_dv = 'ޑރ. ބާރަތު މަނީ ބަންޖާޑޭ',
    specialty_dv = 'ސާޖަރީ'
WHERE name = 'Dr. Bharat Mani Banjade';

UPDATE public.doctors
SET name_dv = 'ޑރ. މުޙައްމަދު ރައްޒާން ރަމީޒް',
    specialty_dv = 'ކަށީގެ ބަލިތައް'
WHERE name = 'Dr. Mohamed Razzan Rameez';

UPDATE public.doctors
SET name_dv = 'ޑރ. ޒުބައިރު މުޙައްމަދު ދީދީ',
    specialty_dv = 'އެނެސްތީސިއޮލޮޖީ'
WHERE name = 'Dr. Zubair Mohamed Didi';

UPDATE public.doctors
SET name_dv = 'ޑރ. ސަންތޯޝް ކުމާރު ކައްލާ',
    specialty_dv = 'ނަފްސާނީ ބަލިތައް'
WHERE name = 'Dr. Santosh Kumar Kalla';

UPDATE public.doctors
SET name_dv = 'ޑރ. ސޫދު އެންޓަނީ',
    specialty_dv = 'ދަތުގެ ބަލިތައް'
WHERE name = 'Dr. Soodh Antony';

UPDATE public.doctors
SET name_dv = 'ޑރ. ޒީނާ މުޙައްމަދު ފުއާދު',
    specialty_dv = 'ބަލިތަކަށް ފަރުވާދޭ'
WHERE name = 'Dr. Zeena Mohamed Fuad';

UPDATE public.doctors
SET name_dv = 'ޑރ. މުޙައްމަދު ޝަނީޒް ނަޖުމީ',
    specialty_dv = 'އެނެސްތީސިއޮލޮޖީ'
WHERE name = 'Dr. Mohamed Shaneez Najmy';

UPDATE public.doctors
SET name_dv = 'ޑރ. ޗަންދުރަ ޕްރަސާދު',
    specialty_dv = 'ކުޑަކުދިންގެ ބަލިތައް'
WHERE name = 'Dr. Chandra Prasad Paneru';

UPDATE public.doctors
SET name_dv = 'ޑރ. އިބްރާހީމް ފައިޞަލް',
    specialty_dv = 'އެންޑަކްރިނޮލޮޖީ'
WHERE name = 'Dr. Ibrahim Faisal';

UPDATE public.doctors
SET name_dv = 'ޑރ. ސުބާޝް ބައްޓާ',
    specialty_dv = 'ކަންފަތް، ނޭފަތް، ކަރުގެ ބަލިތައް'
WHERE name = 'Dr. Subash Bhatta';

UPDATE public.doctors
SET name_dv = 'ޑރ. މުޙައްމަދު ފައިޝަމް',
    specialty_dv = 'އެނެސްތީސިއޮލޮޖީ'
WHERE name = 'Dr. Mohamed Faisham';

UPDATE public.doctors
SET name_dv = 'ޑރ. ޝިރްމީން މުޙައްމަދު',
    specialty_dv = 'އެނެސްތީސިއޮލޮޖީ'
WHERE name = 'Dr. Shirmeen Mohamed';

UPDATE public.doctors
SET name_dv = 'ޑރ. ޣައްޝާނަތު ޢަބްދުލް ވައްހާބް',
    specialty_dv = 'މެޑިކަލް އޮފިސަރުން'
WHERE name = 'Dr. Gashshaanath Abdul Wahhab';

UPDATE public.doctors
SET name_dv = 'ޑރ. ޢަލީ ޢައްބާސް މުރުޝިދު',
    specialty_dv = 'ކަށީގެ ބަލިތައް'
WHERE name = 'Dr. Ali Abbas Murshed';

UPDATE public.doctors
SET name_dv = 'ޑރ. ފާތިމަތު ޝާމަލީ ޖައުފަރު',
    specialty_dv = 'އެނެސްތީސިއޮލޮޖީ'
WHERE name = 'Dr. Fathimath Shaamaly Jaufar';

UPDATE public.doctors
SET name_dv = 'ޑރ. ސްމްރިތީ މަނަންދަރު',
    specialty_dv = 'އެނެސްތީސިއޮލޮޖީ'
WHERE name = 'Dr. Smriti Manandnar';

UPDATE public.doctors
SET name_dv = 'ޑރ. ޙުސައިން ޖުމާން ޖަލީލް',
    specialty_dv = 'އަންހެނުންގެ ބަލިތައް'
WHERE name = 'Dr. Hussain Juman Jaleel';

UPDATE public.doctors
SET name_dv = 'ޑރ. މުޙައްމަދު ސިރުހާން',
    specialty_dv = 'އެނެސްތީސިއޮލޮޖީ'
WHERE name = 'Dr. Mohamed Siruhan';

UPDATE public.doctors
SET name_dv = 'ޑރ. ފާތިމަތު ޝަޒޫ',
    specialty_dv = 'އެތެރެހަށީގެ ބަލިތައް'
WHERE name = 'Dr. Fathimath Shazoo';

UPDATE public.doctors
SET name_dv = 'ޑރ. އަޙްމަދު ޒޫޝާން',
    specialty_dv = 'ބަލިތަކަށް ފަރުވާދޭ'
WHERE name = 'Dr. Ahmed Zooshan';

UPDATE public.doctors
SET name_dv = 'ޑރ. އިބްރާހީމް ސުޖާއު',
    specialty_dv = 'އެނެސްތީސިއޮލޮޖީ'
WHERE name = 'Dr. Ibrahim Sujau';

UPDATE public.doctors
SET name_dv = 'ޑރ. މަހާ ވަޙީދު',
    specialty_dv = 'މެޑިކަލް އޮފިސަރުން'
WHERE name = 'Dr. Mahaa Waheed';

UPDATE public.doctors
SET name_dv = 'ޑރ. މުޙައްމަދު އަރީދު',
    specialty_dv = 'ކުޑަކުދިންގެ ބަލިތައް'
WHERE name = 'Dr. Mohamed Areed';

UPDATE public.doctors
SET name_dv = 'ޑރ. ޢަބްދުﷲ ނާޒިމް',
    specialty_dv = 'ނަފްސާނީ ބަލިތައް'
WHERE name = 'Dr. Abdulla Nazim';

UPDATE public.doctors
SET name_dv = 'ޑރ. މުޙައްމަދު ޢަލީ',
    specialty_dv = 'ބަލިތަކަށް ފަރުވާދޭ'
WHERE name = 'Dr. Mohamed Ali';

UPDATE public.doctors
SET name_dv = 'ޑރ. އާމިނަތު ލުހުޝާން',
    specialty_dv = 'އެނެސްތީސިއޮލޮޖީ'
WHERE name = 'Dr. Aminath Luhushan';

UPDATE public.doctors
SET name_dv = 'ޑރ. ސޯރަވް ސުންދަރު ޝްރެސްތާ',
    specialty_dv = 'ރޭޑިއޮލޮޖީ'
WHERE name = 'Dr. Saurav Sunder Shrestha';

UPDATE public.doctors
SET name_dv = 'ޑރ. މިޤްދާދު ޝަރީފް',
    specialty_dv = 'އެނެސްތީސިއޮލޮޖީ'
WHERE name = 'Dr. Miqdhaadh Shareef';

UPDATE public.doctors
SET name_dv = 'ޑރ. ސޯހަން ގުޕްތާ',
    specialty_dv = 'އެތެރެހަށީގެ ބަލިތައް'
WHERE name = 'Dr. Sohan Gupta';

UPDATE public.doctors
SET name_dv = 'ޑރ. ޢާއިޝަތު އީލީނާ',
    specialty_dv = 'އެނެސްތީސިއޮލޮޖީ'
WHERE name = 'Dr. Aishath Eleena';

UPDATE public.doctors
SET name_dv = 'ޑރ. އިސްމާޢީލް ޒާހިރު',
    specialty_dv = 'އެނެސްތީސިއޮލޮޖީ'
WHERE name = 'Dr. Ismail Zahir';

UPDATE public.doctors
SET name_dv = 'ޑރ. ސަތިޝް ކޮއިރާލާ',
    specialty_dv = 'ކުޑަކުދިންގެ ބަލިތައް'
WHERE name = 'Dr. Sathish Koirala';

UPDATE public.doctors
SET name_dv = 'ޑރ. އާމިނަތު ޒޭބާ އަޙްމަދު',
    specialty_dv = 'އިމަޖެންސީ މެޑިސިން'
WHERE name = 'Dr. Aminath Zeyba Ahmed';

UPDATE public.doctors
SET name_dv = 'ޑރ. އަނިލް ޚަދްކާ',
    specialty_dv = 'އެނެސްތީސިއޮލޮޖީ'
WHERE name = 'Dr. Anil Khadka';

UPDATE public.doctors
SET name_dv = 'ޑރ. ނަފްލާނާ އަމީން',
    specialty_dv = 'ކުޑަކުދިންގެ ބަލިތައް'
WHERE name = 'Dr. Naflana Ameen';

UPDATE public.doctors
SET name_dv = 'ޑރ. ނުޒްހާ މުޙައްމަދު',
    specialty_dv = 'ހަމުގެ ބަލިތައް'
WHERE name = 'Dr. Nuzha Mohamed';

UPDATE public.doctors
SET name_dv = 'ޑރ. ގުރައިޝާ ޙަނީފް',
    specialty_dv = 'އެތެރެހަށީގެ ބަލިތައް'
WHERE name = 'Dr. Quraisha Haneef';

UPDATE public.doctors
SET name_dv = 'ޑރ. އުޒޮއެޗީ އެޒޭ',
    specialty_dv = 'ނަފްސާނީ ބަލިތައް'
WHERE name = 'Dr. Uzoehchi Eze';

UPDATE public.doctors
SET name_dv = 'ޑރ. އަޙްމަދު ޝިފާޒް',
    specialty_dv = 'ކަންފަތް، ނޭފަތް، ކަރުގެ ބަލިތައް'
WHERE name = 'Dr. Ahmed Shifaz';

UPDATE public.doctors
SET name_dv = 'ޑރ. ޢަބްދުﷲ ނިޔާފް',
    specialty_dv = 'ކުޑަކުދިންގެ ބަލިތައް'
WHERE name = 'Dr. Abdulla Niyaf';

UPDATE public.doctors
SET name_dv = 'ޑރ. ބުދީ ނާތު އަދިކާރީ',
    specialty_dv = 'ޕްލާސްޓިކް ސާޖަރީ'
WHERE name = 'Dr. Budhi Nath Adhikari';

UPDATE public.doctors
SET name_dv = 'ޑރ. މަދީޙް މުޙައްމަދު',
    specialty_dv = 'އިމަޖެންސީ މެޑިސިން'
WHERE name = 'Dr. Madheeh Hussain';

UPDATE public.doctors
SET name_dv = 'ޑރ. ރޮބިން ބައްޓަރާއި',
    specialty_dv = 'ނިއުރޯސާޖަރީ'
WHERE name = 'Dr. Robin Bhattarai';

UPDATE public.doctors
SET name_dv = 'ޑރ. އަޙްމަދު ޒިޔާން',
    specialty_dv = 'އިމަޖެންސީ މެޑިސިން'
WHERE name = 'Dr. Ahmed Ziyan';

UPDATE public.doctors
SET name_dv = 'ޑރ. ކަންޗަން ދަހާލް',
    specialty_dv = 'ނަފްސާނީ ބަލިތައް'
WHERE name = 'Dr. Kanchan Dahal';

UPDATE public.doctors
SET name_dv = 'ޑރ. ޝަނޫހާ މަންޞޫރު',
    specialty_dv = 'ނަފްސާނީ ބަލިތައް'
WHERE name = 'Dr. Shanooha Mansoor';

UPDATE public.doctors
SET name_dv = 'ޑރ. މުޙައްމަދު ޝަފީޢު',
    specialty_dv = 'ލޭހޮޅީގެ ސާޖަރީ'
WHERE name = 'Dr. Mohamed Shafiu';

UPDATE public.doctors
SET name_dv = 'ޑރ. މަޢުރޫފް ވިސާމް',
    specialty_dv = 'ސާޖަރީ'
WHERE name = 'Dr. Mauroof Wisam';

UPDATE public.doctors
SET name_dv = 'ޑރ. ޕްރަޖްވޮލް ތާޕާ',
    specialty_dv = 'ނަފްސާނީ ބަލިތައް'
WHERE name = 'Dr. Prajwol Thapa';

UPDATE public.doctors
SET name_dv = 'ޑރ. ފާތިމަތު ޒުވައިދާ',
    specialty_dv = 'ސާޖަރީ'
WHERE name = 'Dr. Fathimath Zuwaida';

UPDATE public.doctors
SET name_dv = 'ޑރ. ރޯޝަން ޝްރެސްތާ',
    specialty_dv = 'ފުއްޕާމޭގެ ބަލިތައް'
WHERE name = 'Dr. Roshan Shrestha';

UPDATE public.doctors
SET name_dv = 'ޑރ. އާމިނަތު ޝަނާޒް',
    specialty_dv = 'ކުޑަކުދިންގެ ބަނޑުގެ ބަލިތައް'
WHERE name = 'Dr. Aminath Shanaz';

UPDATE public.doctors
SET name_dv = 'ޑރ. އަޙްމަދު ސައިފް',
    specialty_dv = 'އެންޑަކްރިނޮލޮޖީ'
WHERE name = 'Dr. Ahmed Saif';

UPDATE public.doctors
SET name_dv = 'ޑރ. ރަވީ ކަނޯޑިއާ',
    specialty_dv = 'ކެންސަރުގެ ބަލިތައް'
WHERE name = 'Dr. Ravi Kanodia';

UPDATE public.doctors
SET name_dv = 'ޑރ. މުރާރީ ޕްރަސާދު',
    specialty_dv = 'ހިތުގެ ބަލިތައް'
WHERE name = 'Dr. Murari Prasad';

UPDATE public.doctors
SET name_dv = 'ޑރ. ބިނޯދު ގޯތަމް',
    specialty_dv = 'އެނެސްތީސިއޮލޮޖީ'
WHERE name = 'Dr. Binod Gautam';

UPDATE public.doctors
SET name_dv = 'ޑރ. ޝާންތީ ޖައިޝީ',
    specialty_dv = 'އަންހެނުންގެ ބަލިތައް'
WHERE name = 'Dr. Shanti Jaishi';

UPDATE public.doctors
SET name_dv = 'ޑރ. މުކޭޝް ޕްރަސާދު',
    specialty_dv = 'ބަނޑާއި ގޮހޮރުގެ ބަލިތައް'
WHERE name = 'Dr. Mukesh Prasad Sah';

UPDATE public.doctors
SET name_dv = 'ޑރ. ވިވެކް ކުމާރު',
    specialty_dv = 'ނިއުރޮލޮޖީ'
WHERE name = 'Dr. Vivek Kumar';

UPDATE public.doctors
SET name_dv = 'ޑރ. ޕްރޭމް ރާޖް ސިގްޑެލް',
    specialty_dv = 'ކުޑަކަމުދާ ނިޒާމުގެ ބަލިތައް'
WHERE name = 'Dr. Prem Raj Sigdel';

UPDATE public.doctors
SET name_dv = 'ޑރ. އަޙްމަދު ނިޝާން',
    specialty_dv = 'ސާޖަރީ'
WHERE name = 'Dr. Ahmed Nishan';

UPDATE public.doctors
SET name_dv = 'ޑރ. ބޫމިކާ ޕްރަދާން',
    specialty_dv = 'ގުރުދާގެ ބަލިތައް'
WHERE name = 'Dr. Bhumika Pradhan';

UPDATE public.doctors
SET name_dv = 'ޑރ. އިސްމާޢީލް އީޖާޒް ޢަލީ',
    specialty_dv = 'ކުޑަކުދިންގެ ބަލިތައް'
WHERE name = 'Dr. Ismail Ejaz Ali';

UPDATE public.doctors
SET name_dv = 'ޑރ. ނަޖާޙަތު އަޙްމަދު',
    specialty_dv = 'މެޑިކަލް އޮފިސަރުން'
WHERE name = 'Dr. Najahath Ahmed';

UPDATE public.doctors
SET name_dv = 'ޑރ. ޢަލީ އާފީ',
    specialty_dv = 'އެނެސްތީސިއޮލޮޖީ'
WHERE name = 'Dr. Ali Aafee';

UPDATE public.doctors
SET name_dv = 'ޑރ. ރާމް ޕްރަސާދު ޕޮކްރޭލް',
    specialty_dv = 'ކުޑަކުދިންގެ ބަލިތައް'
WHERE name = 'Dr. Ram Prasad Pokhrel';

UPDATE public.doctors
SET name_dv = 'ޑރ. މުޙައްމަދު ވަޙީދު',
    specialty_dv = 'އެނެސްތީސިއޮލޮޖީ'
WHERE name = 'Dr. Mohamed Waheed';

UPDATE public.doctors
SET name_dv = 'ޑރ. ފަރުޒާނާ ޝައުގީ',
    specialty_dv = 'އެނެސްތީސިއޮލޮޖީ'
WHERE name = 'Dr. Farzana Shaugee';

UPDATE public.doctors
SET name_dv = 'ޑރ. އާމިނަތު އީނާސް',
    specialty_dv = 'މެޑިކަލް އޮފިސަރުން'
WHERE name = 'Dr. Aminath Eenas';

UPDATE public.doctors
SET name_dv = 'ޑރ. ހަނާ ނޫޙް',
    specialty_dv = 'ކަންފަތް، ނޭފަތް، ކަރުގެ ބަލިތައް'
WHERE name = 'Dr. Hana Nooh';

UPDATE public.doctors
SET name_dv = 'ޑރ. ރޯޝަނީ ވާގްލޭ',
    specialty_dv = 'ހަމުގެ ބަލިތައް'
WHERE name = 'Dr. Roshani Wagle';

UPDATE public.doctors
SET name_dv = 'ޑރ. މުޙައްމަދު މުތުޢިމް',
    specialty_dv = 'ބަލިތަކަށް ފަރުވާދޭ'
WHERE name = 'Dr. Mohamed Muthuim';

UPDATE public.doctors
SET name_dv = 'ޑރ. އިސްމާޢީލް ލަޠީފް',
    specialty_dv = 'އެނެސްތީސިއޮލޮޖީ'
WHERE name = 'Dr. Ismail Latheef';

UPDATE public.doctors
SET name_dv = 'ޑރ. ޢަބްދުﷲ އަފްނާން އަޙްމަދު',
    specialty_dv = 'މެޑިކަލް އޮފިސަރުން'
WHERE name = 'Dr. Abdullah Afnan Ahmed';

UPDATE public.doctors
SET name_dv = 'ޑރ. ސާރިއު ޢަލީ ދީދީ',
    specialty_dv = 'ރޫމަޓޮލޮޖީ'
WHERE name = 'Dr. Sariu Ali Didi';

UPDATE public.doctors
SET name_dv = 'ޑރ. ޙުސައިން ޝަކީލް',
    specialty_dv = 'ކަށީގެ ބަލިތައް'
WHERE name = 'Dr. Hussain Shakeel';

UPDATE public.doctors
SET name_dv = 'ޑރ. ޔޫޖަން ސަޕްކޯޓާ',
    specialty_dv = 'އެނެސްތީސިއޮލޮޖީ'
WHERE name = 'Dr. Yujan Sapkota';

UPDATE public.doctors
SET name_dv = 'ޑރ. މަރްޔަމް ޝަހާނާ',
    specialty_dv = 'ލޮލުގެ ބަލިތައް'
WHERE name = 'Dr. Mariyam Shahana';

UPDATE public.doctors
SET name_dv = 'ޑރ. ޕިޔޫޝް ނިރައުލާ',
    specialty_dv = 'ނިއުރޮލޮޖީ'
WHERE name = 'Dr. Piyush Niroula';

UPDATE public.doctors
SET name_dv = 'ޑރ. މައީޝާ ޞާލިޙް',
    specialty_dv = 'ރޭޑިއޮލޮޖީ'
WHERE name = 'Dr. Maeesha Solih';

UPDATE public.doctors
SET name_dv = 'ޑރ. ސްވިކްރިތީ ކޮއިރާލާ',
    specialty_dv = 'ކޮމިއުނިޓީ މެޑިސިން'
WHERE name = 'Dr. Swikriti Koirala';

UPDATE public.doctors
SET name_dv = 'ޑރ. ޢާއިޝަތު އަޒްނާ ޢަލީ',
    specialty_dv = 'ސާޖަރީ'
WHERE name = 'Dr. Aishath Azna Ali';

UPDATE public.doctors
SET name_dv = 'ޑރ. އަޙްމަދު ޝަހީދު',
    specialty_dv = 'އެނެސްތީސިއޮލޮޖީ'
WHERE name = 'Dr. Ahmed Shaheed';

UPDATE public.doctors
SET name_dv = 'ޑރ. ދީޕަކް މުކްތަން',
    specialty_dv = 'ކުޑަކުދިންގެ ބަލިތައް'
WHERE name = 'Dr. Dipak Muktan';

UPDATE public.doctors
SET name_dv = 'ޑރ. ސަންޖޫ ޝަރުމާ',
    specialty_dv = 'ޕެތޮލޮޖީ'
WHERE name = 'Dr. Sanju Sharma';

UPDATE public.doctors
SET name_dv = 'ޑރ. ޒާހިޔާ ޢަބްދުލް ބާރީ',
    specialty_dv = 'އަންހެނުންގެ ބަލިތައް'
WHERE name = 'Dr. Zahiya Abdul Baree';

UPDATE public.doctors
SET name_dv = 'ޑރ. ކިރަން އަރްޔާލް',
    specialty_dv = 'މައިކްރޯބަޔޮލޮޖީ'
WHERE name = 'Dr. Kiran Aryal';

UPDATE public.doctors
SET name_dv = 'ޑރ. މުޙައްމަދު މިޝްވާރު',
    specialty_dv = 'ކަށީގެ ބަލިތައް'
WHERE name = 'Dr. Mohamed Mishwaar';

UPDATE public.doctors
SET name_dv = 'ޑރ. އަނީޝާ ބަސްނެތް',
    specialty_dv = 'އެނެސްތީސިއޮލޮޖީ'
WHERE name = 'Dr. Anisha Basnet';

UPDATE public.doctors
SET name_dv = 'ޑރ. މުޢުތަޒް އައިމަން',
    specialty_dv = 'ލޭހޮޅީގެ ސާޖަރީ'
WHERE name = 'Dr. Moataz Ayman Saleh';

UPDATE public.doctors
SET name_dv = 'ޑރ. މުޙައްމަދު މުންޝިދު',
    specialty_dv = 'ކަށީގެ ބަލިތައް'
WHERE name = 'Dr. Mohamed Munshid';

UPDATE public.doctors
SET name_dv = 'ޑރ. މަޙްފޫޛާ މޫސާ',
    specialty_dv = 'އެނެސްތީސިއޮލޮޖީ'
WHERE name = 'Dr. Mahfooza Moosa';

UPDATE public.doctors
SET name_dv = 'ޑރ. ފާތިމަތު ސާޒްލީން',
    specialty_dv = 'މެޑިކަލް އޮފިސަރުން'
WHERE name = 'Dr. Fathimath Saazleen';

UPDATE public.doctors
SET name_dv = 'ޑރ. އަނޫޕް ޝްރެސްތާ',
    specialty_dv = 'ސާޖަރީ'
WHERE name = 'Dr. Anup Shrestha';

UPDATE public.doctors
SET name_dv = 'ޑރ. މުޙައްމަދު ޝަފްރާޒް',
    specialty_dv = 'މެޑިކަލް އޮފިސަރުން'
WHERE name = 'Dr. Mohamed Shafraz';

UPDATE public.doctors
SET name_dv = 'ޑރ. މޫސާ މުރާދު',
    specialty_dv = 'އެނެސްތީސިއޮލޮޖީ'
WHERE name = 'Dr. Moosa Murad';

UPDATE public.doctors
SET name_dv = 'ޑރ. ޝަހުލާ ޢަފީފް',
    specialty_dv = 'ރޭޑިއޮލޮޖީ'
WHERE name = 'Dr. Shahula Afeef';

UPDATE public.doctors
SET name_dv = 'ޑރ. ކިރަން ނިރައުލާ',
    specialty_dv = 'ނިއުރޯސާޖަރީ'
WHERE name = 'Dr. Kiran Niraula';

UPDATE public.doctors
SET name_dv = 'ޑރ. ނަޝްވާ އަޙްމަދު',
    specialty_dv = 'ހަމުގެ ބަލިތައް'
WHERE name = 'Dr. Nashwa Ahmed';

UPDATE public.doctors
SET name_dv = 'ޑރ. ޝިމާލް ތަސްނީމް',
    specialty_dv = 'ޕެތޮލޮޖީ'
WHERE name = 'Dr. Shimal Thasneem';

UPDATE public.doctors
SET name_dv = 'ޑރ. އިބްރާހީމް ޝިހާމް',
    specialty_dv = 'އެނެސްތީސިއޮލޮޖީ'
WHERE name = 'Dr. Ibrahim Shiham';

UPDATE public.doctors
SET name_dv = 'ޑރ. ސޫރަޖް ދައުބަދޭލް',
    specialty_dv = 'ކުޑަކުދިންގެ ބަލިތައް'
WHERE name = 'Dr. Suraj Dhaubhadel';

UPDATE public.doctors
SET name_dv = 'ޑރ. ފާތިމަތު ނިއުމާ އަޙްމަދު',
    specialty_dv = 'އެނެސްތީސިއޮލޮޖީ'
WHERE name = 'Dr. Fathimath Niuma Ahmed';

UPDATE public.doctors
SET name_dv = 'ޑރ. ނަޝީދާ ސަޢީދު',
    specialty_dv = 'ނިއުރޮލޮޖީ'
WHERE name = 'Dr. Nasheeda Saeed';

UPDATE public.doctors
SET name_dv = 'ޑރ. އާރިފް މުޙައްމަދު',
    specialty_dv = 'އެނެސްތީސިއޮލޮޖީ'
WHERE name = 'Dr. Arif Mohamed';

UPDATE public.doctors
SET name_dv = 'ޑރ. އަންޖަލީ ޕައުޑެލް',
    specialty_dv = 'އެނެސްތީސިއޮލޮޖީ'
WHERE name = 'Dr. Anjali Poudel';

UPDATE public.doctors
SET name_dv = 'ޑރ. ޝޫގާ މޫސާ',
    specialty_dv = 'އެނެސްތީސިއޮލޮޖީ'
WHERE name = 'Dr. Shooga Moosa';

UPDATE public.doctors
SET name_dv = 'ޑރ. ޒުލައިޚާ މުޙައްމަދު',
    specialty_dv = 'އަންހެނުންގެ ބަލިތައް'
WHERE name = 'Dr. Zulaikha Mohamed';

UPDATE public.doctors
SET name_dv = 'ޑރ. ސަންދީޕް ގިރީ',
    specialty_dv = 'ރޭޑިއޮލޮޖީ'
WHERE name = 'Dr. Sandip Giri';

UPDATE public.doctors
SET name_dv = 'ޑރ. މުޙައްމަދު މާޒިން އިލްޔާސް',
    specialty_dv = 'ދަތުގެ ބަލިތައް'
WHERE name = 'Dr. Mohamed Mazin Ilyas';

UPDATE public.doctors
SET name_dv = 'ޑރ. ޢާއިޝަތު ޖަނީނާ އަމީރު',
    specialty_dv = 'ލޮލުގެ ބަލިތައް'
WHERE name = 'Dr. Aishath Jeneena Amir';

UPDATE public.doctors
SET name_dv = 'ޑރ. މަރްޔަމް ތޫބާ މުޙައްމަދު',
    specialty_dv = 'މެޑިކަލް އޮފިސަރުން'
WHERE name = 'Dr. Mariyam Thooba Mohamed';

UPDATE public.doctors
SET name_dv = 'ޑރ. ވިޝާމާ ޢަބްދުއްރައްޒާޤް',
    specialty_dv = 'އެތެރެހަށީގެ ބަލިތައް'
WHERE name = 'Dr. Wishama Abdul Razzag';

UPDATE public.doctors
SET name_dv = 'ޑރ. މުޙައްމަދު ޒައިދާން ޢާދިލް',
    specialty_dv = 'ނިއުރޯސާޖަރީ'
WHERE name = 'Dr. Mohamed Zaidan Adil';

UPDATE public.doctors
SET name_dv = 'ޑރ. ޢަބްދުﷲ އުބައިދު',
    specialty_dv = 'ސާޖަރީ'
WHERE name = 'Dr. Abdulla Ubaid';

UPDATE public.doctors
SET name_dv = 'ޑރ. ޔުސްރާ ޢަލީ',
    specialty_dv = 'ރޭޑިއޮލޮޖީ'
WHERE name = 'Dr. Yusra Ali';

UPDATE public.doctors
SET name_dv = 'ޑރ. މުޙައްމަދު ކާމިލް ސުބްޙީ',
    specialty_dv = 'ސާޖަރީ'
WHERE name = 'Dr. Mohamed Kamel Sobhi';

UPDATE public.doctors
SET name_dv = 'ޑރ. ޝަނާޒް ޑޯލް',
    specialty_dv = 'އެނެސްތީސިއޮލޮޖީ'
WHERE name = 'Dr. Shanaz Dole';

UPDATE public.doctors
SET name_dv = 'ޑރ. މުޙައްމަދު އަމްރު އަޙްމަދު',
    specialty_dv = 'އެނެސްތީސިއޮލޮޖީ'
WHERE name = 'Dr. Mohamed Amru Ahmed';

COMMIT;
