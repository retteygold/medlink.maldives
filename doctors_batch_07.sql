-- Doctors SQL Batch 7 of 19
-- Contains 500 doctors

BEGIN;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Hossam Ahmed Ahmed Abdelkarim', 'General Surgery', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Hossam Elsayed Abdelgany Mohamed Abdelaaty', 'Psychiatry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Hossam Hashem Elsayed Hashem', 'Radiology', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Hossam Helmi Zahei Eldeen Tameem', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Hossam Mahmoud Mohamed Kamal Abdellatif', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Hossam Mohamed Abbas Mohamed', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Hossam Mohamed Shaaban Marei', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Hossam Mohamed Shabaan Marei', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Hossam Shehata Ali Elshaer', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Hossam Zakaria Mohamed Ali Tantawi', 'Ophthalmology', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Hossna Begum', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Houd Bashir', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Hsu Eaint Phyo', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Hsu Hsu Wai', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Hsu Pwint Phyu', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Hsu Wut Yee Linn', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Hsu Zin Win Than', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Htar Htar Hlaing', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Htein Lin Aung', 'General Surgery', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Htet Htet Khine', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Htet Htet khine', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Htet Htet Lwin', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Htet Htet Win', 'Emergency Medicine', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Htet Wai Linn', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Htin Kyaw Aung', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Htin Lin Aung', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Htoo Aung Naing Shwe', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Htoo Kyaw Khant', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Huang JingJing', 'Ophthalmology', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Hudha Adam', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Hudha Adam Saeedh', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Hukum Singh Bhattarai', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Huma Ashrafi', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Huma Batool', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Humaid Ali', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Humaira Ayub', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Humaira Farooq', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Humayoon Jehan', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Humayra Bashir Bhat', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Humayun Rajib', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Humera', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Huseyn Hadiyev', 'General Surgery', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Husnain Ali Shahid', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Husnain Basharat', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Hussain Faisal', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Hussain Hameed', 'General Surgery', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Hussain Hazim Zareer', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Hussain Hilmy', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Hussain Juman Jaleel', 'Obstetrics & Gynecology', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Hussain Mahir Ibrahim', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Hussain Mohamed Fulhu', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Hussain Muthasim Adnan', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Hussain Nazif', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Hussain Nazrath', 'Dermatology', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Hussain Samah', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Hussain Shahuzan Mohamed', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Hussain Shakeel', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Hussameldin Mustafa Muhamed Sayed Ahmed', 'General Surgery', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Hussein Hanafy Mahmoud Ibrahim', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Hussein Mohamed Hussein Ibrahim', 'Psychiatry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Hussein Nasser Hussein AbdulHakeem', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Hussien Reda Ezzat Ghazi Eisa', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Hyder Memon', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ibraahim Misbaah', 'General Surgery', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ibrahem Lotfy Abdulsalam Abulazm', 'General Surgery', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ibrahiem Ahmed Mahmoud Ibrahiem', 'General Surgery', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ibrahim  Didi', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ibrahim Adhil', 'General Surgery', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ibrahim Afzal', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ibrahim Ahmed Razee', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ibrahim Basha Jahangir', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ibrahim Basyouney Ibrahim Husain', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ibrahim Didi', 'Psychiatry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ibrahim Fahumee', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ibrahim Faisal', 'Endocrinology', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ibrahim Ghassan Ahmed', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ibrahim Hamadh Salim', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ibrahim Hassan', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ibrahim Iyaz', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ibrahim Jaufar', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ibrahim Kamel Mohammed Madkour', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ibrahim Lubab Mohamed', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ibrahim Mahmoud Ibrahim Hassaan', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ibrahim Maishan', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ibrahim Mohamed', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ibrahim Mohamed Fayek Ibrahim', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ibrahim Mohammed Ibrahim Helal', 'General Surgery', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ibrahim Mohammed Mohammed Eldyahi', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ibrahim Moomin', 'General Surgery', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ibrahim Rasheed', 'Radiology', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ibrahim Saeed', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ibrahim Saleem Abdulla', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ibrahim Shareef', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ibrahim Shibl Ibrahim Shehabel Din', 'Radiology', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ibrahim Shiham', 'Nephrology', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ibrahim Solah Shareef', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ibrahim Soliman Ibrahim Soliman Eid', 'Obstetrics & Gynecology', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ibrahim Sujau', 'Rheumatology', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ibrahim Waheed', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ibrahim Yasir Ahmed', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ibrahim Zayan Mohamed', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ibrahim Zimam Azim', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ibthisaam Ibrahim', 'Internal Medicine', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Idhana Ahmed Khaleel', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ifreke Cosmas Essien', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ifteqarul Islam Mohammad Faisal', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Igbal Ali Khan', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Igor Peryk', 'Obstetrics & Gynecology', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ihsaan Adam Fulhu', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ihsan Ahmed Soomro', 'Neurology', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ihsan Ullah', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ihudhaulla Saeed', 'Neurology', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ihusana Shareef', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ijaz Ashraf', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ijeoma Angela Ekezie', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ikenna Godwin Ezugwu', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ikram Baig', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ikram Ul Haq', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ikram Ullah', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ikuleel Shareef', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ilango Sethu', 'General Surgery', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ilankumaran Chidambaram Nataraja Perumal', 'General Surgery', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ilavarasan Kannaiyan', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ilham Shareef', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ilyas Abdulla', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Imad Sheiban', 'Cardiology', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Imamuddin', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Iman Hakim Din', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Iman Moustafa Othman Othman Elgendi', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Imomoton Cyrax Okoya', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Imran', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Imran Akhtar', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Imran Amin', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Imran Bari', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Imran Haider', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Imran Hassan', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Imran Mohamed Adam', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Imru-AL-Quais Chowdhury', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Imteyaz  Mohsin', 'Ophthalmology', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Imteyaz Ahmad', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Imthiyaza Abdullah', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Imtiaz Ahmed', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Imtiyaz Ahmad Zaki', 'General Surgery', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Imtiyaz Khan', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Inam Ullah', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Inaya Abdul Raheem', 'Obstetrics & Gynecology', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Inayathullah Hussaini Syed', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Indrajith Maithri De Zoysa Gunasekera', 'General Surgery', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Indranil Dutta', 'Obstetrics & Gynecology', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Indu Chandrasekhran', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Induruwage Bimal Jayantha', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ingrid Kelters', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ingrid Mornarova', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Innama Dilshad Alam', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Innayath Kabir', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Insiya Anjum Rizvi', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Inuganti Anil Kumar', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Inuganti Deepa', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Inukoti Vamsi Krishna', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ippsita Das', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Iqbal Anwar Mohammed', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Iqbal Hamied Hakim', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Iqbal Hussain', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Iqbal Singh', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Iqra Amjad', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Iqra Asghar', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Iqra Ghaffar', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Irene Pecorella', 'Pathology', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Irfan Ahmed Memon', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Irfan Ali', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Irfan Khan', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Irfan Ullah', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Irfana Sharajdeen', 'Obstetrics & Gynecology', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Irina Mazepyin', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Irshad Ahmed', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Irshad Ahmed Khan', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Irtifa Kashem', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Irufan Mohamed Adam', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Irum Ghazanfar', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Iryna Mosiyenko', 'Obstetrics & Gynecology', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Isaac Iype John', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Isaac Sundersen Wilson', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Isfaau Waheed', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Isha Ali', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Isha Passi', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ishafa Firaq', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ishag Shafeeg', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ishfaq Abass Khan', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ishfaq Ahmad Bhat', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ishfaq Ahmad Lone', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ishfaq Ahmed Wani', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ishfaque Naveed', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ishrat Jahan Alo', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ishrat Un Nisa', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ishthiaq Ahmed', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ishtiaq Ahmed', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ishtiaque Ali', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ishu Shrestha', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ishwar Uttamrao Gondse', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ishwor Gurung', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ishwor Raj Devkota', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ishwor Sharma', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Isin Ceken Kocabas', 'Dermatology', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Islam Abdallah Abdelhafez Heikal', 'Radiology', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Islam Abdelmoez Nazim Mohamed', 'Oncology', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Islam Afifi', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Islam Alsayed Abdullatef Ali Abouahmed', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Islam Elsayed Ahmed Mohamed Hassan', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Islam Gamal Ahmed Mahmoud', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Islam Ismail Mohamed Mostafa', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Islam Khaled Nabil Elsyed Gbr', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Islam Maher Ahmed Ashor', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Islam Mohammed Ahmed Mahmoud Wafi', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Islam Saad Ahmed Khattab', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ismael Maher AbdulHakim Ismael', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ismail Adeola Ibuowo', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ismail Adil', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ismail Ajvaad', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ismail Alimange Bidharuge', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ismail Arif Ali', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ismail Asfaq', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ismail Azum', 'Radiology', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ismail Ejaz Ali', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ismail Junaih Shareef', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ismail Latheef', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ismail Mohamed Mujizath', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ismail Nahil Naseem', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ismail Naseem Hussain', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ismail Pulikkodan', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ismail Rasheed Umar', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ismail Sabry Ismail Abdelaal', 'Obstetrics & Gynecology', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ismail Shafeeu', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ismail Zaeem Zahid', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ismail Zahir', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ismat Ullah Abid', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Isra Bhatti', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Israel Hernandez Jimeno', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Israel JR Lim Peralta', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Israr Ahmed', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Issac Immanuel Manickaraj Enoch Margasis', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Iufa Shareef', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Iujaz Hamzah', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Iurii Bazeliuc', 'General Surgery', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ivan Neretljak', 'Urology', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ivet Matos Gongora', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ivora Mendes', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Iyath Saeed', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Iyaz Ahmed', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Iyyani Sreekumar Vipin', 'General Surgery', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Iza Roelle Maniego', 'Obstetrics & Gynecology', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Izatulla Jumaev', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Izhar Ahmad', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Izuhaath Shameem', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Izza Abdul Haseeb', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. J.J.Stalin Jose', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. J.Kiran Kumar', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ja Mann', 'General Surgery', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Jabbar Momin', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Jabeen Ali Shareef', 'Obstetrics & Gynecology', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Jabir Ali', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Jac Jason Jacob', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Jacob Etim Emah', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Jacob John', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Jacquelyn Raymundo Bartolome', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Jadav Bhagawan Anandarao', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Jadhav Bhagawan Anandrao', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Jafar Khan', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Jafer Sadik Nazeer Ahamed', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Jafrin Sultana', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Jag Mohan Singh Rana', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Jagadamba Aswathappa', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Jagadeesan Sadasivam', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Jagadeesh Reddy Kolli', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Jagadish Basaviah', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Jagannath Ghosh', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Jagannath Puttaswamy', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Jagath Chaminda Garusinghe Gamage', 'Endocrinology', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Jagatheesan Muthiah', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Jagdish Lamsal', 'Nephrology', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Jagdish Vishnoi', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Jahangir Ahmad Sheikh', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Jahangir Zaib', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Jai Kishan Jedia', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Jai Parkash', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Jai Prakash Kumawat', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Jaiju Thomas', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Jaikumar Sunil Kumar', 'General Surgery', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Jaileen Dacullo Milar', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Jain Mahendra', 'General Surgery', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Jainendra Kumar.K', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Jaisir Hussain', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Jaison Thomas John', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Jakka Naga sudha Rani', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Jalees Akhtar', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. James Dale Rifenbery', 'General Surgery', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. James Neeruda', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. James Ruddy', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Jamil Chowdhury', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Jamshid Islomov', 'General Surgery', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Jamshida Jan', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Jana Abdulla', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Jana Honsova', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Janak Raj Pandey', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Janakiraman  Raguram', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Janith Chameera Chandrakumara Wasalamuni Arachchillage', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Jannatul Ferdous', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Jannatul Maoya Bashanti', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Janthakal Raghavendra Rao Kulkarni', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Jasjit Kaur Kaushal', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Jasmin Akter', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Jason Ambrose Francis Vedamanickam', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Jaspreet Singh Walia', 'General Surgery', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Jasur Jamilov', 'General Surgery', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Jaswanth Muppalla', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Jatankumar Nathabhai Dudhat', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Javed Ahmad', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Javed Ahmed', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Javed Ali', 'General Surgery', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Javed Salam Ansari', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Javeed Ahmad Bhat', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Javeed Ahmad Sheikh', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Javeed Gownipalli Sirajuddin', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Javeed Munwar', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Javeria Sardar', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Javid Ahmad Ganai', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Javid Ahmed Lone', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Javid Magbool', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Jawad Ahmed', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Jawad Arain', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Jawahar Dhanavel', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Jaya Mani Shrestha', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Jaya Prakash Nath Ambinathan', 'Nephrology', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Jaya Shankar', 'Urology', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Jayadharan J.N Sulochana', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Jayakumar Appekattil Prabhakaran', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Jayalekshmi', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Jayanth Kumar Savanth B.T', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Jayantha Chandrapriya Amarasinghe Wijeratne', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Jayantha Chandrapriya Amarasinhe Wijeratne', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Jayanthy Pavithran', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Jayaprakash Reddy Reddy', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Jayasankar Surendran', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Jayashri Shettibail', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Jayavel Ellappan', 'Ophthalmology', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Jayawant.A.Fuke', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Jaydeep Dahyalal Tank', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Jaydevsinh Makwana', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Jaydip Niyogi', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Jayita Chattopadhyay', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Jean Aswiin Lourde Antoni Doss', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Jeehan Ahmed', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Jeehan Rasheed', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Jeena Baaniya', 'Obstetrics & Gynecology', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Jeena Koduvath Jacob', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Jeetendra Mathur', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Jeevan Thanet', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Jefna Jafar', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Jejo Mathew', 'Orthopedics', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Jemal Girma Mohammed', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Jemuel Abe Frias', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Jenson John', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Jenu .C. Alex', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Jerome Devkumar Robert Siromani', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Jeslin John Justus', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Jesse  Recano Bautista JR', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Jessie Jose', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Jessy Thomas', 'Ophthalmology', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Jetender Kumar', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Jevons Bissong Ojongakpa', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Jewell Kooliyadan Jacob', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Jheenuk Zinat Rahaman', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Jigme Lhamo', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Jihad Hassan', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Jinah Ahmed', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Jinjo John Chiriyankandath', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Jisbinsha Chittilappilly Shaju', 'Orthopedics', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Jishan Rai', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Jitender Kumar', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Jitendra Kumar Yadav', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Jitendra Thakur', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Jithendra Neminat Kutte', 'Ophthalmology', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Jithin Raj Malayil', 'Psychiatry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Jithin Rajeev', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Jiwan Poudel', 'Rheumatology', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Jobayer Ahmed', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Jobeth Thomas', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Jobin Elias', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Jocelyn Yvonne Aguilar', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Joe George', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Johannes Bernard Sturn', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. John Hippon', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. John Ifeanyi Ubimago', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. John Mathew', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. John Nabil Farah Wisa', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. John Paul Wijnberg', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. John Philip Cunnapuzha', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Johnson Raja James', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Johnson Roy', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Jolingi Tata Rao', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Jonajane Quitain', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Jonas Malla', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Jonathan Ikechukwu Amaefuna', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Joon Kumar Shrestha', 'Radiology', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Jorge Frank Hernandez Carballo', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Jos Jasper Gnanasigamani', 'General Surgery', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Jose Luis Jimenez Montero', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Jose Salvador Mijares', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Joseph Balraj Chowranna', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Joseph Jacob', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Joseph Leyon', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Joseph Methew Thachil', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Joseph Mikhael Rizk Hakeem', 'Obstetrics & Gynecology', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Joseph Paily', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Joseph Xavier', 'Ophthalmology', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Joseph Yousry Shafiek Nagieb', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Joshila Chanu Yumnam Bhattarai', 'Obstetrics & Gynecology', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Joshy Ezhuvanparambil Vijayan', 'Neurology', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Jothi Saravana Moorthy', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Jovial D'' Souza', 'General Surgery', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Joy Maxaida P. Quiboy', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Joy Taclas', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Joyce Cameron Stuart', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Joys Sebastian', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ju Jue Shwe Sin Tun', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Juan Alberto Lourido Garcia', 'General Surgery', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Jubayer Ahmed Siddiquee', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Jubida Gulshan Ara', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Jubily Radhakrishnan Unnithan', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Jude Sujeevan Peethamparam', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Juhaina Ajwaad', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Julee Bhandari', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Julfikkar Rahman Borah', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Julian Mujuni Mulokozi', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Jumail Ahmed', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Jumailath Beygum', 'Obstetrics & Gynecology', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Jumanath Ahmed Zahir', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Junaed Rayhan', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Junaid Ahmed', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Junaid Shafiq', 'General Surgery', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Juned Hasan', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Justin Jung Malla', 'General Surgery', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Juwairiya Ahmed', 'Obstetrics & Gynecology', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Jyothi Bullanagouda', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Jyothi Hebbur Ramachandra', 'Nephrology', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Jyothi K C Khatri', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Jyothi Rani Bathula', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Jyothisree Padmanabhan Nair', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Jyoti Gurung', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Jyoti S. Karegoudar', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Jyotshna Yadav', 'Dermatology', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. K M Ashraful Huda', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. K. Ashok  Kumar', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. K. Dilip Kumar', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. K. P Sreedhar', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. K.. Madhan Kumar', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. K.C. Roopashree', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. K.G. Mathew', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. K.J.K. Murali Mohan', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. K.K. Narayanan Namboodiri', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. K.K. Suresh', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. K.M. Halimur Reza', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. K.S Kiran Babu', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. K.Soman Peter', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. K.V. Vijayalakshamma', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. K.V.Prabakar', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kabilar.V', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kabiru Abdullahi', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kabita Adhikari', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kabita Sah Swarnkar', 'Obstetrics & Gynecology', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kachapilly Johnson Joseph', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kadalabal Srinivas Jagadani', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kadur Renuka Sandesh', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kailash Gupta Shah', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kailash Kumar', 'Radiology', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kailash Shah', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kaisar Hamid Shikder', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kaiser Raja', 'Gastroenterology', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kakarla Thota Kanugolu Murali Mohan', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kakkeri Koyakutty Mujeeb Rahman', 'Pulmonology', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kalaivanan Gajendiran', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kalaivani Balakrishnan', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kalana Hareendra Parana Palliya Guruge', 'General Surgery', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kalanidhi Veeraswamy', 'General Surgery', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kalaskar Swapnil Chandrakant', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kaleem Ahmed', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kaleem Ullah Bhatti', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kaleemuddin Shaikh', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kalesh Divakar', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kali Chetty Elavarsan', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kalid Hassen Musa', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kalimuthu Nagappan Ganesan', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kalpadrumm Sukunathan Sunoj', 'General Surgery', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kalpana Balamurugan', 'Obstetrics & Gynecology', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kalpana Kandaswamy', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kalyan Adhikari', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kamal George', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kamal Raj Soti', 'Oncology', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kamala Kanta Das', 'General Surgery', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kamel M.N. Najjar', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kamel Zidane Mohamed Abdou Zidane', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

COMMIT;
