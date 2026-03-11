-- Doctors SQL Batch 2 of 19
-- Contains 500 doctors

BEGIN;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ahmed Elsayed Elymany Abokaremh', 'Ophthalmology', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ahmed Elsayed Ibrahim Mohammed Nasser', 'Obstetrics & Gynecology', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ahmed Elsayed Mohamed Abdelghany', 'Orthopedic Surgery', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ahmed Elsayed Shaaban Elsayed Sokkar', 'Radiology', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ahmed Eltaher Abdelraheem Aref', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ahmed Ezzat Elsayed Shaban', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ahmed Ezzat Mahmoud Mohamed', 'Obstetrics & Gynecology', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ahmed Fahud Hussain', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ahmed Faisal', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ahmed Farag Mohamed Radwan', 'General Surgery', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ahmed Faraz', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ahmed Fathy Ibrahim Elghamrawy', 'Obstetrics & Gynecology', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ahmed Fathy Mhany Khalil', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ahmed Fekry Bahyeldin Khalafallah', 'Dermatology', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ahmed Foad Seragelden Elsherbeny Abdelbaset Anbr', 'Cardiology', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ahmed Gaber Ahmed Mohamed', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ahmed Gaber Saad Abdellatif Saad', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ahmed Galal Abdelmaksoud Ali Hassan', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ahmed Gamal Abdelwahab Salama', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ahmed Gamal Ahmed Mahmoud Ramadan', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ahmed Gamal Mahmoud Mohamed', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ahmed Gamal Youssef Meselhi', 'Pulmonology', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ahmed Ghareeb Salim Mahmoud', 'Obstetrics & Gynecology', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ahmed Gharib Hamed Hamed Mostafa', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ahmed Gouda Abdelsamad khalil', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ahmed Hamdi Mohamed Rashad Salem Badawi', 'Orthopedic Surgery', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ahmed Hamdy Mahmoud Badawy Elsheikh', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ahmed Hassan Ahmed Abdelkader', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ahmed Hassan Mohamed Mohamed Elfakharany', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ahmed Hegazy Mahdy Sasy', 'General Surgery', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ahmed Hossameldin Fetouh Shalash', 'Cardiology', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ahmed Hussien Sayed Ahmed', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ahmed Ibrahim Abdelghafar Darweesh', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ahmed Ibrahim Ali Elazab Kandil', 'General Surgery', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ahmed Ibrahim Amin Abosamra', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ahmed Imtiaz Rafat', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ahmed Imtiazur Rahman', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ahmed Islam Elsayed Mahfouz Ahmed Kamel Ahmed Mahfouz', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ahmed Jamsheed Mohamed', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ahmed Khalid Saad Mohamed', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ahmed khurshid', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ahmed Latiff', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ahmed Magdi Ahmed Mohamed Fayed', 'Radiology', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ahmed Magdy Abbas Abdelhalim', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ahmed Magdy Ismail Abar', 'Radiology', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ahmed Mahmoud Helmy Mohamed Gomaa', 'Radiology', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ahmed Mahmoud Mohamed Zakzouk', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ahmed Mahmoud Nasr El Hamaki', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ahmed Mahmoud Sami Ahmed Hussein', 'Orthopedic Surgery', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ahmed Mahmoud Sharaf Hassan', 'Neurology', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ahmed Mahmoud Zainaldin Abdullah', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ahmed Mamdouh Ahmed Mahmoud Youssef', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ahmed Miduhath Mohamed', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ahmed Mifthah Ibrahim', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ahmed Migdhaadh', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ahmed Mohamed Abaker Babai', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ahmed Mohamed Abdalhakem Aly Hassan Blaih', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ahmed Mohamed Abdalla Elghamry', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ahmed Mohamed Abdelazim Mohamed Elseidy', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ahmed Mohamed Abdelaziz Aly Elhanafy', 'Orthopedic Surgery', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ahmed Mohamed Abdelsalam Mohamed  Ali', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ahmed Mohamed Ahmed Ismail', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ahmed Mohamed Ahmed Rozza', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ahmed Mohamed Ali Mohamed Ali', 'Obstetrics & Gynecology', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ahmed Mohamed Eldemerdash Mahmoud Eldessouki', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ahmed Mohamed Erfan Slim', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ahmed Mohamed Galal Mohamed Abdelrahim', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ahmed Mohamed Hussein Mohamed', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ahmed Mohamed Hussien Mohamed', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ahmed Mohamed Mahmoud Ahmed Alemam', 'General Surgery', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ahmed Mohamed Mohamed Hammad', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ahmed Mohamed Ramdan Khames', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ahmed Mohamed Saeed', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ahmed Mohamed Samir Abdelmohsen Mohamed', 'Radiology', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ahmed Mohamed Sayed Baioumy', 'Obstetrics & Gynecology', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ahmed Mohamed Yousri Mohamed Mohamed', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ahmed Mohammed Ibrahim Ahmed', 'Ophthalmology', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ahmed Mohammed Refaaey Yahia', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ahmed Mohammed Saad Mostafa Elsarag', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ahmed Mohep Elsayed Elhabeby', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ahmed Mohsen Mohamed Abdallah Elmosalamy', 'Obstetrics & Gynecology', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ahmed Morshed', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ahmed Mosaad Anwer Abdeltawab', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ahmed Mostafa Abdellateef Esawi', 'General Surgery', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ahmed Mostafa Mahmoud Manfy', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ahmed Moustafa Ahmed Said Salama', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ahmed Muaan', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ahmed Mubeen', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ahmed Mukhtar Hassan Khater', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ahmed Munazil Najeeb', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ahmed Mustafa Abdelwahab Albayomi Mousa', 'Dermatology', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ahmed Mustafa Yousuf Zai', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ahmed Naeim Atwa Mohamed', 'Family Medicine', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ahmed Nagah Mohamed Shehab', 'Radiology', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ahmed Nihal', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ahmed Nisar', 'Radiology', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ahmed Nishan', 'General Surgery', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ahmed Omar Mohammed Mohammed', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ahmed Oyindamola Ajisafe', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ahmed R Ragab Zubi', 'General Surgery', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ahmed Ramadan Abdelgalil Mohamed Abdelgalil', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ahmed Ramadan Ahmed Mohamed Abdelaal', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ahmed Ramzy Osman Zeater', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ahmed Rasheed', 'Neurology', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ahmed Raza', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ahmed Raza Khan', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ahmed Refaat Elsayed Elkassaby Mahdi', 'Radiology', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ahmed Rishfan', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ahmed Saad Mahmoud Ali Moussa', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ahmed Saber Goda Tohamy', 'Psychiatry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ahmed Sabry Mohamed Mahmoud Shehab', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ahmed Saeed', 'Pulmonology', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ahmed Said Abdelhasib Hussein', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ahmed Saied Osman Saleh', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ahmed Saif', 'Endocrinology', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ahmed Salah El Dein Mohammed Mohammed', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ahmed Salah Saleh Elshorbagy', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ahmed Salaheldin Mohamed Saddik', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ahmed Salama Abdelrahman Okasha', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ahmed Saleem', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ahmed Saleh Rizk Hussein', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ahmed Salem Hassan Eldessouki', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ahmed Salem Mostafa Mohammed Gharieb', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ahmed Samal', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ahmed Sami Sultan Yousef', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ahmed Samir Abdalla Abdelsamie', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ahmed Samir Abdelwahab Abdelhadi', 'Radiology', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ahmed Samir Salaheldin Ali', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ahmed Shabin Mohamed Shahid', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ahmed Shafeeg', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ahmed Shaheed', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ahmed Shammas Yoosuf', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ahmed Shamveel Ibrahim', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ahmed Shaz Palli Veedu', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ahmed Shifaz', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ahmed Shiruaan', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ahmed Soliman Hassan Elsheikh', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ahmed Sunil', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ahmed Swailam Mohamed Mohamed Salem', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ahmed Umar', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ahmed Waheed Ahmed Sadek', 'Obstetrics & Gynecology', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ahmed Yanaal Faroog', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ahmed Younis Mohamed Abdelrazek', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ahmed Younus', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ahmed Zaher Abdelghafar Aly', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ahmed Zaki Sayed Ahmed Ibrahim', 'General Surgery', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ahmed Zayan', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ahmed Ziyan', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ahmed Zooshan', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ahmet Gonen', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. AHMG Nabi', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ahnaf Sadia Mahboob', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ahsan Ali Saeed', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ahsan Furqan', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ahsan Mahmood Chowdhury', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ahsan Shahzad', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ahsan Ul Haq', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ahsan Zaka', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ahthesham Zafar Mohammed', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ahuzam Waheed', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Aida Gasanbekova', 'Obstetrics & Gynecology', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Aida Osama Mohamed Abdelmotaleb Zeidan', 'Nephrology', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Aigbekaen Samson Imaru', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Aijaz Ahmad Mir', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Aijaz Ahmad Wani', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Aijaz Ahmed Mir', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Aijaz Ali Bhatti', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Aijaz Nasir Mohammed', 'Ophthalmology', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Aikaterini Fragkou', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Aiman Mohamed', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Aiminath Ismail', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Aiminath Thoifa Abdul Gafoor', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Aisha Ali Shujaat', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Aisha Musthag', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Aisha Niha Ibrahim', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Aisha Pervaiz', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Aisha Sabitu Mohammed', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Aisha Shamaau Mohamed', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Aishath Abdulla Jameel', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Aishath Adhlee Adil', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Aishath Afa Mohamed', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Aishath Afshath', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Aishath Aina Shahid', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Aishath Ali', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Aishath Alwa Hameed', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Aishath Amany', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Aishath Amila', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Aishath Anaa Hifaz Luthufee', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Aishath Anaan Shafeeu', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Aishath Anoosa', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Aishath Aroona Abdulla', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Aishath Azma', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Aishath Azna Ali', 'General Surgery', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Aishath Azza', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Aishath Eleena', 'Cardiology', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Aishath Faiha Fayaz', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Aishath Farah', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Aishath Fariha Latheef', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Aishath Fazna Saleem', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Aishath Guleysha', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Aishath Hana', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Aishath Hana Zahir', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Aishath Hathima Mohamed', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Aishath Hazleen', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Aishath Hidhaya Efram', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Aishath Ibna Adnan', 'Ophthalmology', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Aishath Inasha Naseer', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Aishath Inaya', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Aishath Isha Abbas', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Aishath Iyath', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Aishath Jaisha Shahid', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Aishath Janaan Ahmed', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Aishath Jazwa', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Aishath Jeneena Amir', 'Ophthalmology', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Aishath Layaana', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Aishath Layal Mausoom', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Aishath Leela Mohamed Didi', 'Radiology', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Aishath Lubna Adam', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Aishath Lyn Athif', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Aishath Maariya', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Aishath Maashy Ibrahim', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Aishath Maeesha', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Aishath Maurisha', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Aishath Meesha Azeem', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Aishath Mihna Mohamed', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Aishath Mihuna', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Aishath Milah', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Aishath Minhath Saeed', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Aishath Musafa', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Aishath Najaa faiz', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Aishath Naura', 'Radiology', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Aishath Naurin Hashim', 'Radiology', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Aishath Neena Shareef', 'Obstetrics & Gynecology', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Aishath Noora Waseem', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Aishath Nuha', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Aishath Raishan Latheef', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Aishath Rameesha Rafeeu', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Aishath Raufa Moosa', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Aishath Razana Rasheed', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Aishath Reema', 'Dermatology', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Aishath Reema Ibrahim', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Aishath Rifqa Shahid', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Aishath Rishma', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Aishath Rizna', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Aishath Ruhushath Hassan', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Aishath Ruvaisha', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Aishath Sa''aa Mohamed', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Aishath Saha Luthfee', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Aishath Salwan', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Aishath Samha Azheem', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Aishath Sausan', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Aishath Sava', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Aishath Sawy Rasheed', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Aishath Shaaznee Rasheed', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Aishath Shafa Ahmed', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Aishath Shafeeaa', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Aishath Shaffaf Ahmed', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Aishath Shaistha Rasheed', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Aishath Shamha Fauzy', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Aishath Shanee Moosa', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Aishath Shaufa', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Aishath Shaufa Musthafa', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Aishath Shauzab Zuhury', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Aishath Shavee', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Aishath Shazra Shafeeg', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Aishath Shibana Ahmed', 'Obstetrics & Gynecology', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Aishath Shiura', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Aishath Shurooq Waheed', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Aishath Siyadha Saeed', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Aishath Sofa Moosa', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Aishath Soifa Shareef', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Aishath Suha Ali', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Aishath Suha Mohamed', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Aishath Suma', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Aishath Suma Abdul Latheef', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Aishath Thasneem Mohamed', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Aishath Thihnan Solih', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Aishath Thooba Abdul Raheem', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Aishath Ulya Musthofa', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Aishath Unadha', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Aishath Wahida', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Aishath Wilaya', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Aishath Wishan', 'Dermatology', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Aishath Yaasimyn', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Aishath Yasmin Mohamed', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Aishath Yumna', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Aishath Yumny Ahmed', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Aishath Yumny Hassan Luthfy', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Aishath Yusriyya', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Aishath Zaain Haleem', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Aishath Zaha', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Aishath Zaha Abdul Sattar', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Aishath Zeen Shareef', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Aishath Zeena', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Aishath Zeena Abdul Jaleel', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Aishath Zeeshan Ahmed', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Aishath Zeeshan Hassan', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Aishath Ziyan', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ajanta Chakravarty', 'Ophthalmology', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ajantha Pathmalal Lokumarambage', 'General Surgery', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ajasmon Padath Abdulkhader', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ajay', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ajay Kumar Gadi', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ajay Kumar Ramachandran Nair', 'Cardiology', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ajay Nathan', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ajay Puri', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ajay Rana', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ajay Rathoon Ilango', 'Nephrology', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ajay Ravi', 'Pulmonology', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ajay Shahi', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ajay T. M. Balaji', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ajaya Regmi', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ajaz Ahmad Mir', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ajaz Ahmed Wani', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ajeesh Basheer', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ajeet Kumar', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ajit Bhaiyasaheb Gadekar', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ajit Kumar Yadav', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ajit Mathew Thomas', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ajita Pandey', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ajith Mohan Madhavan Nair', 'Ophthalmology', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ajith Mohanan Nair', 'Neurology', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ajith Ravindran', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ajith Sreedharan Sudha', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ajitha Bhanu Leela', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ajmal Abdul Rahim Nadeera Beevi', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ajmal Iqeek', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ajmal Khan', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ajmal Latif', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ajo Mariamma Achankunju', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Aju Azhakesan', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Akanksha Jain', 'Obstetrics & Gynecology', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Akash Khanal', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Akash Menan Lakshmanan', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Akash Siddharam Pujari', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Akhil Dev Vats', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Akhil Pulukkol Veettil', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Akhila Binoy', 'Obstetrics & Gynecology', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Akhila Chagalamari', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Akhilesh Kumar Jha', 'Radiology', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Akhtar Raza Khan Noomani', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Akhther Hussain Mirza', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Akm Ariful Islam', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Akmal Shahzad', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Akram Elwy Ahmed Ali Elmeligy', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Akram Mohammed Mohammed Abdelwahab', 'General Surgery', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Akriti Shrestha', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Akshara Purushothaman', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Akshat Mishra', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Akshay Agarwal', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Akshay Chandra Rath', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Akshay Ochhavbhai Parikh', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Akther Manzoor', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Akula Shashidhar', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Al Amin Bin Mohamad Daud', 'General Surgery', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Al Monsur Sarkar', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Alaa Amireldawla Abdelfattah Attia', 'Pediatrics', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Alaa Eid Abdelkader Elsayed Eid', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Alaa Hassan Ahmed Oraby', 'Radiology', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Alaa Helmy Sherkawi Louza', 'Obstetrics & Gynecology', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Alaa Magdy Abdelmordy Zidan', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Alaa Mohamed Saad Abdelkader', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Alaa Reda Amin Sadek Elbestawy', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Alaaeldin Salah Helal Bahnassawy', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Alagarsamy Kannan', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Alain Hernandez Padron', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Alam Gul Shinwari', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Aleena Ali', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Alessandra Maria Martino', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Aleti Vidya Sagar Reddy', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Alex Vergis C. George', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Alexander Eason', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Alexander Vander Cruysse', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Alexander William Hoyes- Cock', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Alexandra Andras', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Alga Tepliakova', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Alhassan Ali Abdelfattah Ali Hediah', 'Cardiology', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Alhassan Mohamed Hassan Mohamed', 'General Surgery', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ali', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ali  Nazeem', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ali A. M. Abuabdall''ah', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ali Aafee', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ali Abdulla Latheef', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ali Adnan', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ali Afzal', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ali Ahmed Abdelhafiz Abdelsamea', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ali Arsalan Memon', 'Psychiatry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ali Asghar Qureshi', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ali Asim', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ali Azam Muhammad Morshed', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ali Eeman Mohamed', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ali Elhadi Elmokhtar Gheit', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ali Elkotb Soliman Zalalo', 'Psychiatry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ali Elsaid Elsaid Elsayed Sharaf', 'Radiology', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ali Faraj Ali Nassr', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ali Hamad', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ali Ishtiaq', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ali Iyaz Rashid', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ali Mafaz Rasheed', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ali Maniu Saeed', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ali Mohd Lone', 'General Surgery', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ali Muhammad Qazi', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ali Muruthala', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ali Muznee', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ali Nashwan Naseem', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ali Nawaz', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ali Nawaz Abbasi', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ali Niaz', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ali Niyaf', 'General Surgery', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ali Ragab Ali Ahmed Elrefaey', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ali Rauf', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ali Raza', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ali Raza Syed', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ali Riyah Mohamed', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ali Saudhaan Shareef', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ali Shafeeq', 'Cardiology', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ali Shahbaz', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ali Shahid Mohamed', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ali Shareef', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ali Shujaat Iftikhar', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ali Siyan', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ali Soffar Mohamed Hassan Soffar', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ali Taha Mohamed Arafa', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ali Tariq', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ali Ullaha', 'General Surgery', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ali Yaafiu', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ali Zaadhee', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Alice Bwa', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Aliem Naqui Mohammed Minathullah', 'Gastroenterology', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Alina Ahmad', 'Obstetrics & Gynecology', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Alina Singh', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Alisha Joshi', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Alisha Shrestha', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Aliu Gbolahan Durojaye', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Aliza Ijaz', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Alka Kumari', 'Obstetrics & Gynecology', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Alla Savycheva', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Alla Shakir', 'Neurology', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Allen Vetharaj Hepzibahrajam', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Almas Adnan Ismail', 'Ophthalmology', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Almubarak Babikir Ahmed Alabbass', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Alna Anal Kalloor Arnold', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Alok  Kumar', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Alok Jha', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Alok Kumar', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Alok Kumar Tiwari', 'General Surgery', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Alok Shukla', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Alphonsa Ashlin Mary', 'Ophthalmology', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Alsaghier Dehoom Alsghier Alforjani', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Alsayed Taha Taha Alspagh', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Altaf Hassan Gani', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Altaf Hussain', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Altaf Hussain Bhat', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Altaf Hussain Dar', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Altaher Ahmad Aref Higazy Abdelalem', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Althaf Adnan Ismail', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Aly Mohamed Abdallah Abdelgawad', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Amal Ameen Mohammed Mahyoub Al-Maaini', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Amal Basnet', 'Rheumatology', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Amal Faragalla Ayoub Elsaid Sobh', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Amal Hamid', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Aman Gupta', 'General Surgery', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Aman Yadav', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Amani Said Mohamed Hassanein Mansour', 'Obstetrics & Gynecology', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Amanullah Siddiqi', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Amany Aldesokey Kamel Mohammed Sayed Ahmed', 'Family Medicine', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Amar Deep Saasan', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Amarendra Kumar Yadav', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Amarnath Chandrasekhar', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ambike Abhijit Sharadchandra', 'Obstetrics & Gynecology', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ambreen Aziz', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ambreen Hyder', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ameen Shams Mohammed', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ameera Abdul Raheem', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ameet Kumar', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Amen Fatima Siddiqie', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Amer Mansour Rhoma Jaffal', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Amer Saeed', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Amgad Lotfy Kabel Temraz', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Amimul Ehsan', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Amina Usmani', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Aminath Abdulla Jameel', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Aminath Aboobakur', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Aminath Afaa', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Aminath Afaa Mohamed', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Aminath Ahmed Naseer', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Aminath Aineeza Ali', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Aminath Aleefa Abdul Gani', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Aminath Ali', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Aminath Amaal', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Aminath Amsha', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Aminath Anana Mohamed', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Aminath Anees', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Aminath Arifa', 'Radiology', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Aminath Asma', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Aminath Asna', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Aminath Ausanee Abdhulla', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Aminath Dhauha', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Aminath Dhunya', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Aminath Dhunyana', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

COMMIT;
