-- Generated SQL to insert hospitals from health_establishments.csv
-- Total hospitals: 584

BEGIN;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('A,Dh. Dhangethi Health center', 'A,Dh. Dhangethi Health center', '3328887', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=A%2CDh.%20Dhangethi%20Health%20center%2C%20%2C%20Maldives', 'Health Centre Grade 3', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('A.A Feridhoo Health Centre', 'A.A Feridhoo Health Centre, Alif Alif Atoll', '3328887', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=A.A%20Feridhoo%20Health%20Centre%2C%20Alif%20Alif%20Atoll%2C%20Maldives', 'Health Centre Grade 2', 'Resort', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('A.A. Maalhos Health Centre', 'A.A. Maalhos Health Centre, A.A.', '3328887', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=A.A.%20Maalhos%20Health%20Centre%2C%20A.A.%2C%20Maldives', 'Health Centre Grade 1', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('A.Dh Dhidhoo Health Centre', 'A.Dh Dhidhoo Health Centre, A.Dh', '3328887', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=A.Dh%20Dhidhoo%20Health%20Centre%2C%20A.Dh%2C%20Maldives', 'Health Centre Grade 1', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('A.Dh Dhigurah Health Centre', 'A.Dh Dhigurah Health Centre, A.Dh', '3328887', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=A.Dh%20Dhigurah%20Health%20Centre%2C%20A.Dh%2C%20Maldives', 'Health Centre Grade 2', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('A.Dh Maamigilee Health Centre', 'A.Dh Maamigilee Health Centre, A.Dh', '3328887', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=A.Dh%20Maamigilee%20Health%20Centre%2C%20A.Dh%2C%20Maldives', 'Health Centre Grade 4', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('A.Dh Mandhoo Health Centre', 'A.Dh Mandhoo Health Centre, A.Dh', '3328887', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=A.Dh%20Mandhoo%20Health%20Centre%2C%20A.Dh%2C%20Maldives', 'Health Centre Grade 1', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('AA. Atoll Hospital', 'AA. Atoll Hospital, AA.', '3328887', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=AA.%20Atoll%20Hospital%2C%20AA.%2C%20Maldives', 'Hospital Grade 1', 'Resort', true, true, true, true, '24 hours', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('AA. Bodufolhudhoo Health Centre', 'AA. Bodufolhudhoo Health Centre, AA.', '3328887', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=AA.%20Bodufolhudhoo%20Health%20Centre%2C%20AA.%2C%20Maldives', 'Health Centre Grade 1', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('AA. Himandhoo Health center', 'AA. Himandhoo Health center, AA.', '3328887', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=AA.%20Himandhoo%20Health%20center%2C%20AA.%2C%20Maldives', 'Health Centre Grade 1', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('AA. Mathiveree Health Centre', 'AA. Mathiveree Health Centre, AA.', '3328887', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=AA.%20Mathiveree%20Health%20Centre%2C%20AA.%2C%20Maldives', 'Health Centre Grade 3', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('AA. Thoddoo Health Centre', 'AA. Thoddoo Health Centre, AA.', '3328887', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=AA.%20Thoddoo%20Health%20Centre%2C%20AA.%2C%20Maldives', 'Health Centre Grade 3', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('AA. Ukulhas Health Centre', 'AA. Ukulhas Health Centre, AA.', '3328887', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=AA.%20Ukulhas%20Health%20Centre%2C%20AA.%2C%20Maldives', 'Health Centre Grade 3', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Aahiyans Medical Clinic', 'Aahiyans Medical Clinic, Aahiyans', '7933326 / 7783818', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Aahiyans%20Medical%20Clinic%2C%20Aahiyans%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Aanugandu Island Resort Clinic', 'Aanugandu Island Resort Clinic, Aanugandu', '3300668', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Aanugandu%20Island%20Resort%20Clinic%2C%20Aanugandu%2C%20Maldives', 'General Clinic', 'Resort', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Aarah Clinic', 'Aarah Clinic, Aarah', '3315236', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Aarah%20Clinic%2C%20Aarah%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Abuharee Medical Centre', 'Abuharee Medical Centre, Abuharee', '9635808', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Abuharee%20Medical%20Centre%2C%20Abuharee%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Addu Equatorial Hospital', 'Addu Equatorial Hospital, Addu', '3328887', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Addu%20Equatorial%20Hospital%2C%20Addu%2C%20Maldives', 'Tertiary Hospital', 'Island', true, true, true, true, '24 hours', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Adh. Atoll Hospital', 'Adh. Atoll Hospital, Adh.', '3328887', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Adh.%20Atoll%20Hospital%2C%20Adh.%2C%20Maldives', 'Hospital Grade 1', 'Resort', true, true, true, true, '24 hours', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Adh. Fenfushi Health Centre', 'Adh. Fenfushi Health Centre, Adh.', '3328887', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Adh.%20Fenfushi%20Health%20Centre%2C%20Adh.%2C%20Maldives', 'Health Centre Grade 2', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Adh. Hangnaameedhoo Health Centre', 'Adh. Hangnaameedhoo Health Centre, Adh.', '3328887', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Adh.%20Hangnaameedhoo%20Health%20Centre%2C%20Adh.%2C%20Maldives', 'Health Centre Grade 1', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Adh. Kurunburudhoo Health Centre', 'Adh. Kurunburudhoo Health Centre, Adh.', '3328887', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Adh.%20Kurunburudhoo%20Health%20Centre%2C%20Adh.%2C%20Maldives', 'Health Centre Grade 1', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Adh. Omadhoo Health Centre', 'Adh. Omadhoo Health Centre, Adh.', '3328887', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Adh.%20Omadhoo%20Health%20Centre%2C%20Adh.%2C%20Maldives', 'Health Centre Grade 2', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('ADK Hospital', 'ADK Hospital, ADK', '1440 / 3313553', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=ADK%20Hospital%2C%20ADK%2C%20Maldives', 'Tertiary Hospital', 'Island', true, true, true, true, '24 hours', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('ADK Hospital Reach Clinic', 'ADK Hospital Reach Clinic, ADK', '9742622', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=ADK%20Hospital%20Reach%20Clinic%2C%20ADK%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Advance Diagnostic Center', 'Advance Diagnostic Center, Advance', '7785320', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Advance%20Diagnostic%20Center%2C%20Advance%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Advance Eye Clinic', 'Advance Eye Clinic, Advance', '3001819', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Advance%20Eye%20Clinic%2C%20Advance%2C%20Maldives', 'Area Specific Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Advance Medical Clinic', 'Advance Medical Clinic, Advance', '3007788', NULL, 'https://www.google.com/maps/search/?api=1&query=Advance%20Medical%20Clinic%2C%20Advance%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('AIMS Diagnostic Care', 'AIMS Diagnostic Care, AIMS', '6898091', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=AIMS%20Diagnostic%20Care%2C%20AIMS%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('AL- KHAIRU MEDICAL CENTRE', 'AL- KHAIRU MEDICAL CENTRE', '7786635', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=AL-%20KHAIRU%20MEDICAL%20CENTRE%2C%20%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Alai Clinic', 'Alai Clinic, Alai', '7800415', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Alai%20Clinic%2C%20Alai%2C%20Maldives', 'Therapeutic Service Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Alai Play and Learn Therapy Center', 'Alai Play and Learn Therapy Center, Alai', '7918157', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Alai%20Play%20and%20Learn%20Therapy%20Center%2C%20Alai%2C%20Maldives', 'Therapeutic Service Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Ali Rasheed Dhivehi Beys Clinic', 'Ali Rasheed Dhivehi Beys Clinic, Ali', '7820213', NULL, 'https://www.google.com/maps/search/?api=1&query=Ali%20Rasheed%20Dhivehi%20Beys%20Clinic%2C%20Ali%2C%20Maldives', 'Traditional Medicine Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Alimatha Clinic', 'Alimatha Clinic, Alimatha', '7795352', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Alimatha%20Clinic%2C%20Alimatha%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Ambience Medical ServicesClosed', 'Ambience Medical ServicesClosed, Ambience', '7633394 / 7926688', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Ambience%20Medical%20ServicesClosed%2C%20Ambience%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('AMG Clinic', 'AMG Clinic, AMG', '9790079', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=AMG%20Clinic%2C%20AMG%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Amilla Sihhath', 'Amilla Sihhath, Amilla', '7799660', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Amilla%20Sihhath%2C%20Amilla%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Amina Dhiyo Health Centre', 'Amina Dhiyo Health Centre, Amina', '3328887', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Amina%20Dhiyo%20Health%20Centre%2C%20Amina%2C%20Maldives', 'Health Centre Grade 1', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Amingiri Clinic', 'Amingiri Clinic, Amingiri', '3324369', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Amingiri%20Clinic%2C%20Amingiri%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Ana''s Aesthetic Clinic', 'Ana''s Aesthetic Clinic', '7771829', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Ana%27s%20Aesthetic%20Clinic%2C%20%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Ananatara Dhigu Clinic', 'Ananatara Dhigu Clinic, Ananatara', '7301312', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Ananatara%20Dhigu%20Clinic%2C%20Ananatara%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Anantara Kihavah Villas Clinic', 'Anantara Kihavah Villas Clinic, Anantara', '7964015', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Anantara%20Kihavah%20Villas%20Clinic%2C%20Anantara%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Angaga Medicals', 'Angaga Medicals, Angaga', '9999991', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Angaga%20Medicals%2C%20Angaga%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Angsana Velavaru Medical Centre', 'Angsana Velavaru Medical Centre, Angsana', '6760028', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Angsana%20Velavaru%20Medical%20Centre%2C%20Angsana%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Asisa Medical Center', 'Asisa Medical Center, Asisa', '3013909', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Asisa%20Medical%20Center%2C%20Asisa%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Athuruga Medical Clinic', 'Athuruga Medical Clinic, Athuruga', '7776440', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Athuruga%20Medical%20Clinic%2C%20Athuruga%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Atoll ClinicClosed', 'Atoll ClinicClosed, Atoll', '7784494', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Atoll%20ClinicClosed%2C%20Atoll%2C%20Maldives', 'General Clinic', 'Resort', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Atolls Guest Clinic', 'Atolls Guest Clinic, Atolls', '7772991', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Atolls%20Guest%20Clinic%2C%20Atolls%2C%20Maldives', 'General Clinic', 'Resort', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Avani Clinic', 'Avani Clinic, Avani', NULL, '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Avani%20Clinic%2C%20Avani%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Ayada Maldives Resort Clinic', 'Ayada Maldives Resort Clinic, Ayada', '6844444', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Ayada%20Maldives%20Resort%20Clinic%2C%20Ayada%2C%20Maldives', 'General Clinic', 'Resort', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Ayurvedic Therapy', 'Ayurvedic Therapy, Ayurvedic', '9753776', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Ayurvedic%20Therapy%2C%20Ayurvedic%2C%20Maldives', 'Traditional Medicine Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Azmi Naeem Medical and Diagnostic Centre', 'Azmi Naeem Medical and Diagnostic Centre, Azmi', '3325979', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Azmi%20Naeem%20Medical%20and%20Diagnostic%20Centre%2C%20Azmi%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('B. Dharavandhoo Health Centre', 'B. Dharavandhoo Health Centre, B.', '3328887', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=B.%20Dharavandhoo%20Health%20Centre%2C%20B.%2C%20Maldives', 'Health Centre Grade 3', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('B. Dhonfanu  Health Centre', 'B. Dhonfanu  Health Centre, B.', '3328887', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=B.%20Dhonfanu%20%20Health%20Centre%2C%20B.%2C%20Maldives', 'Health Centre Grade 1', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('B. Fehendhoo Health Centre', 'B. Fehendhoo Health Centre, B.', '3328887', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=B.%20Fehendhoo%20Health%20Centre%2C%20B.%2C%20Maldives', 'Health Centre Grade 1', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('B. Fulhadhoo Health Centre', 'B. Fulhadhoo Health Centre, B.', NULL, '[email protected]', 'https://www.google.com/maps/search/?api=1&query=B.%20Fulhadhoo%20Health%20Centre%2C%20B.%2C%20Maldives', 'Health Centre Grade 1', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('B. Goidhoo Health Centre', 'B. Goidhoo Health Centre, B.', '3328887', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=B.%20Goidhoo%20Health%20Centre%2C%20B.%2C%20Maldives', 'Health Centre Grade 3', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('B. Hithaadhoo Health Centre', 'B. Hithaadhoo Health Centre, B.', '3328887', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=B.%20Hithaadhoo%20Health%20Centre%2C%20B.%2C%20Maldives', 'Health Centre Grade 2', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('B. Kamadhoo Health Center', 'B. Kamadhoo Health Center, B.', '3328887', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=B.%20Kamadhoo%20Health%20Center%2C%20B.%2C%20Maldives', 'Health Centre Grade 1', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('B. Kendhoo Health Centre', 'B. Kendhoo Health Centre, B.', '3328887', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=B.%20Kendhoo%20Health%20Centre%2C%20B.%2C%20Maldives', 'Health Centre Grade 3', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('B. Kihaadhoo Health Centre', 'B. Kihaadhoo Health Centre, B.', '3328887', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=B.%20Kihaadhoo%20Health%20Centre%2C%20B.%2C%20Maldives', 'Health Centre Grade 1', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('B. Kudarikili Health Centre', 'B. Kudarikili Health Centre, B.', '3328887', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=B.%20Kudarikili%20Health%20Centre%2C%20B.%2C%20Maldives', 'Health Centre Grade 1', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('B. Maalhos Health Centre', 'B. Maalhos Health Centre, B.', '3328887', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=B.%20Maalhos%20Health%20Centre%2C%20B.%2C%20Maldives', 'Health Centre Grade 1', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('B. Thulhaadhoo Health Centre', 'B. Thulhaadhoo Health Centre, B.', '3328887', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=B.%20Thulhaadhoo%20Health%20Centre%2C%20B.%2C%20Maldives', 'Health Centre Grade 4', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Baa Atoll Hospital', 'Baa Atoll Hospital, Baa Atoll', '3328887', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Baa%20Atoll%20Hospital%2C%20Baa%20Atoll%2C%20Maldives', 'Hospital Grade 2', 'Resort', true, true, true, true, '24 hours', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Bandos Medical Clinic and Hyperbaric Treatment Centre', 'Bandos Medical Clinic and Hyperbaric Treatment Centre, Bandos', '6640088', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Bandos%20Medical%20Clinic%20and%20Hyperbaric%20Treatment%20Centre%2C%20Bandos%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Baros Clinic', 'Baros Clinic, Baros', '3323080', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Baros%20Clinic%2C%20Baros%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('BCare', 'BCare', '9312222', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=BCare%2C%20%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Bliss Care', 'Bliss Care, Bliss', '9899164', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Bliss%20Care%2C%20Bliss%2C%20Maldives', 'Therapeutic Service Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Blu Clinic', 'Blu Clinic, Blu', '7303558', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Blu%20Clinic%2C%20Blu%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Bluspan Care', 'Bluspan Care, Bluspan', '7943112 / 9553112', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Bluspan%20Care%2C%20Bluspan%2C%20Maldives', 'Therapeutic Service Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Bluspan Care Annex - 1', 'Bluspan Care Annex - 1, Bluspan', '7943112 / 9553112', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Bluspan%20Care%20Annex%20-%201%2C%20Bluspan%2C%20Maldives', 'Therapeutic Service Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Bluspan Care Dhidhdhoo', 'Bluspan Care Dhidhdhoo, Bluspan', '9553112', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Bluspan%20Care%20Dhidhdhoo%2C%20Bluspan%2C%20Maldives', 'Therapeutic Service Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Blyss Multi-Specialty Therapy Centre', 'Blyss Multi-Specialty Therapy Centre, Blyss', '7930105', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Blyss%20Multi-Specialty%20Therapy%20Centre%2C%20Blyss%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Bolifushi Clinic', 'Bolifushi Clinic, Bolifushi', '6642020', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Bolifushi%20Clinic%2C%20Bolifushi%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Bulbul Multi Rehab Clinic', 'Bulbul Multi Rehab Clinic, Bulbul', '9887153', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Bulbul%20Multi%20Rehab%20Clinic%2C%20Bulbul%2C%20Maldives', 'Therapeutic Service Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Bulbul Multi Rehab Clinic', 'Bulbul Multi Rehab Clinic, Bulbul', '9887153', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Bulbul%20Multi%20Rehab%20Clinic%2C%20Bulbul%2C%20Maldives', 'Therapeutic Service Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Bulbul Therapy Clinic', 'Bulbul Therapy Clinic, Bulbul', '7993030', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Bulbul%20Therapy%20Clinic%2C%20Bulbul%2C%20Maldives', 'Therapeutic Service Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Care Max Clinic 1', 'Care Max Clinic 1, Care', '7772526', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Care%20Max%20Clinic%201%2C%20Care%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Care Medicals Services', 'Care Medicals Services, Care', '9940909', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Care%20Medicals%20Services%2C%20Care%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Care Trust Multi Speciality Clinic', 'Care Trust Multi Speciality Clinic, Care', '7785581', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Care%20Trust%20Multi%20Speciality%20Clinic%2C%20Care%2C%20Maldives', 'General Hospital', 'Island', true, true, true, true, '24 hours', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('CAREMORE MEDICALS', 'CAREMORE MEDICALS, CAREMORE', '7747722', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=CAREMORE%20MEDICALS%2C%20CAREMORE%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('CareOne Dental & Clinic', 'CareOne Dental & Clinic, CareOne', '9932542', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=CareOne%20Dental%20%26%20Clinic%2C%20CareOne%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Centara Clinic', 'Centara Clinic, Centara', '9912447', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Centara%20Clinic%2C%20Centara%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Center for Traditional Medicine', 'Center for Traditional Medicine, Center', '3320105', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Center%20for%20Traditional%20Medicine%2C%20Center%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Central Clinic', 'Central Clinic, Central', '7511844', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Central%20Clinic%2C%20Central%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Central Medical Center', 'Central Medical Center, Central', '7511844', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Central%20Medical%20Center%2C%20Central%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('CHARM DENTAL & SKIN CLINIC', 'CHARM DENTAL & SKIN CLINIC, CHARM', '7771849', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=CHARM%20DENTAL%20%26%20SKIN%20CLINIC%2C%20CHARM%2C%20Maldives', 'Area Specific Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Cheval Blance Randeli Clinic', 'Cheval Blance Randeli Clinic, Cheval', '7303340', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Cheval%20Blance%20Randeli%20Clinic%2C%20Cheval%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Child Development Clinic', 'Child Development Clinic, Child', '7788252', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Child%20Development%20Clinic%2C%20Child%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Chinese Health Care', 'Chinese Health Care, Chinese', '7788686', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Chinese%20Health%20Care%2C%20Chinese%2C%20Maldives', 'Complementary Medicine Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Cinnamon Dhonveli Maldives Medical Clinic', 'Cinnamon Dhonveli Maldives Medical Clinic, Cinnamon', '7415184', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Cinnamon%20Dhonveli%20Maldives%20Medical%20Clinic%2C%20Cinnamon%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Cinnamon Velifushi Maldives Medical Clinic', 'Cinnamon Velifushi Maldives Medical Clinic, Cinnamon', '7307777', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Cinnamon%20Velifushi%20Maldives%20Medical%20Clinic%2C%20Cinnamon%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('City Optical', 'City Optical, City', '7777660', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=City%20Optical%2C%20City%2C%20Maldives', 'Area Specific Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Clinica', 'Clinica', '7817161', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Clinica%2C%20%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Clinica HiyaClosed', 'Clinica HiyaClosed, Clinica', '781-7161', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Clinica%20HiyaClosed%2C%20Clinica%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Coco Chic Clinic', 'Coco Chic Clinic, Coco', '3000911', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Coco%20Chic%20Clinic%2C%20Coco%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Cocoa Island Clinic', 'Cocoa Island Clinic, Cocoa', '6641818', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Cocoa%20Island%20Clinic%2C%20Cocoa%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Cocogiri Clinic', 'Cocogiri Clinic, Cocogiri', '7784975 / 7511844', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Cocogiri%20Clinic%2C%20Cocogiri%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Constance Moofushi Resort Clinic', 'Constance Moofushi Resort Clinic, Constance', '3323564, 3323445', '[email protected],[email protected]', 'https://www.google.com/maps/search/?api=1&query=Constance%20Moofushi%20Resort%20Clinic%2C%20Constance%2C%20Maldives', 'General Clinic', 'Resort', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('CORAL BAY CLINIC', 'CORAL BAY CLINIC, CORAL', '+9606541405', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=CORAL%20BAY%20CLINIC%2C%20CORAL%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Crystal Medicals', 'Crystal Medicals, Crystal', '7991232 / 7790671', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Crystal%20Medicals%2C%20Crystal%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('CyMa Care', 'CyMa Care, CyMa', '7901920', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=CyMa%20Care%2C%20CyMa%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('CyMa Care Hulhumale''', 'CyMa Care Hulhumale'', CyMa', '7787260', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=CyMa%20Care%20Hulhumale%27%2C%20CyMa%2C%20Maldives', 'Therapeutic Service Clinic', 'Hulhumale', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('D.S.M Clinic', 'D.S.M Clinic', '7778610', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=D.S.M%20Clinic%2C%20%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Dental Care Centre', 'Dental Care Centre, Dental', '7348800 (Khatma)', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Dental%20Care%20Centre%2C%20Dental%2C%20Maldives', 'Area Specific Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Dental Studio', 'Dental Studio, Dental', '7777466', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Dental%20Studio%2C%20Dental%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('DH. Atoll Hospital', 'DH. Atoll Hospital, DH.', '3328887', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=DH.%20Atoll%20Hospital%2C%20DH.%2C%20Maldives', 'Hospital Grade 2', 'Resort', true, true, true, true, '24 hours', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('DH. Bandidhoo Health Centre', 'DH. Bandidhoo Health Centre, DH.', '3328887', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=DH.%20Bandidhoo%20Health%20Centre%2C%20DH.%2C%20Maldives', 'Health Centre Grade 2', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('DH. Hulhudhelee Health Centre', 'DH. Hulhudhelee Health Centre, DH.', '3328887', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=DH.%20Hulhudhelee%20Health%20Centre%2C%20DH.%2C%20Maldives', 'Health Centre Grade 1', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('DH. Maaenboodhoo Health Centre', 'DH. Maaenboodhoo Health Centre, DH.', '3328887', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=DH.%20Maaenboodhoo%20Health%20Centre%2C%20DH.%2C%20Maldives', 'Health Centre Grade 1', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Dh. Meedhoo Health Center', 'Dh. Meedhoo Health Center, Dhaalu Atoll', '3328887', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Dh.%20Meedhoo%20Health%20Center%2C%20Dhaalu%20Atoll%2C%20Maldives', 'Health Centre Grade 3', 'Resort', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('DH. Rinbidhoo Health Centre', 'DH. Rinbidhoo Health Centre, DH.', '3328887', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=DH.%20Rinbidhoo%20Health%20Centre%2C%20DH.%2C%20Maldives', 'Health Centre Grade 1', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Dharavandhoo Medical Center', 'Dharavandhoo Medical Center, Dharavandhoo', '9641334', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Dharavandhoo%20Medical%20Center%2C%20Dharavandhoo%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Dharumavantha Hospital', 'Dharumavantha Hospital, Dharumavantha', NULL, NULL, 'https://www.google.com/maps/search/?api=1&query=Dharumavantha%20Hospital%2C%20Dharumavantha%2C%20Maldives', 'Tertiary Hospital', 'Island', true, true, true, true, '24 hours', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Dhigali Clinic', 'Dhigali Clinic, Dhigali', '3323080', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Dhigali%20Clinic%2C%20Dhigali%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Dhirithi Faruvaa', 'Dhirithi Faruvaa, Dhirithi', '7784814', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Dhirithi%20Faruvaa%2C%20Dhirithi%2C%20Maldives', 'Complementary Medicine Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Dhivehi Beys Clinic', 'Dhivehi Beys Clinic, Dhivehi', '7734716', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Dhivehi%20Beys%20Clinic%2C%20Dhivehi%2C%20Maldives', 'Traditional Medicine Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Dhoonidhoo Clinic', 'Dhoonidhoo Clinic, Dhoonidhoo', '300078', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Dhoonidhoo%20Clinic%2C%20Dhoonidhoo%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Dhugethi Dhivehibeys clinic', 'Dhugethi Dhivehibeys clinic, Dhugethi', '7787818', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Dhugethi%20Dhivehibeys%20clinic%2C%20Dhugethi%2C%20Maldives', 'Traditional Medicine Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Dhun-nika dhivehibeys clinic', 'Dhun-nika dhivehibeys clinic', '9103000', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Dhun-nika%20dhivehibeys%20clinic%2C%20%2C%20Maldives', 'Therapeutic Service Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Doctor''s Clinic', 'Doctor''s Clinic', '3330617 /6680001', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Doctor%27s%20Clinic%2C%20%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Dr Didi Dental And Medical Center', 'Dr Didi Dental And Medical Center, Dr', NULL, '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Dr%20Didi%20Dental%20And%20Medical%20Center%2C%20Dr%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Dr Usama Dental Clinic', 'Dr Usama Dental Clinic, Dr', '3330076', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Dr%20Usama%20Dental%20Clinic%2C%20Dr%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Dr. Abduh Samad Memorial Hospital', 'Dr. Abduh Samad Memorial Hospital, Dr.', '6841970', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Dr.%20Abduh%20Samad%20Memorial%20Hospital%2C%20Dr.%2C%20Maldives', 'Hospital Grade 3', 'Island', true, true, true, true, '24 hours', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Dr. Didi Dental Centre', 'Dr. Didi Dental Centre, Dr.', '7784452', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Dr.%20Didi%20Dental%20Centre%2C%20Dr.%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Dr. Jihad''s Dental and Medical Centre', 'Dr. Jihad''s Dental and Medical Centre, Dr.', '9110001', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Dr.%20Jihad%27s%20Dental%20and%20Medical%20Centre%2C%20Dr.%2C%20Maldives', 'Area Specific Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Dr. Usama''s Clinic Maafannu', 'Dr. Usama''s Clinic Maafannu, Dr.', '3330076', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Dr.%20Usama%27s%20Clinic%20Maafannu%2C%20Dr.%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Dreamland Clinic', 'Dreamland Clinic, Dreamland', '9999991', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Dreamland%20Clinic%2C%20Dreamland%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Early Intervention Therapy Centre', 'Early Intervention Therapy Centre, Early', '7708544', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Early%20Intervention%20Therapy%20Centre%2C%20Early%2C%20Maldives', 'Therapeutic Service Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Elite Medical Center', 'Elite Medical Center, Elite', '3333505', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Elite%20Medical%20Center%2C%20Elite%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Ellaidhoo Clinic', 'Ellaidhoo Clinic, Ellaidhoo', '7415366', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Ellaidhoo%20Clinic%2C%20Ellaidhoo%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Embudu Village Clinic', 'Embudu Village Clinic, Embudu', '7749010', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Embudu%20Village%20Clinic%2C%20Embudu%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Emerald Dental Care', 'Emerald Dental Care, Emerald', '7970292   /9900886', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Emerald%20Dental%20Care%2C%20Emerald%2C%20Maldives', 'Area Specific Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Emerald Faarushi Clinic', 'Emerald Faarushi Clinic, Emerald', '3333644', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Emerald%20Faarushi%20Clinic%2C%20Emerald%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Emerald Maldives Resort Clinic', 'Emerald Maldives Resort Clinic, Emerald', '7979718', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Emerald%20Maldives%20Resort%20Clinic%2C%20Emerald%2C%20Maldives', 'General Clinic', 'Resort', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Eri Maldives Clinic', 'Eri Maldives Clinic, Eri', '7785842', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Eri%20Maldives%20Clinic%2C%20Eri%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Eriyadu ClinicClosed', 'Eriyadu ClinicClosed, Eriyadu', '3343840', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Eriyadu%20ClinicClosed%2C%20Eriyadu%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Esma Dhivehi Beys ClinicClosed', 'Esma Dhivehi Beys ClinicClosed, Esma', '7592811', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Esma%20Dhivehi%20Beys%20ClinicClosed%2C%20Esma%2C%20Maldives', 'Traditional Medicine Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('European Clinic MaldivesClosed', 'European Clinic MaldivesClosed, European', '7773716', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=European%20Clinic%20MaldivesClosed%2C%20European%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Eve Clinic', 'Eve Clinic, Eve', '7900788 / 3300788', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Eve%20Clinic%2C%20Eve%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Eve Clinic Vinares', 'Eve Clinic Vinares, Eve', '9900848', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Eve%20Clinic%20Vinares%2C%20Eve%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Eve Clinic West Park', 'Eve Clinic West Park, Eve', '7902415', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Eve%20Clinic%20West%20Park%2C%20Eve%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Eye Care Clinic', 'Eye Care Clinic, Eye', NULL, '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Eye%20Care%20Clinic%2C%20Eye%2C%20Maldives', 'Area Specific Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Eye Care Clinic Hulhumale'' Branch', 'Eye Care Clinic Hulhumale'' Branch, Eye', '3324300', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Eye%20Care%20Clinic%20Hulhumale%27%20Branch%2C%20Eye%2C%20Maldives', 'Area Specific Clinic', 'Hulhumale', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Eye Care Clinic, Fareedhee Magu BranchClosed', 'Eye Care Clinic, Fareedhee Magu BranchClosed, Eye', '3324300', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Eye%20Care%20Clinic%2C%20Fareedhee%20Magu%20BranchClosed%2C%20Eye%2C%20Maldives', 'Area Specific Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Eye Care Hospital', 'Eye Care Hospital, Eye', '3324300', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Eye%20Care%20Hospital%2C%20Eye%2C%20Maldives', 'Area Specific Hospital', 'Island', true, true, true, true, '24 hours', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Eye Care Opticals', 'Eye Care Opticals, Eye', NULL, '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Eye%20Care%20Opticals%2C%20Eye%2C%20Maldives', 'Area Specific Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Eye to Eye Opticals & Clinic', 'Eye to Eye Opticals & Clinic, Eye', '9637947', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Eye%20to%20Eye%20Opticals%20%26%20Clinic%2C%20Eye%2C%20Maldives', 'Area Specific Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Eye to Eye Opticals & Clinic 2', 'Eye to Eye Opticals & Clinic 2, Eye', '7999595 / 9784084', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Eye%20to%20Eye%20Opticals%20%26%20Clinic%202%2C%20Eye%2C%20Maldives', 'Area Specific Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Eye Zone Clinic', 'Eye Zone Clinic, Eye', '7370884', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Eye%20Zone%20Clinic%2C%20Eye%2C%20Maldives', 'Area Specific Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('F & C Medicare', 'F & C Medicare, F', '3333536', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=F%20%26%20C%20Medicare%2C%20F%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('F & C Medicare and Scan Center', 'F & C Medicare and Scan Center, F', '3333536', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=F%20%26%20C%20Medicare%20and%20Scan%20Center%2C%20F%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('F & C Medicare, Meedhoo', 'F & C Medicare, Meedhoo, F', '3333536', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=F%20%26%20C%20Medicare%2C%20Meedhoo%2C%20F%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('F & C Prime Care', 'F & C Prime Care, F', '3333536', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=F%20%26%20C%20Prime%20Care%2C%20F%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('F. Atoll Hospital', 'F. Atoll Hospital, Faafu Atoll', '3328887', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=F.%20Atoll%20Hospital%2C%20Faafu%20Atoll%2C%20Maldives', 'Hospital Grade 1', 'Resort', true, true, true, true, '24 hours', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('F. Biledhoo Health Centre', 'F. Biledhoo Health Centre, Faafu Atoll', '3328887', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=F.%20Biledhoo%20Health%20Centre%2C%20Faafu%20Atoll%2C%20Maldives', 'Health Centre Grade 2', 'Resort', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('F. Dharanboodhoo Health Centre', 'F. Dharanboodhoo Health Centre, Faafu Atoll', '3328887', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=F.%20Dharanboodhoo%20Health%20Centre%2C%20Faafu%20Atoll%2C%20Maldives', 'Health Centre Grade 1', 'Resort', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('F. Feeali Health Center', 'F. Feeali Health Center, Faafu Atoll', '3328887', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=F.%20Feeali%20Health%20Center%2C%20Faafu%20Atoll%2C%20Maldives', 'Health Centre Grade 2', 'Resort', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('F.Magoodhoo Health Centre', 'F.Magoodhoo Health Centre, F.Magoodhoo', '3328887', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=F.Magoodhoo%20Health%20Centre%2C%20F.Magoodhoo%2C%20Maldives', 'Health Centre Grade 2', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Family Care Clinic and Scan Center', 'Family Care Clinic and Scan Center, Family', '3300767', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Family%20Care%20Clinic%20and%20Scan%20Center%2C%20Family%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Family Dental Care', 'Family Dental Care, Family', '9904089', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Family%20Dental%20Care%2C%20Family%2C%20Maldives', 'Area Specific Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Family Planning Centre', 'Family Planning Centre, Family', '7989037', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Family%20Planning%20Centre%2C%20Family%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Family Relationship Services', 'Family Relationship Services, Family', '9989282', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Family%20Relationship%20Services%2C%20Family%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Farook HealthCare', 'Farook HealthCare, Farook', '6860656 / 7783197', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Farook%20HealthCare%2C%20Farook%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Farook Healthcare Villingili', 'Farook Healthcare Villingili, Farook', '7783197', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Farook%20Healthcare%20Villingili%2C%20Farook%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Faruvaa Clinic', 'Faruvaa Clinic, Faruvaa', '3330535', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Faruvaa%20Clinic%2C%20Faruvaa%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Faxys Hijama Clinic', 'Faxys Hijama Clinic, Faxys', '7787204', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Faxys%20Hijama%20Clinic%2C%20Faxys%2C%20Maldives', 'Complementary Medicine Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Fihalhohi Clinic', 'Fihalhohi Clinic, Fihalhohi', '7902626', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Fihalhohi%20Clinic%2C%20Fihalhohi%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Finolhu Clinic', 'Finolhu Clinic, Finolhu', '6643152 / 7771284', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Finolhu%20Clinic%2C%20Finolhu%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Finolhu Clinic Plus', 'Finolhu Clinic Plus, Finolhu', '7772991', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Finolhu%20Clinic%20Plus%2C%20Finolhu%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Four Seasons Resort Maldives at Kuda Huraa Clinic', 'Four Seasons Resort Maldives at Kuda Huraa Clinic, Four', '7567517', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Four%20Seasons%20Resort%20Maldives%20at%20Kuda%20Huraa%20Clinic%2C%20Four%2C%20Maldives', 'General Clinic', 'Resort', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Furana Clinic', 'Furana Clinic, Furana', '3332245 / 7993083', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Furana%20Clinic%2C%20Furana%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Furaveri Clinic', 'Furaveri Clinic, Furaveri', '7783713', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Furaveri%20Clinic%2C%20Furaveri%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Fushi Clinic', 'Fushi Clinic, Fushi', '7793923', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Fushi%20Clinic%2C%20Fushi%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Fuvahmulah Medical Centre', 'Fuvahmulah Medical Centre, Fuvahmulah', '7786655', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Fuvahmulah%20Medical%20Centre%2C%20Fuvahmulah%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('GA. Atoll Hospital', 'GA. Atoll Hospital, GA.', '3328887', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=GA.%20Atoll%20Hospital%2C%20GA.%2C%20Maldives', 'Hospital Grade 2', 'Resort', true, true, true, true, '24 hours', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('GA. Dhaandhoo Health Centre', 'GA. Dhaandhoo Health Centre, GA.', '3328887', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=GA.%20Dhaandhoo%20Health%20Centre%2C%20GA.%2C%20Maldives', 'Health Centre Grade 3', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('GA. Dhevvadhoo Health Centre', 'GA. Dhevvadhoo Health Centre, GA.', '3328887', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=GA.%20Dhevvadhoo%20Health%20Centre%2C%20GA.%2C%20Maldives', 'Health Centre Grade 3', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('GA. Gemanafushi Health Centre', 'GA. Gemanafushi Health Centre, GA.', '3328887', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=GA.%20Gemanafushi%20Health%20Centre%2C%20GA.%2C%20Maldives', 'Health Centre Grade 3', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('GA. Kan''dhuhulhudhoo Health Centre', 'GA. Kan''dhuhulhudhoo Health Centre, GA.', '3328887', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=GA.%20Kan%27dhuhulhudhoo%20Health%20Centre%2C%20GA.%2C%20Maldives', 'Health Centre Grade 1', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('GA. Kolamafushi Health Centre', 'GA. Kolamafushi Health Centre, GA.', '3328887', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=GA.%20Kolamafushi%20Health%20Centre%2C%20GA.%2C%20Maldives', 'Health Centre Grade 3', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('GA. Kondey Health Centre', 'GA. Kondey Health Centre, GA.', '3328887', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=GA.%20Kondey%20Health%20Centre%2C%20GA.%2C%20Maldives', 'Health Centre Grade 1', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('GA. Maamendhoo Health Centre', 'GA. Maamendhoo Health Centre, GA.', '3328887', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=GA.%20Maamendhoo%20Health%20Centre%2C%20GA.%2C%20Maldives', 'Health Centre Grade 2', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('GA. Nilandhoo Health Centre', 'GA. Nilandhoo Health Centre, GA.', '3328887', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=GA.%20Nilandhoo%20Health%20Centre%2C%20GA.%2C%20Maldives', 'Health Centre Grade 1', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Gagan Clinic', 'Gagan Clinic, Gagan', '7926466', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Gagan%20Clinic%2C%20Gagan%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Gangehi Clinic', 'Gangehi Clinic, Gangehi', '7853402', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Gangehi%20Clinic%2C%20Gangehi%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('GDh. Fares-mathoda Health Centre', 'GDh. Fares-mathoda Health Centre, Gaafu Dhaalu Atoll', '6841970', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=GDh.%20Fares-mathoda%20Health%20Centre%2C%20Gaafu%20Dhaalu%20Atoll%2C%20Maldives', 'Health Centre Grade 3', 'Resort', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('GDh. Fiyoaree Health Centre', 'GDh. Fiyoaree Health Centre, Gaafu Dhaalu Atoll', '6841970', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=GDh.%20Fiyoaree%20Health%20Centre%2C%20Gaafu%20Dhaalu%20Atoll%2C%20Maldives', 'Health Centre Grade 2', 'Resort', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('GDh. Gahdhoo Health Centre', 'GDh. Gahdhoo Health Centre, Gaafu Dhaalu Atoll', '6841970', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=GDh.%20Gahdhoo%20Health%20Centre%2C%20Gaafu%20Dhaalu%20Atoll%2C%20Maldives', 'Health Centre Grade 4', 'Resort', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('GDh. Hoadedhoo Health Centre', 'GDh. Hoadedhoo Health Centre, Gaafu Dhaalu Atoll', '6841970', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=GDh.%20Hoadedhoo%20Health%20Centre%2C%20Gaafu%20Dhaalu%20Atoll%2C%20Maldives', 'Health Centre Grade 2', 'Resort', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('GDh. Madaveli Health Centre', 'GDh. Madaveli Health Centre, Gaafu Dhaalu Atoll', '6841970', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=GDh.%20Madaveli%20Health%20Centre%2C%20Gaafu%20Dhaalu%20Atoll%2C%20Maldives', 'Health Centre Grade 2', 'Resort', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('GDh. Nadella Health Centre', 'GDh. Nadella Health Centre, Gaafu Dhaalu Atoll', '6841970', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=GDh.%20Nadella%20Health%20Centre%2C%20Gaafu%20Dhaalu%20Atoll%2C%20Maldives', 'Health Centre Grade 2', 'Resort', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Gdh. Rathafandhoo Health Center', 'Gdh. Rathafandhoo Health Center, Gdh.', '3328887', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Gdh.%20Rathafandhoo%20Health%20Center%2C%20Gdh.%2C%20Maldives', 'Health Centre Grade 2', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('GDh. Vaadhoo Health Centre', 'GDh. Vaadhoo Health Centre, Gaafu Dhaalu Atoll', '6841970', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=GDh.%20Vaadhoo%20Health%20Centre%2C%20Gaafu%20Dhaalu%20Atoll%2C%20Maldives', 'Health Centre Grade 3', 'Resort', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Gili Gets Well', 'Gili Gets Well, Gili', NULL, '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Gili%20Gets%20Well%2C%20Gili%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Gnaviyani Atoll Hospital', 'Gnaviyani Atoll Hospital, Gnaviyani', '3328887', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Gnaviyani%20Atoll%20Hospital%2C%20Gnaviyani%2C%20Maldives', 'Hospital Grade 2', 'Resort', true, true, true, true, '24 hours', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Grand Clinic', 'Grand Clinic, Grand', '9912345', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Grand%20Clinic%2C%20Grand%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Great Minds', 'Great Minds, Great', '7772828 / 7772266 / 7797987 / 7901177', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Great%20Minds%2C%20Great%2C%20Maldives', 'Therapeutic Service Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Guest And Staff Clinic', 'Guest And Staff Clinic, Guest', '7772991', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Guest%20And%20Staff%20Clinic%2C%20Guest%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Gynova', 'Gynova', '9658989', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Gynova%2C%20%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('H Dh. Finey Health Center', 'H Dh. Finey Health Center, H', '3328887', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=H%20Dh.%20Finey%20Health%20Center%2C%20H%2C%20Maldives', 'Health Centre Grade 1', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('H.a Thakandhoo Health Centre', 'H.a Thakandhoo Health Centre, H.a', '3328887', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=H.a%20Thakandhoo%20Health%20Centre%2C%20H.a%2C%20Maldives', 'Health Centre Grade 2', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Ha. Atoll Hospital', 'Ha. Atoll Hospital, Ha.', '3328887', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Ha.%20Atoll%20Hospital%2C%20Ha.%2C%20Maldives', 'Hospital Grade 2', 'Resort', true, true, true, true, '24 hours', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('HA. Baarah Health Centre', 'HA. Baarah Health Centre, HA.', '3328887', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=HA.%20Baarah%20Health%20Centre%2C%20HA.%2C%20Maldives', 'Health Centre Grade 3', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Ha. Filladhoo Health Centre', 'Ha. Filladhoo Health Centre, Ha.', '3328887', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Ha.%20Filladhoo%20Health%20Centre%2C%20Ha.%2C%20Maldives', 'Health Centre Grade 1', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Ha. Hoarafushi Health Centre', 'Ha. Hoarafushi Health Centre, Ha.', '3328887', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Ha.%20Hoarafushi%20Health%20Centre%2C%20Ha.%2C%20Maldives', 'Health Centre Grade 4', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Ha. Kela Health Centre', 'Ha. Kela Health Centre, Ha.', '3328887', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Ha.%20Kela%20Health%20Centre%2C%20Ha.%2C%20Maldives', 'Health Centre Grade 3', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Ha. Maarandhoo Health Centre', 'Ha. Maarandhoo Health Centre, Ha.', '3328887', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Ha.%20Maarandhoo%20Health%20Centre%2C%20Ha.%2C%20Maldives', 'Health Centre Grade 1', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Ha. Molhadhoo Health Centre', 'Ha. Molhadhoo Health Centre, Ha.', '3328887', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Ha.%20Molhadhoo%20Health%20Centre%2C%20Ha.%2C%20Maldives', 'Health Centre Grade 1', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Ha. Muraidhoo Health Centre', 'Ha. Muraidhoo Health Centre, Ha.', '3328887', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Ha.%20Muraidhoo%20Health%20Centre%2C%20Ha.%2C%20Maldives', 'Health Centre Grade 1', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Ha. Thuraakurun Health Centre', 'Ha. Thuraakurun Health Centre, Ha.', '3328887', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Ha.%20Thuraakurun%20Health%20Centre%2C%20Ha.%2C%20Maldives', 'Health Centre Grade 1', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Ha. Uligamu Health Centre', 'Ha. Uligamu Health Centre, Ha.', '3328887', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Ha.%20Uligamu%20Health%20Centre%2C%20Ha.%2C%20Maldives', 'Health Centre Grade 1', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Ha. Utheem Health Centre', 'Ha. Utheem Health Centre, Ha.', '3328887', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Ha.%20Utheem%20Health%20Centre%2C%20Ha.%2C%20Maldives', 'Health Centre Grade 2', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Ha. Vashafaru Health Centre', 'Ha. Vashafaru Health Centre, Ha.', '3328887', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Ha.%20Vashafaru%20Health%20Centre%2C%20Ha.%2C%20Maldives', 'Health Centre Grade 2', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Haajy Medical Clinic', 'Haajy Medical Clinic, Haajy', '6528822', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Haajy%20Medical%20Clinic%2C%20Haajy%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Hadahaa Clinic', 'Hadahaa Clinic, Hadahaa', NULL, NULL, 'https://www.google.com/maps/search/?api=1&query=Hadahaa%20Clinic%2C%20Hadahaa%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Hadh. Hanimaadhoo Health Centre', 'Hadh. Hanimaadhoo Health Centre, Hadh.', '3328887', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Hadh.%20Hanimaadhoo%20Health%20Centre%2C%20Hadh.%2C%20Maldives', 'Health Centre Grade 3', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Hakuraa Medical Centre', 'Hakuraa Medical Centre, Hakuraa', '7415510', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Hakuraa%20Medical%20Centre%2C%20Hakuraa%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Halaveli Clinic', 'Halaveli Clinic, Halaveli', '3322719', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Halaveli%20Clinic%2C%20Halaveli%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Havodda Clinic', 'Havodda Clinic, Havodda', NULL, NULL, 'https://www.google.com/maps/search/?api=1&query=Havodda%20Clinic%2C%20Havodda%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('HDh. Hirimaradhoo Health Centre', 'HDh. Hirimaradhoo Health Centre, Haa Dhaalu Atoll', '3328887', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=HDh.%20Hirimaradhoo%20Health%20Centre%2C%20Haa%20Dhaalu%20Atoll%2C%20Maldives', 'Health Centre Grade 1', 'Resort', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('HDh. Kumundhoo Health Centre', 'HDh. Kumundhoo Health Centre, Haa Dhaalu Atoll', '3328887', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=HDh.%20Kumundhoo%20Health%20Centre%2C%20Haa%20Dhaalu%20Atoll%2C%20Maldives', 'Health Centre Grade 1', 'Resort', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('HDh. kurinbi Health Centre', 'HDh. kurinbi Health Centre, Haa Dhaalu Atoll', '3328887', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=HDh.%20kurinbi%20Health%20Centre%2C%20Haa%20Dhaalu%20Atoll%2C%20Maldives', 'Health Centre Grade 1', 'Resort', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('HDh. Makunudhoo Health Centre', 'HDh. Makunudhoo Health Centre, Haa Dhaalu Atoll', '3328887', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=HDh.%20Makunudhoo%20Health%20Centre%2C%20Haa%20Dhaalu%20Atoll%2C%20Maldives', 'Health Centre Grade 3', 'Resort', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('HDh. Naivaadhoo Health Centre', 'HDh. Naivaadhoo Health Centre, Haa Dhaalu Atoll', '3328887', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=HDh.%20Naivaadhoo%20Health%20Centre%2C%20Haa%20Dhaalu%20Atoll%2C%20Maldives', 'Health Centre Grade 1', 'Resort', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('HDh. Nellaidhoo HealthCentre', 'HDh. Nellaidhoo HealthCentre, Haa Dhaalu Atoll', '3328887', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=HDh.%20Nellaidhoo%20HealthCentre%2C%20Haa%20Dhaalu%20Atoll%2C%20Maldives', 'Health Centre Grade 2', 'Resort', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('HDh. Neykurendhoo Health Centre', 'HDh. Neykurendhoo Health Centre, Haa Dhaalu Atoll', '3328887', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=HDh.%20Neykurendhoo%20Health%20Centre%2C%20Haa%20Dhaalu%20Atoll%2C%20Maldives', 'Health Centre Grade 3', 'Resort', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('HDh. Nolhivaran Health Centre', 'HDh. Nolhivaran Health Centre, Haa Dhaalu Atoll', '3328887', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=HDh.%20Nolhivaran%20Health%20Centre%2C%20Haa%20Dhaalu%20Atoll%2C%20Maldives', 'Health Centre Grade 3', 'Resort', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('HDh. Nolhivaranfaru Health Centre', 'HDh. Nolhivaranfaru Health Centre, Haa Dhaalu Atoll', '3328887', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=HDh.%20Nolhivaranfaru%20Health%20Centre%2C%20Haa%20Dhaalu%20Atoll%2C%20Maldives', 'Health Centre Grade 3', 'Resort', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('HDh. Vaikaradhoo HealthCentre', 'HDh. Vaikaradhoo HealthCentre, Haa Dhaalu Atoll', '3328887', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=HDh.%20Vaikaradhoo%20HealthCentre%2C%20Haa%20Dhaalu%20Atoll%2C%20Maldives', 'Health Centre Grade 3', 'Resort', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Healing Care Medical Center', 'Healing Care Medical Center, Healing', '7901278', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Healing%20Care%20Medical%20Center%2C%20Healing%2C%20Maldives', 'Area Specific Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Heart Care', 'Heart Care, Heart', '7977744', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Heart%20Care%2C%20Heart%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Helengeli Clinic', 'Helengeli Clinic, Helengeli', '3339992', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Helengeli%20Clinic%2C%20Helengeli%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Herbal Medi Clinic', 'Herbal Medi Clinic, Herbal', '7669515', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Herbal%20Medi%20Clinic%2C%20Herbal%2C%20Maldives', 'Traditional Medicine Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Hijama Faruva By Manara Clinic', 'Hijama Faruva By Manara Clinic, Hijama', '7986762', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Hijama%20Faruva%20By%20Manara%20Clinic%2C%20Hijama%2C%20Maldives', 'Complementary Medicine Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Hiyaa Medical Center', 'Hiyaa Medical Center, Hiyaa', '3336774', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Hiyaa%20Medical%20Center%2C%20Hiyaa%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Holistic Hijama MV', 'Holistic Hijama MV, Holistic', '7696630/9146415/ 9994135', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Holistic%20Hijama%20MV%2C%20Holistic%2C%20Maldives', 'Complementary Medicine Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Hope Dental Care', 'Hope Dental Care, Hope', '7958876 / 7777159', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Hope%20Dental%20Care%2C%20Hope%2C%20Maldives', 'Area Specific Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Hope Health Care', 'Hope Health Care, Hope', '7783198', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Hope%20Health%20Care%2C%20Hope%2C%20Maldives', 'Therapeutic Service Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('HPSN Medical Clinic', 'HPSN Medical Clinic, HPSN', '3013017', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=HPSN%20Medical%20Clinic%2C%20HPSN%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Hudhuranfushi Clinic', 'Hudhuranfushi Clinic, Hudhuranfushi', '6640375', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Hudhuranfushi%20Clinic%2C%20Hudhuranfushi%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Hulhumale Hospital', 'Hulhumale Hospital, Hulhumale', '3335335', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Hulhumale%20Hospital%2C%20Hulhumale%2C%20Maldives', 'Tertiary Hospital', 'Hulhumale', true, true, true, true, '24 hours', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Huraa Health Center', 'Huraa Health Center, Huraa', '3328887', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Huraa%20Health%20Center%2C%20Huraa%2C%20Maldives', 'Health Centre Grade 2', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Hurawalhi Clinic', 'Hurawalhi Clinic, Hurawalhi', '3326545', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Hurawalhi%20Clinic%2C%20Hurawalhi%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Hussain Abduh Samad Memorial Clinic', 'Hussain Abduh Samad Memorial Clinic, Hussain', '7772680', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Hussain%20Abduh%20Samad%20Memorial%20Clinic%2C%20Hussain%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Huva ClinicClosed', 'Huva ClinicClosed, Huva', '9988006', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Huva%20ClinicClosed%2C%20Huva%2C%20Maldives', 'Therapeutic Service Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Huvadhoo PCR labClosed', 'Huvadhoo PCR labClosed, Huvadhoo', '7795352', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Huvadhoo%20PCR%20labClosed%2C%20Huvadhoo%2C%20Maldives', 'Diagnostic Service Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Huvadhoo Therapy Clinic', 'Huvadhoo Therapy Clinic, Huvadhoo', '7788878', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Huvadhoo%20Therapy%20Clinic%2C%20Huvadhoo%2C%20Maldives', 'Therapeutic Service Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Huvafen Fushi Clinic', 'Huvafen Fushi Clinic, Huvafen', '3323080', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Huvafen%20Fushi%20Clinic%2C%20Huvafen%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('I wear', 'I wear, I', '3008558', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=I%20wear%2C%20I%2C%20Maldives', 'Area Specific Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('I.M.D.C Multi Speciality Hospital', 'I.M.D.C Multi Speciality Hospital', '3334478', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=I.M.D.C%20Multi%20Speciality%20Hospital%2C%20%2C%20Maldives', 'General Hospital', 'Island', true, true, true, true, '24 hours', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('ICATT Maldives- Medical Services', 'ICATT Maldives- Medical Services, ICATT', '7781937', '[email protected],[email protected]', 'https://www.google.com/maps/search/?api=1&query=ICATT%20Maldives-%20Medical%20Services%2C%20ICATT%2C%20Maldives', 'Area Specific Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Ifuru Clinic', 'Ifuru Clinic, Ifuru', '3332822', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Ifuru%20Clinic%2C%20Ifuru%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('IHG Maamunagau Clinic', 'IHG Maamunagau Clinic, IHG', '7772991', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=IHG%20Maamunagau%20Clinic%2C%20IHG%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Ilaa Ali Adam Clinic', 'Ilaa Ali Adam Clinic, Ilaa', '7747722', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Ilaa%20Ali%20Adam%20Clinic%2C%20Ilaa%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Ilaaj Hijama & Alternative Medical Services', 'Ilaaj Hijama & Alternative Medical Services, Ilaaj', '7740409', NULL, 'https://www.google.com/maps/search/?api=1&query=Ilaaj%20Hijama%20%26%20Alternative%20Medical%20Services%2C%20Ilaaj%2C%20Maldives', 'Complementary Medicine Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Image center', 'Image center, Image', '3334888', '[email protected]/[email protected]', 'https://www.google.com/maps/search/?api=1&query=Image%20center%2C%20Image%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Imperial Medicare Centre', 'Imperial Medicare Centre, Imperial', '7774441', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Imperial%20Medicare%20Centre%2C%20Imperial%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('IMPLANTREE DENTAL & AESTHETICS CLINIC', 'IMPLANTREE DENTAL & AESTHETICS CLINIC, IMPLANTREE', '7935795', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=IMPLANTREE%20DENTAL%20%26%20AESTHETICS%20CLINIC%2C%20IMPLANTREE%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Indhira Gandhi Memorial Hospital', 'Indhira Gandhi Memorial Hospital, Indhira', '3335335', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Indhira%20Gandhi%20Memorial%20Hospital%2C%20Indhira%2C%20Maldives', 'Tertiary Hospital', 'Island', true, true, true, true, '24 hours', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Institute For Counselling And Psychotherapy', 'Institute For Counselling And Psychotherapy, Institute', '3304206', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Institute%20For%20Counselling%20And%20Psychotherapy%2C%20Institute%2C%20Maldives', 'Therapeutic Service Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Institute Of Mental Well Being', 'Institute Of Mental Well Being, Institute', '3337892', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Institute%20Of%20Mental%20Well%20Being%2C%20Institute%2C%20Maldives', 'Area Specific Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Island Health Clinic', 'Island Health Clinic, Island', '3341775 / 4000999', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Island%20Health%20Clinic%2C%20Island%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Island Polyclinic', 'Island Polyclinic, Island', '9459739', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Island%20Polyclinic%2C%20Island%2C%20Maldives', 'Area Specific Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Ithaafushi Clinic', 'Ithaafushi Clinic, Ithaafushi', '7771463', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Ithaafushi%20Clinic%2C%20Ithaafushi%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Jawakara Clinic', 'Jawakara Clinic, Jawakara', '3326545', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Jawakara%20Clinic%2C%20Jawakara%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('JIRAA Health Centre', 'JIRAA Health Centre, JIRAA', '9110001', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=JIRAA%20Health%20Centre%2C%20JIRAA%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Joali Being Clinic', 'Joali Being Clinic, Joali', '3005515', NULL, 'https://www.google.com/maps/search/?api=1&query=Joali%20Being%20Clinic%2C%20Joali%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Joali Muravandhoo Clinic', 'Joali Muravandhoo Clinic, Joali', '7900462 / 7587249', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Joali%20Muravandhoo%20Clinic%2C%20Joali%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('JP Memorial Clinic', 'JP Memorial Clinic, JP', '3009094, 3009095', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=JP%20Memorial%20Clinic%2C%20JP%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('K. Gaafaru Health Centre', 'K. Gaafaru Health Centre, Kaafu Atoll', '3328887', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=K.%20Gaafaru%20Health%20Centre%2C%20Kaafu%20Atoll%2C%20Maldives', 'Health Centre Grade 2', 'Resort', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('K. Guraidhoo Heath Centre', 'K. Guraidhoo Heath Centre, Kaafu Atoll', '3328887', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=K.%20Guraidhoo%20Heath%20Centre%2C%20Kaafu%20Atoll%2C%20Maldives', 'Health Centre Grade 3', 'Resort', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('K. Maafushi Health Centre', 'K. Maafushi Health Centre, Kaafu Atoll', '3328887', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=K.%20Maafushi%20Health%20Centre%2C%20Kaafu%20Atoll%2C%20Maldives', 'Health Centre Grade 3', 'Resort', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('K. Thulusdhoo Health Centre', 'K. Thulusdhoo Health Centre, Kaafu Atoll', '3328887', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=K.%20Thulusdhoo%20Health%20Centre%2C%20Kaafu%20Atoll%2C%20Maldives', 'Health Centre Grade 3', 'Resort', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('K.Dhiffushi Health Centre', 'K.Dhiffushi Health Centre, K.Dhiffushi', '3328887', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=K.Dhiffushi%20Health%20Centre%2C%20K.Dhiffushi%2C%20Maldives', 'Health Centre Grade 2', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('K.Gulhi Health Centre', 'K.Gulhi Health Centre, K.Gulhi', '3328887', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=K.Gulhi%20Health%20Centre%2C%20K.Gulhi%2C%20Maldives', 'Health Centre Grade 2', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('K.Himmafushi Health Centre', 'K.Himmafushi Health Centre, K.Himmafushi', '3328887', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=K.Himmafushi%20Health%20Centre%2C%20K.Himmafushi%2C%20Maldives', 'Health Centre Grade 3', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('K.Kaashidhoo Health Centre', 'K.Kaashidhoo Health Centre, K.Kaashidhoo', '3328887', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=K.Kaashidhoo%20Health%20Centre%2C%20K.Kaashidhoo%2C%20Maldives', 'Health Centre Grade 3', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Kaam Medical', 'Kaam Medical, Kaam', '7675776', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Kaam%20Medical%2C%20Kaam%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Kagi Clinic', 'Kagi Clinic, Kagi', '6640123', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Kagi%20Clinic%2C%20Kagi%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Kandima Medical Center', 'Kandima Medical Center, Kandima', '6760077', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Kandima%20Medical%20Center%2C%20Kandima%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Kandolhu Clinic', 'Kandolhu Clinic, Kandolhu', '3323080', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Kandolhu%20Clinic%2C%20Kandolhu%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Kandooma Clinic', 'Kandooma Clinic, Kandooma', NULL, NULL, 'https://www.google.com/maps/search/?api=1&query=Kandooma%20Clinic%2C%20Kandooma%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Kani Medical Clinic', 'Kani Medical Clinic, Kani', NULL, '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Kani%20Medical%20Clinic%2C%20Kani%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Kanuhura Clinic', 'Kanuhura Clinic, Kanuhura', '7786424', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Kanuhura%20Clinic%2C%20Kanuhura%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Kanuhura ClinicClosed', 'Kanuhura ClinicClosed, Kanuhura', '7770948', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Kanuhura%20ClinicClosed%2C%20Kanuhura%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Knowhub', 'Knowhub', '3331999', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Knowhub%2C%20%2C%20Maldives', 'Therapeutic Service Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('KODHIPPARU CLINIC', 'KODHIPPARU CLINIC, KODHIPPARU', '+960 665 1111', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=KODHIPPARU%20CLINIC%2C%20KODHIPPARU%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Komandoo Clinic', 'Komandoo Clinic, Komandoo', '3326545', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Komandoo%20Clinic%2C%20Komandoo%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Kothaifaru Clinic', 'Kothaifaru Clinic, Kothaifaru', '3005515', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Kothaifaru%20Clinic%2C%20Kothaifaru%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Kulhelama Therapy', 'Kulhelama Therapy, Kulhelama', '7770422', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Kulhelama%20Therapy%2C%20Kulhelama%2C%20Maldives', 'Therapeutic Service Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Kulhudhuhfushi Regional Hospital', 'Kulhudhuhfushi Regional Hospital, Kulhudhuhfushi', '3328887', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Kulhudhuhfushi%20Regional%20Hospital%2C%20Kulhudhuhfushi%2C%20Maldives', 'Hospital Grade 3', 'Island', true, true, true, true, '24 hours', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Kulunu Medical Clinic', 'Kulunu Medical Clinic, Kulunu', '7790665 / 9771412', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Kulunu%20Medical%20Clinic%2C%20Kulunu%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Kunaavashi Clinic', 'Kunaavashi Clinic, Kunaavashi', '7942858', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Kunaavashi%20Clinic%2C%20Kunaavashi%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Kuramathi Medical Centre', 'Kuramathi Medical Centre, Kuramathi', '3323080', NULL, 'https://www.google.com/maps/search/?api=1&query=Kuramathi%20Medical%20Centre%2C%20Kuramathi%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Kuredhivaru Clinic', 'Kuredhivaru Clinic, Kuredhivaru', '9444200 / 6563000', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Kuredhivaru%20Clinic%2C%20Kuredhivaru%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Kurumba Clinic', 'Kurumba Clinic, Kurumba', '3323080', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Kurumba%20Clinic%2C%20Kurumba%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('KV Clinic', 'KV Clinic, KV', '9100091', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=KV%20Clinic%2C%20KV%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('L. Dhanbidhoo Health Centre', 'L. Dhanbidhoo Health Centre, L.', '6800026', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=L.%20Dhanbidhoo%20Health%20Centre%2C%20L.%2C%20Maldives', 'Health Centre Grade 1', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('L. Fonadhoo Health Centre', 'L. Fonadhoo Health Centre, L.', '6800026', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=L.%20Fonadhoo%20Health%20Centre%2C%20L.%2C%20Maldives', 'Health Centre Grade 3', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('L. Isdhoo Health Centre', 'L. Isdhoo Health Centre, L.', '6800026', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=L.%20Isdhoo%20Health%20Centre%2C%20L.%2C%20Maldives', 'Health Centre Grade 3', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('L. Kunahandhoo Health Centre', 'L. Kunahandhoo Health Centre, L.', '6800026', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=L.%20Kunahandhoo%20Health%20Centre%2C%20L.%2C%20Maldives', 'Health Centre Grade 1', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('L. Maabaidhoo Health Centre', 'L. Maabaidhoo Health Centre, L.', '6800026', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=L.%20Maabaidhoo%20Health%20Centre%2C%20L.%2C%20Maldives', 'Health Centre Grade 3', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('L. Maamendhoo Health center', 'L. Maamendhoo Health center, L.', '6800026', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=L.%20Maamendhoo%20Health%20center%2C%20L.%2C%20Maldives', 'Health Centre Grade 2', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('L. Maavashu Health Centre', 'L. Maavashu Health Centre, L.', '6800026', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=L.%20Maavashu%20Health%20Centre%2C%20L.%2C%20Maldives', 'Health Centre Grade 3', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('L. Mundoo Health Centre', 'L. Mundoo Health Centre, L.', '6800026', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=L.%20Mundoo%20Health%20Centre%2C%20L.%2C%20Maldives', 'Health Centre Grade 1', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('L.Gan Regional Hospital', 'L.Gan Regional Hospital, L.Gan', '6800026', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=L.Gan%20Regional%20Hospital%2C%20L.Gan%2C%20Maldives', 'Hospital Grade 3', 'Island', true, true, true, true, '24 hours', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('L.Hithadhoo Health Center', 'L.Hithadhoo Health Center, L.Hithadhoo', '6800026', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=L.Hithadhoo%20Health%20Center%2C%20L.Hithadhoo%2C%20Maldives', 'Health Centre Grade 3', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Leaf of Life Clinic', 'Leaf of Life Clinic, Leaf', '9486741', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Leaf%20of%20Life%20Clinic%2C%20Leaf%2C%20Maldives', 'Complementary Medicine Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Leykokaa Medical and Rehabilitation Centre', 'Leykokaa Medical and Rehabilitation Centre, Leykokaa', '9880909', NULL, 'https://www.google.com/maps/search/?api=1&query=Leykokaa%20Medical%20and%20Rehabilitation%20Centre%2C%20Leykokaa%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('LH. Atoll Hospital', 'LH. Atoll Hospital, LH.', '3328887', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=LH.%20Atoll%20Hospital%2C%20LH.%2C%20Maldives', 'Hospital Grade 2', 'Resort', true, true, true, true, '24 hours', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('LH. Hinnavaru Health Centre', 'LH. Hinnavaru Health Centre, LH.', '3328887', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=LH.%20Hinnavaru%20Health%20Centre%2C%20LH.%2C%20Maldives', 'Health Centre Grade 4', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('LH. Kurendhoo Health Centre', 'LH. Kurendhoo Health Centre, LH.', '3328887', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=LH.%20Kurendhoo%20Health%20Centre%2C%20LH.%2C%20Maldives', 'Health Centre Grade 3', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Lh.Olhuvelifushi Health Centre', 'Lh.Olhuvelifushi Health Centre', '3328887', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Lh.Olhuvelifushi%20Health%20Centre%2C%20%2C%20Maldives', 'Health Centre Grade 3', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Life Care Medical', 'Life Care Medical, Life', '764929', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Life%20Care%20Medical%2C%20Life%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Life Care Medical Centre', 'Life Care Medical Centre, Life', '7727040', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Life%20Care%20Medical%20Centre%2C%20Life%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Life Wellness Clinic', 'Life Wellness Clinic, Life', '9804197', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Life%20Wellness%20Clinic%2C%20Life%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Listen Clinic', 'Listen Clinic, Listen', '3326410', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Listen%20Clinic%2C%20Listen%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Lux Maldives Resort Clinic', 'Lux Maldives Resort Clinic, Lux', '3318826', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Lux%20Maldives%20Resort%20Clinic%2C%20Lux%2C%20Maldives', 'General Clinic', 'Resort', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('M. Dhiggaru Health Centre', 'M. Dhiggaru Health Centre, M.', '3328887', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=M.%20Dhiggaru%20Health%20Centre%2C%20M.%2C%20Maldives', 'Health Centre Grade 4', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('M. Kolhufushi Health Centre', 'M. Kolhufushi Health Centre, M.', '3328887', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=M.%20Kolhufushi%20Health%20Centre%2C%20M.%2C%20Maldives', 'Health Centre Grade 4', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('M. Maduvvaree Health Center', 'M. Maduvvaree Health Center, M.', '3328887', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=M.%20Maduvvaree%20Health%20Center%2C%20M.%2C%20Maldives', 'Health Centre Grade 4', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('M. Mulaku Health Centre', 'M. Mulaku Health Centre, M.', '3328887', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=M.%20Mulaku%20Health%20Centre%2C%20M.%2C%20Maldives', 'Health Centre Grade 3', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('M. Mulee Regional Hospital', 'M. Mulee Regional Hospital, M.', '3328887', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=M.%20Mulee%20Regional%20Hospital%2C%20M.%2C%20Maldives', 'Hospital Grade 1', 'Island', true, true, true, true, '24 hours', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('M. Naalaafushi Health Centre', 'M. Naalaafushi Health Centre, M.', '3328887', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=M.%20Naalaafushi%20Health%20Centre%2C%20M.%2C%20Maldives', 'Health Centre Grade 4', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('M. Raiymaadhoo Health Centre', 'M. Raiymaadhoo Health Centre, M.', '3328887', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=M.%20Raiymaadhoo%20Health%20Centre%2C%20M.%2C%20Maldives', 'Health Centre Grade 4', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('M. Veyvah Health Centre', 'M. Veyvah Health Centre, M.', '3328887', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=M.%20Veyvah%20Health%20Centre%2C%20M.%2C%20Maldives', 'Health Centre Grade 1', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('M.C.S. Medical Center 2', 'M.C.S. Medical Center 2', NULL, '[email protected]', 'https://www.google.com/maps/search/?api=1&query=M.C.S.%20Medical%20Center%202%2C%20%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Maadhoo Clinic', 'Maadhoo Clinic, Maadhoo', '3339992', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Maadhoo%20Clinic%2C%20Maadhoo%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Maafushivaru Clinic', 'Maafushivaru Clinic, Maafushivaru', NULL, NULL, 'https://www.google.com/maps/search/?api=1&query=Maafushivaru%20Clinic%2C%20Maafushivaru%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Maalifushi By COMO', 'Maalifushi By COMO, Maalifushi', '7778684', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Maalifushi%20By%20COMO%2C%20Maalifushi%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Maamigili Clinic', 'Maamigili Clinic, Maamigili', '7772991', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Maamigili%20Clinic%2C%20Maamigili%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Maandhoo Medical Centre', 'Maandhoo Medical Centre, Maandhoo', NULL, '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Maandhoo%20Medical%20Centre%2C%20Maandhoo%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Maayafushi Clinic', 'Maayafushi Clinic, Maayafushi', '7795352', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Maayafushi%20Clinic%2C%20Maayafushi%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('MACL Medical Clinic', 'MACL Medical Clinic, MACL', '3325511', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=MACL%20Medical%20Clinic%2C%20MACL%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Mafhaa Diagnostic Centre', 'Mafhaa Diagnostic Centre, Mafhaa', '3344949', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Mafhaa%20Diagnostic%20Centre%2C%20Mafhaa%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Magey Physio', 'Magey Physio, Magey', '9880909', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Magey%20Physio%2C%20Magey%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Maldicare', 'Maldicare', '3331590 / 7705335', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Maldicare%2C%20%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Maldives Alternative Medical Centre', 'Maldives Alternative Medical Centre, Maldives', '9990092', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Maldives%20Alternative%20Medical%20Centre%2C%20Maldives%2C%20Maldives', 'Traditional Medicine Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Maldives Correctional Service Medical Center', 'Maldives Correctional Service Medical Center, Maldives', '3026169 / 3026120', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Maldives%20Correctional%20Service%20Medical%20Center%2C%20Maldives%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Maldives Diagnostic Centre', 'Maldives Diagnostic Centre, Maldives', '7776968 / 7776943', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Maldives%20Diagnostic%20Centre%2C%20Maldives%2C%20Maldives', 'Diagnostic Service Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Maldives Emergency Medical Services', 'Maldives Emergency Medical Services, Maldives', '3328887', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Maldives%20Emergency%20Medical%20Services%2C%20Maldives%2C%20Maldives', 'Area Specific Centre', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Maldives Mobile Nursing Crae', 'Maldives Mobile Nursing Crae, Maldives', '9990220', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Maldives%20Mobile%20Nursing%20Crae%2C%20Maldives%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Maldives Neuro Endocrine Medical Facility', 'Maldives Neuro Endocrine Medical Facility, Maldives', '7702662', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Maldives%20Neuro%20Endocrine%20Medical%20Facility%2C%20Maldives%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Male'' Eye Clinic', 'Male'' Eye Clinic', '3326410', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Male%27%20Eye%20Clinic%2C%20%2C%20Maldives', 'Area Specific Clinic', 'Male', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Master Dental Care Centre', 'Master Dental Care Centre, Master', '7777466', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Master%20Dental%20Care%20Centre%2C%20Master%2C%20Maldives', 'Area Specific Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Master Dental Care Centro', 'Master Dental Care Centro, Master', '7777466', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Master%20Dental%20Care%20Centro%2C%20Master%2C%20Maldives', 'Area Specific Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Master Medical and Dental Care Centre', 'Master Medical and Dental Care Centre, Master', '7719970', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Master%20Medical%20and%20Dental%20Care%20Centre%2C%20Master%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Mavericks Care', 'Mavericks Care, Mavericks', '7778830', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Mavericks%20Care%2C%20Mavericks%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Maya Clinic', 'Maya Clinic, Maya', '7991281', '[email protected]/[email protected]', 'https://www.google.com/maps/search/?api=1&query=Maya%20Clinic%2C%20Maya%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Medhope Medical Centre', 'Medhope Medical Centre, Medhope', '7777169 /  3342910', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Medhope%20Medical%20Centre%2C%20Medhope%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Medica', 'Medica', '3007090', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Medica%2C%20%2C%20Maldives', 'General Hospital', 'Island', true, true, true, true, '24 hours', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Medical & Hyperbaric Clinic', 'Medical & Hyperbaric Clinic, Medical', NULL, NULL, 'https://www.google.com/maps/search/?api=1&query=Medical%20%26%20Hyperbaric%20Clinic%2C%20Medical%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Medicrest Clinic and Diagnostics', 'Medicrest Clinic and Diagnostics, Medicrest', '7897744', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Medicrest%20Clinic%20and%20Diagnostics%2C%20Medicrest%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Mediflex Dental and Maxillofacial Surgery', 'Mediflex Dental and Maxillofacial Surgery, Mediflex', '3000663', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Mediflex%20Dental%20and%20Maxillofacial%20Surgery%2C%20Mediflex%2C%20Maldives', 'Area Specific Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Mediflex Laboratories', 'Mediflex Laboratories, Mediflex', '3000663', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Mediflex%20Laboratories%2C%20Mediflex%2C%20Maldives', 'Diagnostic Service Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Mediflex Scan CentreClosed', 'Mediflex Scan CentreClosed, Mediflex', '3000663', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Mediflex%20Scan%20CentreClosed%2C%20Mediflex%2C%20Maldives', 'Diagnostic Service Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('MedLab Diagnostic', 'MedLab Diagnostic, MedLab', '3010878', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=MedLab%20Diagnostic%2C%20MedLab%2C%20Maldives', 'Diagnostic Service Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Mednova Medical Center', 'Mednova Medical Center, Mednova', '7784975', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Mednova%20Medical%20Center%2C%20Mednova%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Medplus Dental', 'Medplus Dental, Medplus', '7466253', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Medplus%20Dental%2C%20Medplus%2C%20Maldives', 'Area Specific Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Meedhupparu Clinic', 'Meedhupparu Clinic, Meedhupparu', '3315236', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Meedhupparu%20Clinic%2C%20Meedhupparu%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Meeru Clinic', 'Meeru Clinic, Meeru', '6643157', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Meeru%20Clinic%2C%20Meeru%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Mercure Maldives Kooddoo Clinic', 'Mercure Maldives Kooddoo Clinic, Mercure', '3333887', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Mercure%20Maldives%20Kooddoo%20Clinic%2C%20Mercure%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Milaidhoo Clinic', 'Milaidhoo Clinic, Milaidhoo', '3323080', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Milaidhoo%20Clinic%2C%20Milaidhoo%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Mind Space', 'Mind Space, Mind', '7774997', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Mind%20Space%2C%20Mind%2C%20Maldives', 'Therapeutic Service Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Mindcare Clinic', 'Mindcare Clinic, Mindcare', '7717174 / 7868676', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Mindcare%20Clinic%2C%20Mindcare%2C%20Maldives', 'Therapeutic Service Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('MIOT Rehab Centre - Maldives', 'MIOT Rehab Centre - Maldives, MIOT', NULL, '[email protected]', 'https://www.google.com/maps/search/?api=1&query=MIOT%20Rehab%20Centre%20-%20Maldives%2C%20MIOT%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Mipstar Clinic', 'Mipstar Clinic, Mipstar', '7800076', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Mipstar%20Clinic%2C%20Mipstar%2C%20Maldives', 'Area Specific Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Mirage Clinic', 'Mirage Clinic, Mirage', '7797990', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Mirage%20Clinic%2C%20Mirage%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Miriandhoo Medical Services', 'Miriandhoo Medical Services, Miriandhoo', '7469981 / 3341775', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Miriandhoo%20Medical%20Services%2C%20Miriandhoo%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Modern Medical Centre', 'Modern Medical Centre, Modern', '9993148', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Modern%20Medical%20Centre%2C%20Modern%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Moving Cure', 'Moving Cure, Moving', '7792030', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Moving%20Cure%2C%20Moving%2C%20Maldives', 'Therapeutic Service Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('MPI Clinique', 'MPI Clinique, MPI', '3330888', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=MPI%20Clinique%2C%20MPI%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Mudhdhoo Clinic', 'Mudhdhoo Clinic, Mudhdhoo', '7778830', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Mudhdhoo%20Clinic%2C%20Mudhdhoo%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Muraka Clinic', 'Muraka Clinic, Muraka', '7772991', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Muraka%20Clinic%2C%20Muraka%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('MV DX Diagnostics', 'MV DX Diagnostics, MV', '3337010, 7661885', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=MV%20DX%20Diagnostics%2C%20MV%2C%20Maldives', 'Diagnostic Service Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('My Care Medical Centre', 'My Care Medical Centre, My', '7771504', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=My%20Care%20Medical%20Centre%2C%20My%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('My Clinic', 'My Clinic, My', '7776313', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=My%20Clinic%2C%20My%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('My Dental Care', 'My Dental Care, My', '7933404', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=My%20Dental%20Care%2C%20My%2C%20Maldives', 'Area Specific Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('My Dentist', 'My Dentist, My', '7933404 / 3350888', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=My%20Dentist%2C%20My%2C%20Maldives', 'Area Specific Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('My Family Dentist', 'My Family Dentist, My', '9942318', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=My%20Family%20Dentist%2C%20My%2C%20Maldives', 'Area Specific Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('My Family Dentist Male''', 'My Family Dentist Male'', My', '7774331', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=My%20Family%20Dentist%20Male%27%2C%20My%2C%20Maldives', 'Area Specific Clinic', 'Male', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('My LabClosed', 'My LabClosed, My', '9774131 / 7720360', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=My%20LabClosed%2C%20My%2C%20Maldives', 'Diagnostic Service Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('My LabClosed', 'My LabClosed, My', '9774131 / 7720360', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=My%20LabClosed%2C%20My%2C%20Maldives', 'Diagnostic Service Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('My Lab DharavandhooClosed', 'My Lab DharavandhooClosed, My', '9774131', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=My%20Lab%20DharavandhooClosed%2C%20My%2C%20Maldives', 'Diagnostic Service Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('My Medical Center', 'My Medical Center, My', '7778893', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=My%20Medical%20Center%2C%20My%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('N. Atoll hospital', 'N. Atoll hospital, Noonu Atoll', '3328887', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=N.%20Atoll%20hospital%2C%20Noonu%20Atoll%2C%20Maldives', 'Hospital Grade 2', 'Resort', true, true, true, true, '24 hours', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('N. Fohdhoo Health Centre', 'N. Fohdhoo Health Centre, Noonu Atoll', '3328887', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=N.%20Fohdhoo%20Health%20Centre%2C%20Noonu%20Atoll%2C%20Maldives', 'Health Centre Grade 1', 'Resort', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('N. Henbadhoo Health Centre', 'N. Henbadhoo Health Centre, Noonu Atoll', '3328887', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=N.%20Henbadhoo%20Health%20Centre%2C%20Noonu%20Atoll%2C%20Maldives', 'Health Centre Grade 1', 'Resort', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('N. Holhudhoo Health Centre', 'N. Holhudhoo Health Centre, Noonu Atoll', '3328887', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=N.%20Holhudhoo%20Health%20Centre%2C%20Noonu%20Atoll%2C%20Maldives', 'Health Centre Grade 3', 'Resort', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('N. Kendhikulhudhoo Health Centre', 'N. Kendhikulhudhoo Health Centre, Noonu Atoll', '3328887', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=N.%20Kendhikulhudhoo%20Health%20Centre%2C%20Noonu%20Atoll%2C%20Maldives', 'Health Centre Grade 2', 'Resort', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('N. Kudafari Health Centre', 'N. Kudafari Health Centre, Noonu Atoll', '3328887', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=N.%20Kudafari%20Health%20Centre%2C%20Noonu%20Atoll%2C%20Maldives', 'Health Centre Grade 1', 'Resort', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('N. Landhoo Health Centre', 'N. Landhoo Health Centre, Noonu Atoll', '3328887', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=N.%20Landhoo%20Health%20Centre%2C%20Noonu%20Atoll%2C%20Maldives', 'Health Centre Grade 2', 'Resort', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('N. Lhohi Health Centre', 'N. Lhohi Health Centre, Noonu Atoll', '3328887', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=N.%20Lhohi%20Health%20Centre%2C%20Noonu%20Atoll%2C%20Maldives', 'Health Centre Grade 1', 'Resort', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('N. Maafaru Health Center', 'N. Maafaru Health Center, Noonu Atoll', '3328887', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=N.%20Maafaru%20Health%20Center%2C%20Noonu%20Atoll%2C%20Maldives', 'Health Centre Grade 3', 'Resort', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('N. Maalhendhoo Health Centre', 'N. Maalhendhoo Health Centre, Noonu Atoll', '3328887', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=N.%20Maalhendhoo%20Health%20Centre%2C%20Noonu%20Atoll%2C%20Maldives', 'Health Centre Grade 1', 'Resort', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('N. Magoodhoo Health Centre', 'N. Magoodhoo Health Centre, Noonu Atoll', '3328887', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=N.%20Magoodhoo%20Health%20Centre%2C%20Noonu%20Atoll%2C%20Maldives', 'Health Centre Grade 1', 'Resort', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('N. Miladhoo Health Centre', 'N. Miladhoo Health Centre, Noonu Atoll', '3328887', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=N.%20Miladhoo%20Health%20Centre%2C%20Noonu%20Atoll%2C%20Maldives', 'Health Centre Grade 2', 'Resort', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('N. Velidhoo Health Centre', 'N. Velidhoo Health Centre, Noonu Atoll', '3328887', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=N.%20Velidhoo%20Health%20Centre%2C%20Noonu%20Atoll%2C%20Maldives', 'Health Centre Grade 4', 'Resort', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Nada Clinic', 'Nada Clinic, Nada', '7773882', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Nada%20Clinic%2C%20Nada%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Nada Clinic', 'Nada Clinic, Nada', '7773882', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Nada%20Clinic%2C%20Nada%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Nafsu Psychological Services', 'Nafsu Psychological Services, Nafsu', '7355554 /9181817', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Nafsu%20Psychological%20Services%2C%20Nafsu%2C%20Maldives', 'Therapeutic Service Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Naifaru Medical Center', 'Naifaru Medical Center, Naifaru', '6620340', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Naifaru%20Medical%20Center%2C%20Naifaru%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Nautilus Medical Center', 'Nautilus Medical Center, Nautilus', '7309846', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Nautilus%20Medical%20Center%2C%20Nautilus%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('NazaHealth', 'NazaHealth', '7793638', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=NazaHealth%2C%20%2C%20Maldives', 'Therapeutic Service Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Niyama Resort Clinic', 'Niyama Resort Clinic, Niyama', '7906095', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Niyama%20Resort%20Clinic%2C%20Niyama%2C%20Maldives', 'General Clinic', 'Resort', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Niyama Resort Clinic', 'Niyama Resort Clinic, Niyama', '7951795', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Niyama%20Resort%20Clinic%2C%20Niyama%2C%20Maldives', 'General Clinic', 'Resort', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Noo Clinic', 'Noo Clinic, Noo', '3009094 / 3009095', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Noo%20Clinic%2C%20Noo%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Noosandha', 'Noosandha', '3300078', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Noosandha%2C%20%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Noosandha - Addu', 'Noosandha - Addu, Noosandha', NULL, '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Noosandha%20-%20Addu%2C%20Noosandha%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Nova Clinic', 'Nova Clinic, Nova', '7242787', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Nova%20Clinic%2C%20Nova%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Novalux DiagnosticsClosed', 'Novalux DiagnosticsClosed, Novalux', '3309900', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Novalux%20DiagnosticsClosed%2C%20Novalux%2C%20Maldives', 'Diagnostic Service Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Nowall Medical Centre', 'Nowall Medical Centre, Nowall', '9678182 /7847616', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Nowall%20Medical%20Centre%2C%20Nowall%2C%20Maldives', 'Area Specific Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('NU Hospitals Clinic', 'NU Hospitals Clinic, NU', '3353535', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=NU%20Hospitals%20Clinic%2C%20NU%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Oagaa Medical Centre', 'Oagaa Medical Centre, Oagaa', '7772856', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Oagaa%20Medical%20Centre%2C%20Oagaa%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Olive Medical Centre', 'Olive Medical Centre, Olive', '7288698', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Olive%20Medical%20Centre%2C%20Olive%2C%20Maldives', 'Area Specific Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Omega Medical Centre', 'Omega Medical Centre, Omega', '7773720', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Omega%20Medical%20Centre%2C%20Omega%2C%20Maldives', 'Area Specific Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Omni Care Clinic', 'Omni Care Clinic, Omni', '-', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Omni%20Care%20Clinic%2C%20Omni%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('One Medical Care', 'One Medical Care, One', '7864768', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=One%20Medical%20Care%2C%20One%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Oracare Dental', 'Oracare Dental, Oracare', NULL, NULL, 'https://www.google.com/maps/search/?api=1&query=Oracare%20Dental%2C%20Oracare%2C%20Maldives', 'Area Specific Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Ouch Clinic', 'Ouch Clinic, Ouch', '7772991', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Ouch%20Clinic%2C%20Ouch%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Pain Clinic', 'Pain Clinic, Pain', '7800699', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Pain%20Clinic%2C%20Pain%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Paradise Medical Centre', 'Paradise Medical Centre, Paradise', NULL, '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Paradise%20Medical%20Centre%2C%20Paradise%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Pearl Medical Centre', 'Pearl Medical Centre, Pearl', '3305550, 3315550', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Pearl%20Medical%20Centre%2C%20Pearl%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Pearl Medical Centre Hulhumale', 'Pearl Medical Centre Hulhumale, Pearl', '3315550 / 3305550', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Pearl%20Medical%20Centre%20Hulhumale%2C%20Pearl%2C%20Maldives', 'General Clinic', 'Hulhumale', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Physio & Autism Clinic - Hulhumale''', 'Physio & Autism Clinic - Hulhumale'', Physio', '7852044', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Physio%20%26%20Autism%20Clinic%20-%20Hulhumale%27%2C%20Physio%2C%20Maldives', 'Therapeutic Service Clinic', 'Hulhumale', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Physio and Autism Clinic', 'Physio and Autism Clinic, Physio', '9990936', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Physio%20and%20Autism%20Clinic%2C%20Physio%2C%20Maldives', 'Therapeutic Service Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Physio Clinic', 'Physio Clinic, Physio', '9553112 / 7943112', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Physio%20Clinic%2C%20Physio%2C%20Maldives', 'Therapeutic Service Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Physio Cure', 'Physio Cure, Physio', '7788595', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Physio%20Cure%2C%20Physio%2C%20Maldives', 'Therapeutic Service Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Physio Solutions', 'Physio Solutions, Physio', '7949849', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Physio%20Solutions%2C%20Physio%2C%20Maldives', 'Therapeutic Service Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Pine Tree Medic Care', 'Pine Tree Medic Care, Pine', '9501429', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Pine%20Tree%20Medic%20Care%2C%20Pine%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Pine Tree Medic Care Sh. Funadhoo', 'Pine Tree Medic Care Sh. Funadhoo, Pine', '7786635', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Pine%20Tree%20Medic%20Care%20Sh.%20Funadhoo%2C%20Pine%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Point Medical Care', 'Point Medical Care, Point', '7776612', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Point%20Medical%20Care%2C%20Point%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Popular Clinic', 'Popular Clinic, Popular', '7778298', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Popular%20Clinic%2C%20Popular%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Primax Medi Care', 'Primax Medi Care, Primax', '7980528', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Primax%20Medi%20Care%2C%20Primax%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Pro Care Clinic & Dental Centre', 'Pro Care Clinic & Dental Centre, Pro', '9112445', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Pro%20Care%20Clinic%20%26%20Dental%20Centre%2C%20Pro%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Pullman Maamutaa Maldives Resort Clinic', 'Pullman Maamutaa Maldives Resort Clinic, Pullman', '3333887', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Pullman%20Maamutaa%20Maldives%20Resort%20Clinic%2C%20Pullman%2C%20Maldives', 'General Clinic', 'Resort', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Pulse Medical and Diagnostics', 'Pulse Medical and Diagnostics, Pulse', '3300044 / 7320055', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Pulse%20Medical%20and%20Diagnostics%2C%20Pulse%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Pulse Point Medical Center', 'Pulse Point Medical Center, Pulse', '7734713', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Pulse%20Point%20Medical%20Center%2C%20Pulse%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Queen Aesthetic Medical Center', 'Queen Aesthetic Medical Center, Queen', '9898897', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Queen%20Aesthetic%20Medical%20Center%2C%20Queen%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('R. Alifushi Health Center', 'R. Alifushi Health Center, Raa Atoll', '3328887', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=R.%20Alifushi%20Health%20Center%2C%20Raa%20Atoll%2C%20Maldives', 'Health Centre Grade 3', 'Resort', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('R. Angolhitheem Health Centre', 'R. Angolhitheem Health Centre, Raa Atoll', '3328887', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=R.%20Angolhitheem%20Health%20Centre%2C%20Raa%20Atoll%2C%20Maldives', 'Health Centre Grade 1', 'Resort', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('R. Dhuvaafaru Health Centre', 'R. Dhuvaafaru Health Centre, Raa Atoll', '3328887', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=R.%20Dhuvaafaru%20Health%20Centre%2C%20Raa%20Atoll%2C%20Maldives', 'Health Centre Grade 4', 'Resort', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('R. Fainu Health Centre', 'R. Fainu Health Centre, Raa Atoll', '3328887', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=R.%20Fainu%20Health%20Centre%2C%20Raa%20Atoll%2C%20Maldives', 'Health Centre Grade 1', 'Resort', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('R. Hulhudhuffaaru Heath Centre', 'R. Hulhudhuffaaru Heath Centre, Raa Atoll', '3328887', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=R.%20Hulhudhuffaaru%20Heath%20Centre%2C%20Raa%20Atoll%2C%20Maldives', 'Health Centre Grade 3', 'Resort', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('R. Inguraidhoo Health Centre', 'R. Inguraidhoo Health Centre, Raa Atoll', '3328887', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=R.%20Inguraidhoo%20Health%20Centre%2C%20Raa%20Atoll%2C%20Maldives', 'Health Centre Grade 3', 'Resort', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('R. Innamaadhoo Health Centre', 'R. Innamaadhoo Health Centre, Raa Atoll', '3328887', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=R.%20Innamaadhoo%20Health%20Centre%2C%20Raa%20Atoll%2C%20Maldives', 'Health Centre Grade 1', 'Resort', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('R. Kinolhohu Health Centre', 'R. Kinolhohu Health Centre, Raa Atoll', '3328887', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=R.%20Kinolhohu%20Health%20Centre%2C%20Raa%20Atoll%2C%20Maldives', 'Health Centre Grade 1', 'Resort', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('R. Maakurath Health Centre', 'R. Maakurath Health Centre, Raa Atoll', '3328887', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=R.%20Maakurath%20Health%20Centre%2C%20Raa%20Atoll%2C%20Maldives', 'Health Centre Grade 2', 'Resort', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('R. Madduvari Health Centre', 'R. Madduvari Health Centre, Raa Atoll', '3328887', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=R.%20Madduvari%20Health%20Centre%2C%20Raa%20Atoll%2C%20Maldives', 'Health Centre Grade 3', 'Resort', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('R. Meedhoo Health Centre', 'R. Meedhoo Health Centre, Raa Atoll', '3328887', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=R.%20Meedhoo%20Health%20Centre%2C%20Raa%20Atoll%2C%20Maldives', 'Health Centre Grade 3', 'Resort', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('R. Rasgetheem Health Centre', 'R. Rasgetheem Health Centre, Raa Atoll', '3328887', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=R.%20Rasgetheem%20Health%20Centre%2C%20Raa%20Atoll%2C%20Maldives', 'Health Centre Grade 1', 'Resort', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('R. Rasmaadhoo Health Center', 'R. Rasmaadhoo Health Center, Raa Atoll', '3328887', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=R.%20Rasmaadhoo%20Health%20Center%2C%20Raa%20Atoll%2C%20Maldives', 'Health Centre Grade 1', 'Resort', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Raa. Vaadhoo Health Centre', 'Raa. Vaadhoo Health Centre, Raa.', '3328887', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Raa.%20Vaadhoo%20Health%20Centre%2C%20Raa.%2C%20Maldives', 'Health Centre Grade 1', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Raaya Clinic', 'Raaya Clinic, Raaya', '7902612', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Raaya%20Clinic%2C%20Raaya%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Raffles Clinic', 'Raffles Clinic, Raffles', '7731865', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Raffles%20Clinic%2C%20Raffles%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Rangali Clinic', 'Rangali Clinic, Rangali', '7772991', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Rangali%20Clinic%2C%20Rangali%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Rannalhi Clinic', 'Rannalhi Clinic, Rannalhi', '3315236', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Rannalhi%20Clinic%2C%20Rannalhi%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Rasfushi Clinic', 'Rasfushi Clinic, Rasfushi', '6643880', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Rasfushi%20Clinic%2C%20Rasfushi%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Recovery Room', 'Recovery Room, Recovery', '7416222', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Recovery%20Room%2C%20Recovery%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Reethi Beach Clilnic', 'Reethi Beach Clilnic, Reethi', '7931744', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Reethi%20Beach%20Clilnic%2C%20Reethi%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Reethi Faru Clinic', 'Reethi Faru Clinic, Reethi', '7962626', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Reethi%20Faru%20Clinic%2C%20Reethi%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Resort Clinic', 'Resort Clinic, Resort', NULL, '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Resort%20Clinic%2C%20Resort%2C%20Maldives', 'General Clinic', 'Resort', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Resort Medical and Laboratory Services', 'Resort Medical and Laboratory Services, Resort', '3315550 / 3305550', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Resort%20Medical%20and%20Laboratory%20Services%2C%20Resort%2C%20Maldives', 'Diagnostic Service Clinic', 'Resort', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Revive Medical Centre', 'Revive Medical Centre, Revive', '7816600 / 7791145 / 9798148', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Revive%20Medical%20Centre%2C%20Revive%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('RMLS Lab Services', 'RMLS Lab Services, RMLS', '3355001 / 3355002', '[email protected]/[email protected]', 'https://www.google.com/maps/search/?api=1&query=RMLS%20Lab%20Services%2C%20RMLS%2C%20Maldives', 'Diagnostic Service Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Royal Island Medical Center', 'Royal Island Medical Center, Royal', '3325195', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Royal%20Island%20Medical%20Center%2C%20Royal%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Ruhgalu Clinic', 'Ruhgalu Clinic, Ruhgalu', '3330007 / 7775846', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Ruhgalu%20Clinic%2C%20Ruhgalu%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Rx Medicare', 'Rx Medicare, Rx', '7773611', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Rx%20Medicare%2C%20Rx%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('S. Feydhoo Health Centre', 'S. Feydhoo Health Centre, Shaviyani Atoll', '3328887', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=S.%20Feydhoo%20Health%20Centre%2C%20Shaviyani%20Atoll%2C%20Maldives', 'Health Centre Grade 3', 'Resort', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('S. Hulhu-Meedhoo Health Centre', 'S. Hulhu-Meedhoo Health Centre, Shaviyani Atoll', '3328887', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=S.%20Hulhu-Meedhoo%20Health%20Centre%2C%20Shaviyani%20Atoll%2C%20Maldives', 'Health Centre Grade 3', 'Resort', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('S. Maradhoo Health Centre', 'S. Maradhoo Health Centre, Shaviyani Atoll', '3328887', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=S.%20Maradhoo%20Health%20Centre%2C%20Shaviyani%20Atoll%2C%20Maldives', 'Health Centre Grade 3', 'Resort', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Safari Clinic', 'Safari Clinic, Safari', '7778467', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Safari%20Clinic%2C%20Safari%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Sandies Bathala Infirmary', 'Sandies Bathala Infirmary, Sandies', '7905040', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Sandies%20Bathala%20Infirmary%2C%20Sandies%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Sangeli Clinic', 'Sangeli Clinic, Sangeli', '3339992', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Sangeli%20Clinic%2C%20Sangeli%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('SC Dental Care', 'SC Dental Care, SC', '7782329', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=SC%20Dental%20Care%2C%20SC%2C%20Maldives', 'Area Specific Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Seen Hijama & Wellness', 'Seen Hijama & Wellness, Seen', '7459792', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Seen%20Hijama%20%26%20Wellness%2C%20Seen%2C%20Maldives', 'Complementary Medicine Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Senahiya Military Hospital', 'Senahiya Military Hospital, Senahiya', '3322601', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Senahiya%20Military%20Hospital%2C%20Senahiya%2C%20Maldives', 'General Hospital', 'Island', true, true, true, true, '24 hours', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Senahiya Nothern', 'Senahiya Nothern, Senahiya', '3322607', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Senahiya%20Nothern%2C%20Senahiya%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Sh. Bilehfahi Health Centre', 'Sh. Bilehfahi Health Centre, Sh.', '3328887', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Sh.%20Bilehfahi%20Health%20Centre%2C%20Sh.%2C%20Maldives', 'Health Centre Grade 1', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Sh. Feevah Health Centre', 'Sh. Feevah Health Centre, Sh.', '3328887', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Sh.%20Feevah%20Health%20Centre%2C%20Sh.%2C%20Maldives', 'Health Centre Grade 2', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Sh. Feydhoo Health Centre', 'Sh. Feydhoo Health Centre, Sh.', '3328887', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Sh.%20Feydhoo%20Health%20Centre%2C%20Sh.%2C%20Maldives', 'Health Centre Grade 2', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Sh. Fokaidhoo Health Centre', 'Sh. Fokaidhoo Health Centre, Sh.', '3328887', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Sh.%20Fokaidhoo%20Health%20Centre%2C%20Sh.%2C%20Maldives', 'Health Centre Grade 3', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Sh. Funadhoo Atoll Hospital', 'Sh. Funadhoo Atoll Hospital, Sh.', '3328887', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Sh.%20Funadhoo%20Atoll%20Hospital%2C%20Sh.%2C%20Maldives', 'Hospital Grade 2', 'Resort', true, true, true, true, '24 hours', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Sh. Goidhoo Health Centre', 'Sh. Goidhoo Health Centre, Sh.', '3328887', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Sh.%20Goidhoo%20Health%20Centre%2C%20Sh.%2C%20Maldives', 'Health Centre Grade 1', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Sh. Kanditheem Health Centre', 'Sh. Kanditheem Health Centre, Sh.', '3328887', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Sh.%20Kanditheem%20Health%20Centre%2C%20Sh.%2C%20Maldives', 'Health Centre Grade 2', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Sh. Komandoo Health Centre', 'Sh. Komandoo Health Centre, Sh.', '3328887', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Sh.%20Komandoo%20Health%20Centre%2C%20Sh.%2C%20Maldives', 'Health Centre Grade 3', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Sh. Lhaimagu Health Centre', 'Sh. Lhaimagu Health Centre, Sh.', '3328887', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Sh.%20Lhaimagu%20Health%20Centre%2C%20Sh.%2C%20Maldives', 'Health Centre Grade 1', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Sh. Maaugoodhoo Health Centre', 'Sh. Maaugoodhoo Health Centre, Sh.', '3328887', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Sh.%20Maaugoodhoo%20Health%20Centre%2C%20Sh.%2C%20Maldives', 'Health Centre Grade 2', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Sh. Maroshi Health Centre', 'Sh. Maroshi Health Centre, Sh.', '3328887', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Sh.%20Maroshi%20Health%20Centre%2C%20Sh.%2C%20Maldives', 'Health Centre Grade 2', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Sh. Milandhoo Health Centre', 'Sh. Milandhoo Health Centre, Sh.', '3328887', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Sh.%20Milandhoo%20Health%20Centre%2C%20Sh.%2C%20Maldives', 'Health Centre Grade 3', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Sh. Narudhoo Health Centre', 'Sh. Narudhoo Health Centre, Sh.', '3328887', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Sh.%20Narudhoo%20Health%20Centre%2C%20Sh.%2C%20Maldives', 'Health Centre Grade 1', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Sh. Noomara Health Centre', 'Sh. Noomara Health Centre, Sh.', '3328887', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Sh.%20Noomara%20Health%20Centre%2C%20Sh.%2C%20Maldives', 'Health Centre Grade 1', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Sha Therapy Dhivehibeys Centre', 'Sha Therapy Dhivehibeys Centre, Sha', '7252022 / 7954904', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Sha%20Therapy%20Dhivehibeys%20Centre%2C%20Sha%2C%20Maldives', 'Traditional Medicine Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Shifaa Medical', 'Shifaa Medical, Shifaa', '7771551', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Shifaa%20Medical%2C%20Shifaa%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Shuba''s Herbal Medicine CenterClosed', 'Shuba''s Herbal Medicine CenterClosed', '7738424', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Shuba%27s%20Herbal%20Medicine%20CenterClosed%2C%20%2C%20Maldives', 'Therapeutic Service Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Shuba''s Medical Centre', 'Shuba''s Medical Centre', '7477576', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Shuba%27s%20Medical%20Centre%2C%20%2C%20Maldives', 'Complementary Medicine Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('SILVER CARE CLINIC', 'SILVER CARE CLINIC, SILVER', '7799633', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=SILVER%20CARE%20CLINIC%2C%20SILVER%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Siyam World Maldives Clinic', 'Siyam World Maldives Clinic, Siyam', '3023704 / 7234929', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Siyam%20World%20Maldives%20Clinic%2C%20Siyam%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Smiles Dental Care', 'Smiles Dental Care, Smiles', '7777792', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Smiles%20Dental%20Care%2C%20Smiles%2C%20Maldives', 'Area Specific Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Smiles Dental Care Hulhumale''', 'Smiles Dental Care Hulhumale'', Smiles', '7781071', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Smiles%20Dental%20Care%20Hulhumale%27%2C%20Smiles%2C%20Maldives', 'Area Specific Clinic', 'Hulhumale', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('So Caring', 'So Caring, So', '3017201', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=So%20Caring%2C%20So%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('SO/ Maldives Clinic', 'SO/ Maldives Clinic', '7469981', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=SO/%20Maldives%20Clinic%2C%20%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Soneva Fushi Clinic', 'Soneva Fushi Clinic, Soneva', '3017201', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Soneva%20Fushi%20Clinic%2C%20Soneva%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Soneva Jani Clinic', 'Soneva Jani Clinic, Soneva', '3017201', '-', 'https://www.google.com/maps/search/?api=1&query=Soneva%20Jani%20Clinic%2C%20Soneva%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Southern Care Clinic', 'Southern Care Clinic, Southern', '9991120', '[email protected]/[email protected]', 'https://www.google.com/maps/search/?api=1&query=Southern%20Care%20Clinic%2C%20Southern%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Spectrum Child Development Center', 'Spectrum Child Development Center, Spectrum', '7779993', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Spectrum%20Child%20Development%20Center%2C%20Spectrum%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Star Medical', 'Star Medical, Star', '7777727', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Star%20Medical%2C%20Star%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Stem CenterClosed', 'Stem CenterClosed, Stem', '7215556', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Stem%20CenterClosed%2C%20Stem%2C%20Maldives', 'Therapeutic Service Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Sukoon Clinic', 'Sukoon Clinic, Sukoon', '7313260', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Sukoon%20Clinic%2C%20Sukoon%2C%20Maldives', 'Complementary Medicine Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Sun Island Medical Centre', 'Sun Island Medical Centre, Sun', '3325195', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Sun%20Island%20Medical%20Centre%2C%20Sun%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Sun Siyam Irufushi Maldives Clinic', 'Sun Siyam Irufushi Maldives Clinic, Sun', '3325977 / 7234929', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Sun%20Siyam%20Irufushi%20Maldives%20Clinic%2C%20Sun%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Sun Siyam Iruveli Maldives Clinic', 'Sun Siyam Iruveli Maldives Clinic, Sun', '3325977', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Sun%20Siyam%20Iruveli%20Maldives%20Clinic%2C%20Sun%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Sun Siyam Olhuveli Maldives Clinic', 'Sun Siyam Olhuveli Maldives Clinic, Sun', '3325977', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Sun%20Siyam%20Olhuveli%20Maldives%20Clinic%2C%20Sun%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Sun Siyam Vilu Reef Maldives Clinic', 'Sun Siyam Vilu Reef Maldives Clinic, Sun', '3325977 / 7234929', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Sun%20Siyam%20Vilu%20Reef%20Maldives%20Clinic%2C%20Sun%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Surgicare Clinic', 'Surgicare Clinic, Surgicare', '7995767', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Surgicare%20Clinic%2C%20Surgicare%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Synergy Care', 'Synergy Care, Synergy', '3353535', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Synergy%20Care%2C%20Synergy%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Taj Exotica Clinic', 'Taj Exotica Clinic, Taj', '3322011', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Taj%20Exotica%20Clinic%2C%20Taj%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Th. Atoll Hospital', 'Th. Atoll Hospital, Thaa Atoll', '3328887', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Th.%20Atoll%20Hospital%2C%20Thaa%20Atoll%2C%20Maldives', 'Hospital Grade 2', 'Resort', true, true, true, true, '24 hours', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('TH. Buruni Health Centre', 'TH. Buruni Health Centre, TH.', '3328887', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=TH.%20Buruni%20Health%20Centre%2C%20TH.%2C%20Maldives', 'Health Centre Grade 2', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('TH. Dhiyamigili Health Centre', 'TH. Dhiyamigili Health Centre, TH.', '3328887', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=TH.%20Dhiyamigili%20Health%20Centre%2C%20TH.%2C%20Maldives', 'Health Centre Grade 2', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('TH. Gaadhifushi Health Centre', 'TH. Gaadhifushi Health Centre, TH.', '3328887', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=TH.%20Gaadhifushi%20Health%20Centre%2C%20TH.%2C%20Maldives', 'Health Centre Grade 1', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('TH. Guraidhoo Health Centre', 'TH. Guraidhoo Health Centre, TH.', '3328887', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=TH.%20Guraidhoo%20Health%20Centre%2C%20TH.%2C%20Maldives', 'Health Centre Grade 3', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('TH. Hirilandhoo Health Centre', 'TH. Hirilandhoo Health Centre, TH.', '3328887', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=TH.%20Hirilandhoo%20Health%20Centre%2C%20TH.%2C%20Maldives', 'Health Centre Grade 3', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Th. Kandoodhoo Health Center', 'Th. Kandoodhoo Health Center, Thaa Atoll', '3328887', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Th.%20Kandoodhoo%20Health%20Center%2C%20Thaa%20Atoll%2C%20Maldives', 'Health Centre Grade 1', 'Resort', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('TH. Kin''bidhoo health Centre', 'TH. Kin''bidhoo health Centre, TH.', '3328887', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=TH.%20Kin%27bidhoo%20health%20Centre%2C%20TH.%2C%20Maldives', 'Health Centre Grade 2', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Th. Madifushi Health Centre', 'Th. Madifushi Health Centre, Thaa Atoll', '3328887', 'th.madifushihc@@health.gov.mv', 'https://www.google.com/maps/search/?api=1&query=Th.%20Madifushi%20Health%20Centre%2C%20Thaa%20Atoll%2C%20Maldives', 'Health Centre Grade 3', 'Resort', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Th. Omadhoo Health Centre', 'Th. Omadhoo Health Centre, Thaa Atoll', '3328887', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Th.%20Omadhoo%20Health%20Centre%2C%20Thaa%20Atoll%2C%20Maldives', 'Health Centre Grade 2', 'Resort', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Th. Thimarafushi Health Centre', 'Th. Thimarafushi Health Centre, Thaa Atoll', '3328887', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Th.%20Thimarafushi%20Health%20Centre%2C%20Thaa%20Atoll%2C%20Maldives', 'Health Centre Grade 3', 'Resort', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('TH. Vandhoo Health Centre', 'TH. Vandhoo Health Centre, TH.', '3328887', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=TH.%20Vandhoo%20Health%20Centre%2C%20TH.%2C%20Maldives', 'Health Centre Grade 1', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Th. Villifushi Health Centre', 'Th. Villifushi Health Centre, Thaa Atoll', '3328887', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Th.%20Villifushi%20Health%20Centre%2C%20Thaa%20Atoll%2C%20Maldives', 'Health Centre Grade 3', 'Resort', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Thasalli medical Care', 'Thasalli medical Care, Thasalli', '3009600', NULL, 'https://www.google.com/maps/search/?api=1&query=Thasalli%20medical%20Care%2C%20Thasalli%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('The Clinic', 'The Clinic, The', '3334888', NULL, 'https://www.google.com/maps/search/?api=1&query=The%20Clinic%2C%20The%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('The Clinic at Jumeirah Maldives Olhahali Island', 'The Clinic at Jumeirah Maldives Olhahali Island, The', '7302601', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=The%20Clinic%20at%20Jumeirah%20Maldives%20Olhahali%20Island%2C%20The%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('The Clinic At Sirru Fen Fushi', 'The Clinic At Sirru Fen Fushi, The', '7797779', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=The%20Clinic%20At%20Sirru%20Fen%20Fushi%2C%20The%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('The Clinic at Summer Island Maldives', 'The Clinic at Summer Island Maldives, The', '7975496', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=The%20Clinic%20at%20Summer%20Island%20Maldives%2C%20The%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('The Residence Maldives at Dhigurah Clinic', 'The Residence Maldives at Dhigurah Clinic, The', '6820089 / 7900278', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=The%20Residence%20Maldives%20at%20Dhigurah%20Clinic%2C%20The%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('The Residence Maldives at Falhumaafushi Clinic', 'The Residence Maldives at Falhumaafushi Clinic, The', NULL, '[email protected]', 'https://www.google.com/maps/search/?api=1&query=The%20Residence%20Maldives%20at%20Falhumaafushi%20Clinic%2C%20The%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('The Standard Clinic', 'The Standard Clinic, The', '7731865', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=The%20Standard%20Clinic%2C%20The%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Therapy Centre', 'Therapy Centre, Therapy', '7797974', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Therapy%20Centre%2C%20Therapy%2C%20Maldives', 'Therapeutic Service Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Thilamaafushi Clinic', 'Thilamaafushi Clinic, Thilamaafushi', '7772991', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Thilamaafushi%20Clinic%2C%20Thilamaafushi%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Thulhagiri Clinic', 'Thulhagiri Clinic, Thulhagiri', '9999991', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Thulhagiri%20Clinic%2C%20Thulhagiri%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Thundufushi Medical Clinic', 'Thundufushi Medical Clinic, Thundufushi', '7776440', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Thundufushi%20Medical%20Clinic%2C%20Thundufushi%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Tiny Drops Medical Services', 'Tiny Drops Medical Services, Tiny', '7633394', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Tiny%20Drops%20Medical%20Services%2C%20Tiny%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('TotalPhysio', 'TotalPhysio', '7779598', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=TotalPhysio%2C%20%2C%20Maldives', 'Therapeutic Service Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Tree Top Hospital', 'Tree Top Hospital, Tree', '3310681', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Tree%20Top%20Hospital%2C%20Tree%2C%20Maldives', 'Tertiary Hospital', 'Island', true, true, true, true, '24 hours', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('True Care medicals', 'True Care medicals, True', '3302882', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=True%20Care%20medicals%2C%20True%2C%20Maldives', 'Area Specific Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('TTH Clinic', 'TTH Clinic, TTH', '479708616', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=TTH%20Clinic%2C%20TTH%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Ungoofaaru Regional Hospital', 'Ungoofaaru Regional Hospital, Ungoofaaru', '3328887', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Ungoofaaru%20Regional%20Hospital%2C%20Ungoofaaru%2C%20Maldives', 'Hospital Grade 3', 'Island', true, true, true, true, '24 hours', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Unique Dental', 'Unique Dental, Unique', '7785400', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Unique%20Dental%2C%20Unique%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Uro Medical CareClosed', 'Uro Medical CareClosed, Uro', '7774636', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Uro%20Medical%20CareClosed%2C%20Uro%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('V. Atoll Hospital', 'V. Atoll Hospital, Vaavu Atoll', '3328887', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=V.%20Atoll%20Hospital%2C%20Vaavu%20Atoll%2C%20Maldives', 'Hospital Grade 1', 'Resort', true, true, true, true, '24 hours', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('V. Fulidhoo Health Centre', 'V. Fulidhoo Health Centre, Vaavu Atoll', '3328887', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=V.%20Fulidhoo%20Health%20Centre%2C%20Vaavu%20Atoll%2C%20Maldives', 'Health Centre Grade 1', 'Resort', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('V. Keyodhoo Health Centre', 'V. Keyodhoo Health Centre, Vaavu Atoll', '3328887', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=V.%20Keyodhoo%20Health%20Centre%2C%20Vaavu%20Atoll%2C%20Maldives', 'Health Centre Grade 2', 'Resort', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('V. Rakeedhoo Health Centre', 'V. Rakeedhoo Health Centre, Vaavu Atoll', '3328887', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=V.%20Rakeedhoo%20Health%20Centre%2C%20Vaavu%20Atoll%2C%20Maldives', 'Health Centre Grade 1', 'Resort', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('V. Thinadhoo Health Centre', 'V. Thinadhoo Health Centre, Vaavu Atoll', '3328887', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=V.%20Thinadhoo%20Health%20Centre%2C%20Vaavu%20Atoll%2C%20Maldives', 'Health Centre Grade 1', 'Resort', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Vabbinfaru Clinic', 'Vabbinfaru Clinic, Vabbinfaru', NULL, NULL, 'https://www.google.com/maps/search/?api=1&query=Vabbinfaru%20Clinic%2C%20Vabbinfaru%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Vadoo Clinic', 'Vadoo Clinic, Vadoo', '3323323', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Vadoo%20Clinic%2C%20Vadoo%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Valley Dental', 'Valley Dental, Valley', '7761234', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Valley%20Dental%2C%20Valley%2C%20Maldives', 'Area Specific Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Varu Medical Centre', 'Varu Medical Centre, Varu', '3330906 / 3330907 / 7970385', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Varu%20Medical%20Centre%2C%20Varu%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('VCare Counselling and Psychotherapy Centre', 'VCare Counselling and Psychotherapy Centre, VCare', '3303200', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=VCare%20Counselling%20and%20Psychotherapy%20Centre%2C%20VCare%2C%20Maldives', 'Therapeutic Service Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Velaa Private Island Clinic', 'Velaa Private Island Clinic, Velaa', '6565000 /7303727', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Velaa%20Private%20Island%20Clinic%2C%20Velaa%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Velassaru Medical Center', 'Velassaru Medical Center, Velassaru', '3323080', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Velassaru%20Medical%20Center%2C%20Velassaru%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Veligandu Clinic', 'Veligandu Clinic, Veligandu', '6660519', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Veligandu%20Clinic%2C%20Veligandu%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Verso Medical Centre AlifushiClosed', 'Verso Medical Centre AlifushiClosed, Verso', '9536610', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Verso%20Medical%20Centre%20AlifushiClosed%2C%20Verso%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Villa Biomedicals Laboratory', 'Villa Biomedicals Laboratory, Villa', '3333300 / 7776672', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Villa%20Biomedicals%20Laboratory%2C%20Villa%2C%20Maldives', 'Diagnostic Service Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Villimale Hospital', 'Villimale Hospital, Villimale', '3335335', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Villimale%20Hospital%2C%20Villimale%2C%20Maldives', 'Hospital Grade 1', 'Male', true, true, true, true, '24 hours', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Vision Care Optical and Eye Clinic', 'Vision Care Optical and Eye Clinic, Vision', '7986432', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Vision%20Care%20Optical%20and%20Eye%20Clinic%2C%20Vision%2C%20Maldives', 'Area Specific Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Vision Clinic', 'Vision Clinic, Vision', NULL, '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Vision%20Clinic%2C%20Vision%2C%20Maldives', 'Area Specific Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Vision Clinic - Hulhumale''', 'Vision Clinic - Hulhumale'', Vision', NULL, '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Vision%20Clinic%20-%20Hulhumale%27%2C%20Vision%2C%20Maldives', 'Area Specific Clinic', 'Hulhumale', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Vision Clinic-01', 'Vision Clinic-01, Vision', NULL, '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Vision%20Clinic-01%2C%20Vision%2C%20Maldives', 'Area Specific Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Vital Care', 'Vital Care, Vital', '7601315 / 9191315', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Vital%20Care%2C%20Vital%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Vital Care Kulhudhuffushi Anex', 'Vital Care Kulhudhuffushi Anex, Vital', '7601315 / 9191315', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Vital%20Care%20Kulhudhuffushi%20Anex%2C%20Vital%2C%20Maldives', 'Area Specific Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('VitalCare Dental', 'VitalCare Dental, VitalCare', '9694873', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=VitalCare%20Dental%2C%20VitalCare%2C%20Maldives', 'Area Specific Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Vitalcare Huvadhoo, Gdh. Thinadhoo', 'Vitalcare Huvadhoo, Gdh. Thinadhoo, Vitalcare', '7506157', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Vitalcare%20Huvadhoo%2C%20Gdh.%20Thinadhoo%2C%20Vitalcare%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Vivadent Dental Centre', 'Vivadent Dental Centre, Vivadent', NULL, '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Vivadent%20Dental%20Centre%2C%20Vivadent%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Vommuli Clinic', 'Vommuli Clinic, Vommuli', '7772351', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Vommuli%20Clinic%2C%20Vommuli%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('WELL CARE MEDICALS', 'WELL CARE MEDICALS, WELL', '+960 746-9981', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=WELL%20CARE%20MEDICALS%2C%20WELL%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Wellcare Physiotherapy & Sports Rehabilitation', 'Wellcare Physiotherapy & Sports Rehabilitation, Wellcare', '7973575', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Wellcare%20Physiotherapy%20%26%20Sports%20Rehabilitation%2C%20Wellcare%2C%20Maldives', 'Therapeutic Service Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('WTE Medical Clinic', 'WTE Medical Clinic, WTE', '9311779', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=WTE%20Medical%20Clinic%2C%20WTE%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Yoonaanee Faruvaa Clinic', 'Yoonaanee Faruvaa Clinic, Yoonaanee', '9222020 / 7727713', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Yoonaanee%20Faruvaa%20Clinic%2C%20Yoonaanee%2C%20Maldives', 'Traditional Medicine Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('You & Me Clinic', 'You & Me Clinic, You', '3016888 / 7915450', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=You%20%26%20Me%20Clinic%2C%20You%2C%20Maldives', 'General Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.hospitals (name, address, contact_phone, email, google_maps_url, category, location_type, has_emergency, has_pharmacy, has_laboratory, has_radiology, opening_hours, is_active)
VALUES ('Zulnoor Hijama Care', 'Zulnoor Hijama Care, Zulnoor', '77 444 98', '[email protected]', 'https://www.google.com/maps/search/?api=1&query=Zulnoor%20Hijama%20Care%2C%20Zulnoor%2C%20Maldives', 'Traditional Medicine Clinic', 'Island', false, true, false, false, '8:00 AM - 10:00 PM', true)
ON CONFLICT (name) DO NOTHING;

COMMIT;
