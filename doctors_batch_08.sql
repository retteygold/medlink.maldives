-- Doctors SQL Batch 8 of 19
-- Contains 500 doctors

BEGIN;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kamlesh Raj', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kamlesh Thapliyal', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kamran Ahmad Cheema', 'General Surgery', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kamran Hussain Soomro', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kamran Uqaili', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kamranul Haque', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kamrun Nahar', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kamrun Nesa Chandni', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kamruz Zahan', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kanagarangam  Paramasivam', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kanakapura Ramaswamy Nagaraj', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kanasani Rama Mohan Rao', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kanchan Dahal', 'Psychiatry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kanchan Dhungel Adhikari', 'Radiology', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kanchan Labh', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kandasamy Velmurugan', 'Orthopedic Surgery', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kandula Sri Ram Kumar', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kanimozhi Selvam', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kaniz Fatema Badhon', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kanji', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kannan Mavila', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kannika Wattanajitseree', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kanniraj Marimuthu', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kanwar Banuj Sharma', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kapil Sunderkant Kulkarni', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kapila Mani Sharma', 'Radiology', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kareem Magdy Osman Khalil Zaghloul', 'Radiology', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kareem Mamdouh Abdelrahman Mahmoud Ali', 'Obstetrics & Gynecology', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kareem Mohamed Moustafa Mahmoud Elmansy', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kareem Mohammed Hamdy Ibrahim Moubarak', 'Obstetrics & Gynecology', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kareem Muhammad Muhammad Ali', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Karikkot Biju Bahuleyan', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Karim Elsayed Mohamed Elsayed Ghonim', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Karim Emadeldin Youssef Khalifa', 'General Surgery', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Karim Kara', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Karim Moustafa Metwalli Sayed Ahmed Abouhabiba', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Karim Salah Mahmoud Ahmed Mahmoud', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Karim Taha Saied Abdelwahab Hassanin', 'Radiology', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kariman Kamel Sobhy Mohamed', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Karjome Lama', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Karmendra Kumar Yadav', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. karra Hanumantha Reddy', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Karthickeyan Duraisamy', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Karthik Ramasamy', 'General Surgery', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Karthik Surendran', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Karthika Arun Babu', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Karthikeyan Dhanapal', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Karthikprasad Sivaswamy', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Karukutla Naresh', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Karunakar Muppaneni', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Karunakaran Shashidharan', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Karunanandham Radhakrishnan', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kasamalla Narayana', 'Dermatology', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kashif Ali Akhund', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kashif Ghani Khan', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kashif Maqsood', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kashif Minhas', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kashif Sarfaraz', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kashini Vidushika Abeyratne', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kasi Reddy Gongalreddy', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kasi Vishwanath Surabhi', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kasif Raza Kazi', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Katampotu Covilakam Balachandran', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kate Marie Purugganan', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kateryna Duda', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kathirvel Pandian', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kaung Myat Thu Kyaw', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kaung Myat Zaw', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kaung San', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kaung Xatt', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kausalya Prathaban', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kauser Mahmood', 'Neurology', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kaushal Kishore Tiwari', 'General Surgery', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kaushal Samir Kadam', 'Obstetrics & Gynecology', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kaushalya Harshad Ghorpade', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kausik Kumar Deb', 'Ophthalmology', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kavali Sreenivasa Murthy', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kavarthapu  Venkateshwarulu', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kavita Saravana Kannan', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kavitha Karunakaran Subagunasekaran', 'Obstetrics & Gynecology', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kaviyarasu Sundharam', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kawsar Mahmud', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kawser Ahmed', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kawser Ahmed Chowdhury', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kawsher Rahman', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kay Khine Nyein', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kazi Arifa Binta Ashraf', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kazi Farhana Azam', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kazi Kismat Ara', 'Obstetrics & Gynecology', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kazi Mokabbir Ahmad', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kazi Muntoha Mehnaz', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kazi Nazia Rahman', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kazi Sarfaraznavaz Ahemadhusen', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kedar Shashikant Sathe', 'Ophthalmology', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kedarnath Kashinath Karpe', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kedarnath Nakkalahalli Seshappa', 'General Surgery', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kee Bang Heng', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Keerthana Valsaraj', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kelash Kumar', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kelash Kumar Jesrani', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kempanna Krishnappa', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kennath Dcunha', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kenneth Chinedu Nwosu', 'General Surgery', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kesavapillai Vishwanathan Nair', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Keyur Jatin Trivedi', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. KH Shoaib Ibne Zaman', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Khadeeja Ibrahim', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Khadeeja Nasifa', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Khadeeja Shahanee', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Khadheeja Abdulla', 'Radiology', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Khadheeja Naseer', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Khadheeja Shany Ali', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Khadheejath Saamira', 'Psychiatry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Khadim', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Khadiza Majumder', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Khair Muhammed', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Khairy Abdelshafy Elsayed Elsayh', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Khaja Mohinuddin Salar B.M', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Khaled Abdel Aziz Hamdy Elsayed Diwan', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Khaled Abdullah Rage', 'General Surgery', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Khaled Fahmy Mohamed Ali', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Khaled Fayed Ibrahem Mohamed Hakam', 'Dermatology', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Khaled Hamdy Elnabawy Elshafaay Ghanem', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Khaled Mohamed Adel Arafat Abdelhalim', 'Radiology', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Khaled Mohamed Ali Aboelkhair', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Khaled Mohamed Osama Mostafa', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Khaled Rizk Elsayed Aboelenein Elsayyad', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Khaled Shehata Ali Elshaer', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Khalid Abdelmaboud Mohamed Tawfik Abdelaziz', 'Obstetrics & Gynecology', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Khalid Ahmed', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Khalid Bashir', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Khalid Ibrahim Metwally Helal Shedeed', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Khalid Mohamed Mohamed Hassan Abdelshafy', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Khalid Sharif Khan', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Khalid Yousuf', 'Family Medicine', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Khalida Jamal', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Khalida Wali Memon', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Khalil Ur Rehman Muhammad Yousaf', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Khalil-Ur-Rehman', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Khaliq Ur Rahman Mir', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Khambir Shrestha', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Khan Imran', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Khan Mohammad Shafi', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Khan Muhammad Ashrafuzzaman', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Khan Qamar E Alam MD Murutuza Khan', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Khan Shakeel Ahmed Nasibullah', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Khataumal Lohana', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Khaulath Mohamed', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Khawar Ali', 'Urology', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Khin Chaw Su Nyein', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Khin Hnin Phyu', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Khin Khin Kyourk', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Khin Maung Pyae', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Khin Myat myat nway', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Khin Nyein Chan', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Khin Nyein Myat @ Khin Sein Thant', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Khin Thet Su Hnin', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Khin Win Myint', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Khine Kyaw Ngyein Chan', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Khine Mar Htun', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Khine Moe Pwint', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Khine Sabai Kyaw', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Khine Su Kyi', 'General Surgery', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Khine Wint Yee Toe', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Khirabdhi Nayak', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Khizra Iftikhar', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Khodayar Shapoor Yeganegi', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Khondker Liaquat Ali', 'Ophthalmology', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Khrystyna Rudnitska', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Khubaan Jamshed', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Khudeja Abid', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Khurram Shahzad', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Khurshid Ahmad Bhat', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Khurshid Alam Ansari', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Khushboo Kumari Panday', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Khushi Mohammad', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Khushnama Begam', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kingsley Anietie Akpan', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kinza Qamar', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kiran Aryal', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kiran Ashok', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kiran Chandra Patro', 'Nephrology', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kiran Dhanjibhai Patel', 'Radiology', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kiran Harishchandra Gabhane', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kiran Honnalingaiah', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kiran Joshy', 'Dermatology', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kiran Khatri', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kiran Kumar Krishnamurthy', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kiran Kumar Satti', 'Oncology', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kiran Kumar Shah', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kiran Kumari Anagandula', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kiran Mahadeo Jadhav', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kiran Maribashetti', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kiran Nauman', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kiran Niraula', 'General Surgery', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kiran Shahi', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kiran Shivalingappa Tippannavar', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kiran Singh Shapam', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kiran Subedi', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kiran. V. Neswi', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kirankumar Dinkar Bhosrekar', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kirity Mazumdar', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kirthika Gnanasekaran', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kirubakaran Natesan', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kisalay Saurav Jha', 'Dermatology', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kishan Prasad Shah', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kishor Kumar Bohara', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kishor Thapa', 'General Surgery', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kishore Kumar', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kishore Kumar Paul', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kishore Sasi Geetha Kumari', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kitty Elizabeth Mammen', 'Obstetrics & Gynecology', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kizhakkebhagathu Ajit Joy', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ko Ko Kyaw', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kolade Emmanuel Ogunbusuyi', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kolaj Kattel', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kolauennu Raja Kumar Chani', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Koli Jaya Prakesh', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Komal Khan Durrani', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Konala Srinivasa Reddy', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kondreddi Narayana Prasad', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kongenige Lagithsha Jinod Madushanka Anthony', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kopila Sunwar', 'Obstetrics & Gynecology', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Koppula Ravi Kumar', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Koppula Vara Prasad Rao', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kothai Anbalagan', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kothuru Vydehi', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kotreshappa Basavaraj', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kouser Mohammadi', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kousik Ghosh', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kowshik Das Gupta', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kravchuk Valeriy', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Krishna Chaitanya Kudaravalli', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Krishna Kanth Vinkdoth', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Krishna Prasad Thyagaraj', 'General Surgery', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Krishnakumar Nair', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Krishnamoorath Arun', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Krishnamoorthy Venkatesh', 'General Surgery', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. krishnendu Ghosh', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Krishu Adhikari', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kristel Tierra Morales', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kristjan Vaart', 'General Surgery', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kritagya Chand', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kritendra Raj Sharma', 'General Surgery', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kriti Devkota', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kritina Singh', 'Obstetrics & Gynecology', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kshitiz Karki', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kuberakani Malar Vizhi', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kukil Mahanta', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kuldeep Singh Sain', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kulkarni Supriya Pradeep', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kulla Singh Okram', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kulsuma Haque', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kumar  Venkatesh', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kumar Mulkad Prabhu', 'General Surgery', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kumar Niraj', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kumar Prabhu Mulkad', 'Urology', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kumar Saurav', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kumar Shrestha', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kumar Titas Das', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kundan Kumar Singh', 'Ophthalmology', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kundan Singh Karki', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kundankumar Uttambhai Tandel', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kunjan Kumar Sharma', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kunjappan Sunil Kumar', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kunjoraj Singha', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kuntumalla  Venkateshwarlu', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kuppusamy Chetty Subburaman', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kuriakose Antony', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kurinjinathan Semmampalayam Palanisamy', 'Psychiatry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kyatham Kalyani Swamy', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kyaw Htet Tin', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kyaw Naing Soe', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kyaw Soe Lwin', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kyaw Swar Win', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kyaw Zaya', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kyaw Zin Aung', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kyaw Zin Win', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Kyawt Thirimaw', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Lae Lae Zaw', 'Emergency Medicine', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Laila Murad', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Laithan Ibohal Singh', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Lakshmanan Saravanan', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Lakshmi Prasanna Sai Kumar Doradla', 'Nephrology', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Lakshmi Prathyusha Kosuri', 'General Surgery', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Lakshmi Tulasi Duggisetty', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Lakshmi Vankela', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Lakshmipathy Rajaram', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Lakshni Shekar', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Lal  David', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Lal Muhammad', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Lalith Sirimevan Wijayaratne', 'Rheumatology', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Lall Hussain Mughal', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Lallaindra Viranjan Gooneratne', 'Pathology', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Lamhaa Adam', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Latha Abhay Bhagwat', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Latha Mageswari Palanivelu', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Latt Wah lu Aung', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Laurentiu Gologan', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Lavakumaran  Govender', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Lawson Ifeanyi Eya', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Laxman Gupta', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Laxmi K C', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Laxmi Kanta Biswal', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Laxmi Prasad Dhakal', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Lay Lay Nwe', 'Radiology', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Le Yee Maung', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Leela Lakshman', 'Ophthalmology', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Leela Ram', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Leen Ibrahim Saleem', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Leena Saleem', 'Obstetrics & Gynecology', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Leena Smita', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Leh Leh Khaing', 'Radiology', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Lekha Sanel Singh', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Lenka Cervenova', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Leuby Portuondo Bandera', 'General Surgery', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Li  Fusheng', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Liang Lingyi', 'Ophthalmology', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Liaqat Ali', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Lidiia Kotok', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Lijo Alias', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Liliana Garcia Ricardo', 'Psychiatry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Lin Haotian', 'Ophthalmology', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Lin Htet Tun', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Lin Swe Htet', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Lingabathina Mohan Rao', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Linn Zaw Win', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Lional Raj Daniel Raj Ponniah', 'Ophthalmology', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Lipin Lal Ravichandra Thankamani', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Lisa Neupane', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Lisaj Thuvana Parambath', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Liudmyala Lobasova', 'Obstetrics & Gynecology', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Livtar Singh Heer', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Liyakathali K.C.', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Liyakhat Ali', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Liz George', 'General Surgery', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Loay Salah Yahia Mohammed', 'Orthopedic Surgery', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Loghesh Jothikumar', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Lohya Sabu', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Lokendra Singh.N', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Lokesh Bathala', 'Neurology', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Lokesh Jha', 'General Surgery', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Lokesh Suryanarayanan', 'General Surgery', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Loknath Poudel', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Lorance Peter', 'Gastroenterology', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Louise Caroline Rydmarker', 'General Surgery', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Lourdes Pravina L N Vasagam', 'Neurology', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Loutfi Gamal Eldin Ahmed Metwalli', 'Obstetrics & Gynecology', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Love Kumar Tomar', 'Psychiatry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Lovendra Narayan Shah', 'General Surgery', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Lubna Gulnaaz', 'Obstetrics & Gynecology', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Luc Laurent Jeannin', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Luciano Mutti', 'Oncology', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ludmila Leontieva', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Luther King Morancil', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Lwin Hsu wai', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Lynda Enobong Jimmy', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. M.  Subramanian', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. M. A. Awal Chowdhury', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. M. A. Jannat Khan Khadem', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. M. Laksimi Narasimhan', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. M. Rama Krishna Reddy', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. M. Shiek Abdul Kader', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. M. Vamsi Krishna', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. M.A. Srihari', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. M.Ashik Niamudulla', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. M.P Devika Krishnan', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. M.R. Shamudheen', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. M.Sona Rajan', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. M.Suresh Chandra Nanaji', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. M.U.P.K  Peris', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. M.V.Deepak', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. M.Vallinachiyar', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ma Jin', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. MA. Barbara Poso', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Ma''ani Fathulla Ismail', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Maahenaz Mohamed Didi', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Maasha Abdul Haadhy', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Maasha Ahmed', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Maasha Mohamed Didi', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Maddumage Nilupul Perera', 'Neurology', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Madhan Kumar Rathinasabapathi', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Madhav Chandran Balachandran', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Madhavmanoj Karunakaran', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Madheeh Mohamed Hussain', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Madhiha Mukhthar', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Madhu Kallath', 'Pulmonology', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Madhu Raj Niroula', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Madhu Sairam Raghunathan', 'Radiology', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Madhu Sreedharan', 'Cardiology', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Madhu Sudana Rao Puli', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Madhu Sudhan Dhakal', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Madhu Sudhana Rao Chilakapati', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Madhukar Jagannath Shinde', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Madhumitha Krishnan', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Madhur Eshwar Rao Basude', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Madhuri Gubbala', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Madhuri M. Netke', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Madhusudan Govindan Kutty Menon(Mohamed Latheef)', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Madhusudana Rao Pinjala', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Madhusudhanan Jegadeesan', 'General Surgery', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Maeesha Solih', 'Radiology', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Magdi Hamdi Abdelkhalek hussein', 'Obstetrics & Gynecology', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Magdy Shehata Mohammed Fayed', 'General Surgery', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Maged Mahmoud Abdel Ghani Abu Hazima', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Magimairaj David Jayapal', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Magnus  Olof Odquist', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Mah E Sundus Amin', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Mah Rukhsh Butt', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Maha Abdul Azeez', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Mahaa Waheed', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Mahaboob Ali Shaik', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Mahadevan Nandakumar', 'Ophthalmology', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Mahadi Hasan Shipu', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Mahajan Parag Suresh', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Mahamad Sahabuddin', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Mahamuda Anwar', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Mahamudur Rahim Shaown', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Mahanthesh Yalodahalli Denyanaik', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Mahapatra Bhabani Sankar', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Maharshi Maitra', 'Ophthalmology', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Maharunnessa', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Mahboob Al Shahed Masoom', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Mahbuba Akand', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Mahdi Mohamud Sahal', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Maheen Khan', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Mahendra Mohan Kamat Ghanekar', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Mahendra Rajan', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Mahendra Singh Pawar', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Mahesh  Chandra', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Mahesh Basanagauda Mudhol', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Mahesh Koirala', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Mahesh Kumar', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Mahesh Kumar Kota', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Mahesh Kumar Oad', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Mahesh Maheshwari', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Mahesh Perikkathra', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Mahesh Rajeeva Shetty', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Maheswarappa M. Gowda', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Mahfooza Moosa', 'Dermatology', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Mahfujul Ahmed Riad', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Mahfuzur Rahman', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Mahima Indulkar', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Mahjabeen Aftab Solaiman', 'Psychiatry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Mahjabin Joarder', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Mahmood Ahmed Khan', 'Dentistry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Mahmood Ghazanwy', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Mahmoud Abdallah Abdallah Metwally Fayed', 'Ophthalmology', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Mahmoud Abdallah Aboelmakarem Elashkar', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Mahmoud Abdelaal Ibrahim Abdelaal', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Mahmoud Abdelaziz Abdelmaaboud Abdelhady Harb', 'Obstetrics & Gynecology', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Mahmoud Abdelaziz mohamed elsenouci abass', 'Obstetrics & Gynecology', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Mahmoud Abdelaziz Mohamed Elshahawy', 'General Surgery', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Mahmoud Abdelfatah Elsaid Ellebody', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Mahmoud Abdelghaffar Abdelghaffar Ali Elhalwagy', 'Obstetrics & Gynecology', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Mahmoud Abdelhamid Masoud Rhodes', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Mahmoud Abdelnabi Mohamed Saied Ahmed Elsharkawy', 'Obstetrics & Gynecology', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Mahmoud Abdelraheem  Abdelsalheen', 'Obstetrics & Gynecology', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Mahmoud Abdelraouf Mostafa Mohamed', 'Radiology', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Mahmoud Abouzeid Mohamed Abouzeid', 'Radiology', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Mahmoud Ahmed Ibrahim Abozahra', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Mahmoud Ahmed Mohamed Ahmed Ali Elshafei', 'Obstetrics & Gynecology', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Mahmoud Alaa Abdelrehim Abdelaal Abouheif', 'Radiology', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Mahmoud Arafa Abdulrahman Abdulaal', 'Radiology', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Mahmoud Darwish Mahmoud Darwish', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Mahmoud Ebrahim Mahmoud Galala', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Mahmoud Elsaid Rashad Abdelkhalek Elazzab', 'Dermatology', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Mahmoud Elsayed Ali Nasreldin Abbas', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Mahmoud Farghal Marie Ali', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Mahmoud Hamdy El Sayed Abdel Magied', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Mahmoud Hany Abdelaziz Ahmed', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Mahmoud Ibrahim Mohamed Elsayed Hussein', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Mahmoud Khaled Khallaf', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Mahmoud Magdy Saied Elsayed Mohamed', 'Radiology', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Mahmoud Mamdouh Hafez Breeka', 'Orthopedic Surgery', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Mahmoud Mohamed Abbas Abdelrasoul', 'Obstetrics & Gynecology', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Mahmoud Mohamed Abdelfattah Ismail', 'Radiology', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Mahmoud Mohamed Abdelmoneim Mahmoud Elhefnawy', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Mahmoud Mohamed Ahmed Ali', 'Radiology', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Mahmoud Mohamed Ahmed Mohamed Abdelaal', 'Psychiatry', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Mahmoud Mohamed Mohamed Hussein', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Mahmoud Mohamed Sobhy Mostafa', 'Obstetrics & Gynecology', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Mahmoud Mohammed Abdelfatah Mohammed Akl Elokl', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Mahmoud Mohammed Mahmoud Hanafy Ali', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Mahmoud Mohammed Mahmoud Mekkawy', 'General Surgery', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Mahmoud Mohammed Mohammed Mohammed Gado', 'General Surgery', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Mahmoud Nady Hassan Mostafa', 'Radiology', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Mahmoud Nagi Mohamed Selim', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Mahmoud Nashaat Fadl Mahmoud Sharafeldin', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Mahmoud Rabie Mohamed Gabr', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Mahmoud Ragab Gomaa Youssef Nagla', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Mahmoud Ramadan Elsayed Elsayed Badr', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Mahmoud Said Mohammed Ahmed', 'Radiology', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Mahmoud Samir Abd  El Azeem El Said Mikawy', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Mahmoud Samir Abd El Azeem El Said Mikawy', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Mahmoud Sayed Ahmed Mohamed Awad', 'Ophthalmology', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Mahmoud Sayed Ahmed Mohammed Saad', 'Obstetrics & Gynecology', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Mahmoud Younis Hassan Mohamed', 'General Surgery', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Mahmud Sani Umar', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.doctors (name, specialty, is_active, hospital_id, hospital_name)
VALUES ('Dr. Mahmudul Hasan', 'General Practitioner', true, NULL, 'Independent Practice')
ON CONFLICT (name) DO NOTHING;

COMMIT;
