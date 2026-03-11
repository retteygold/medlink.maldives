/**
 * Generate SQL UPDATE statements from JSON data for hospitals missing Dhivehi names
 * Run with: node scripts/generate-hospitals-dhivehi-batch2.js
 */

import { writeFileSync } from 'fs'
import { fileURLToPath } from 'url'
import { dirname, join } from 'path'

const __filename = fileURLToPath(import.meta.url)
const __dirname = dirname(__filename)

// JSON data provided by user
const hospitals = [
  {
    "id": "4f002dbd-1c4e-4b1d-a292-135c18ba3c1a",
    "name": "A,Dh. Dhangethi Health center",
    "address": "A,Dh. Dhangethi Health center, A,Dh",
    "category": "Health Centre Grade 3",
    "location_type": "Island",
    "name_dv": "",
    "address_dv": ""
  },
  {
    "id": "472f21ae-efe3-4d64-88f5-87877a535744",
    "name": "Ambience Medical ServicesClosed",
    "address": "Ambience Medical ServicesClosed, Ambience",
    "category": "General Clinic",
    "location_type": "Island",
    "name_dv": "",
    "address_dv": ""
  },
  {
    "id": "a6ac3457-aeb8-4cb6-a13e-609a4665b8d8",
    "name": "Amina Dhiyo Health Centre",
    "address": "Amina Dhiyo Health Centre, Amina",
    "category": "Health Centre Grade 1",
    "location_type": "Island",
    "name_dv": "",
    "address_dv": ""
  },
  {
    "id": "4c938535-1362-456d-aed9-20b8a242736b",
    "name": "Ana's Aesthetic Clinic",
    "address": "Ana's Aesthetic Clinic",
    "category": "General Clinic",
    "location_type": "Island",
    "name_dv": "",
    "address_dv": ""
  },
  {
    "id": "32adba98-59e6-41b9-9bab-2036a7bead65",
    "name": "Atoll ClinicClosed",
    "address": "Atoll ClinicClosed, Atoll",
    "category": "General Clinic",
    "location_type": "Resort",
    "name_dv": "",
    "address_dv": ""
  },
  {
    "id": "be8fa145-1b2c-4234-bb31-bbb269ece066",
    "name": "Atolls Guest Clinic",
    "address": "Atolls Guest Clinic, Atolls",
    "category": "General Clinic",
    "location_type": "Resort",
    "name_dv": "",
    "address_dv": ""
  },
  {
    "id": "847aacdf-6d38-4c53-a2bd-e906b487684e",
    "name": "Bluspan Care",
    "address": "Bluspan Care, Bluspan",
    "category": "Therapeutic Service Clinic",
    "location_type": "Island",
    "name_dv": "",
    "address_dv": ""
  },
  {
    "id": "86f662bf-4d4c-4676-ba17-afcbeef44de8",
    "name": "Bluspan Care Annex - 1",
    "address": "Bluspan Care Annex - 1, Bluspan",
    "category": "Therapeutic Service Clinic",
    "location_type": "Island",
    "name_dv": "",
    "address_dv": ""
  },
  {
    "id": "05ff7287-a685-4bbc-b283-fa2072970779",
    "name": "Bluspan Care Dhidhdhoo",
    "address": "Bluspan Care Dhidhdhoo, Bluspan",
    "category": "Therapeutic Service Clinic",
    "location_type": "Island",
    "name_dv": "",
    "address_dv": ""
  },
  {
    "id": "a2674cd2-0a79-4ba3-9dc0-fe3233f0629f",
    "name": "Blyss Multi-Specialty Therapy Centre",
    "address": "Blyss Multi-Specialty Therapy Centre, Blyss",
    "category": "General Clinic",
    "location_type": "Island",
    "name_dv": "",
    "address_dv": ""
  },
  {
    "id": "fb23c3f5-0e70-4afe-9cdb-3e7be6d9008e",
    "name": "CAREMORE MEDICALS",
    "address": "CAREMORE MEDICALS, CAREMORE",
    "category": "General Clinic",
    "location_type": "Island",
    "name_dv": "",
    "address_dv": ""
  },
  {
    "id": "f3757021-904b-458a-bae4-0fb88388ab77",
    "name": "Centara Clinic",
    "address": "Centara Clinic, Centara",
    "category": "General Clinic",
    "location_type": "Island",
    "name_dv": "",
    "address_dv": ""
  },
  {
    "id": "d1efbe19-b02a-4f5d-b8f8-a7bbad9e6a1f",
    "name": "Center for Traditional Medicine",
    "address": "Center for Traditional Medicine, Center",
    "category": "General Clinic",
    "location_type": "Island",
    "name_dv": "",
    "address_dv": ""
  },
  {
    "id": "67902305-3a49-46e0-9beb-8909b0c43b34",
    "name": "CHARM DENTAL & SKIN CLINIC",
    "address": "CHARM DENTAL & SKIN CLINIC, CHARM",
    "category": "Area Specific Clinic",
    "location_type": "Island",
    "name_dv": "",
    "address_dv": ""
  },
  {
    "id": "bb9f7e91-8049-4195-b522-b6652b79bcee",
    "name": "City Optical",
    "address": "City Optical, City",
    "category": "Area Specific Clinic",
    "location_type": "Island",
    "name_dv": "",
    "address_dv": ""
  },
  {
    "id": "e6c2855d-c386-4d00-b404-4dd1dedfe96d",
    "name": "Clinica HiyaClosed",
    "address": "Clinica HiyaClosed, Clinica",
    "category": "General Clinic",
    "location_type": "Island",
    "name_dv": "",
    "address_dv": ""
  },
  {
    "id": "5e20da7a-9a7f-46e0-bec3-75939b81b529",
    "name": "Cocoa Island Clinic",
    "address": "Cocoa Island Clinic, Cocoa",
    "category": "General Clinic",
    "location_type": "Island",
    "name_dv": "",
    "address_dv": ""
  },
  {
    "id": "452744bf-8a4d-432f-a717-c41e2746fae6",
    "name": "CORAL BAY CLINIC",
    "address": "CORAL BAY CLINIC, CORAL",
    "category": "General Clinic",
    "location_type": "Island",
    "name_dv": "",
    "address_dv": ""
  },
  {
    "id": "6ff52caa-6210-4c81-b45c-986e12e66e8e",
    "name": "DH. Bandidhoo Health Centre",
    "address": "DH. Bandidhoo Health Centre, DH.",
    "category": "Health Centre Grade 2",
    "location_type": "Island",
    "name_dv": "",
    "address_dv": ""
  },
  {
    "id": "71942c90-31e1-4f79-80ef-21399ed60673",
    "name": "DH. Hulhudhelee Health Centre",
    "address": "DH. Hulhudhelee Health Centre, DH.",
    "category": "Health Centre Grade 1",
    "location_type": "Island",
    "name_dv": "",
    "address_dv": ""
  },
  {
    "id": "6a61dced-f307-42f9-8484-f72e60fd7ef0",
    "name": "DH. Maaenboodhoo Health Centre",
    "address": "DH. Maaenboodhoo Health Centre, DH.",
    "category": "Health Centre Grade 1",
    "location_type": "Island",
    "name_dv": "",
    "address_dv": ""
  },
  {
    "id": "d3a10415-c3b2-405b-9825-159056c719dc",
    "name": "Dh. Meedhoo Health Center",
    "address": "Dh. Meedhoo Health Center, Dhaalu Atoll",
    "category": "Health Centre Grade 3",
    "location_type": "Resort",
    "name_dv": "",
    "address_dv": ""
  },
  {
    "id": "5b96a741-4c4a-41ab-bfda-3f35a7330c80",
    "name": "Dhirithi Faruvaa",
    "address": "Dhirithi Faruvaa, Dhirithi",
    "category": "Complementary Medicine Clinic",
    "location_type": "Island",
    "name_dv": "",
    "address_dv": ""
  },
  {
    "id": "5d562f95-157d-484d-af5e-cd8147921979",
    "name": "Dhugethi Dhivehibeys clinic",
    "address": "Dhugethi Dhivehibeys clinic, Dhugethi",
    "category": "Traditional Medicine Clinic",
    "location_type": "Island",
    "name_dv": "",
    "address_dv": ""
  },
  {
    "id": "77213253-cf01-43a4-ad50-059262a36937",
    "name": "Dhun-nika dhivehibeys clinic",
    "address": "Dhun-nika dhivehibeys clinic",
    "category": "Therapeutic Service Clinic",
    "location_type": "Island",
    "name_dv": "",
    "address_dv": ""
  },
  {
    "id": "1aeae32e-de1d-47ab-b8fe-3ad19453b5c7",
    "name": "Dr. Jihad's Dental and Medical Centre",
    "address": "Dr. Jihad's Dental and Medical Centre, Dr.",
    "category": "Area Specific Clinic",
    "location_type": "Island",
    "name_dv": "",
    "address_dv": ""
  },
  {
    "id": "5c88f6b0-103b-4cc5-b3e5-aee48a659a8d",
    "name": "Dreamland Clinic",
    "address": "Dreamland Clinic, Dreamland",
    "category": "General Clinic",
    "location_type": "Island",
    "name_dv": "",
    "address_dv": ""
  },
  {
    "id": "618be9b2-7df6-480a-bba5-41e6932c7fea",
    "name": "Elite Medical Center",
    "address": "Elite Medical Center, Elite",
    "category": "General Clinic",
    "location_type": "Island",
    "name_dv": "",
    "address_dv": ""
  },
  {
    "id": "5fa066ba-75b1-42ce-b6bd-165d27345785",
    "name": "Embudu Village Clinic",
    "address": "Embudu Village Clinic, Embudu",
    "category": "General Clinic",
    "location_type": "Island",
    "name_dv": "",
    "address_dv": ""
  },
  {
    "id": "718d2b9c-7008-4ec3-ad43-67d5060c62fb",
    "name": "Eri Maldives Clinic",
    "address": "Eri Maldives Clinic, Eri",
    "category": "General Clinic",
    "location_type": "Island",
    "name_dv": "",
    "address_dv": ""
  },
  {
    "id": "57ce82a5-b295-4c37-b901-0efceae1dd7f",
    "name": "Eriyadu ClinicClosed",
    "address": "Eriyadu ClinicClosed, Eriyadu",
    "category": "General Clinic",
    "location_type": "Island",
    "name_dv": "",
    "address_dv": ""
  },
  {
    "id": "1c597674-b995-4f50-bfa6-33d7302fd952",
    "name": "Esma Dhivehi Beys ClinicClosed",
    "address": "Esma Dhivehi Beys ClinicClosed, Esma",
    "category": "Traditional Medicine Clinic",
    "location_type": "Island",
    "name_dv": "",
    "address_dv": ""
  },
  {
    "id": "8f2d207b-fcdc-46b0-9287-60ab56ea0f4e",
    "name": "European Clinic MaldivesClosed",
    "address": "European Clinic MaldivesClosed, European",
    "category": "General Clinic",
    "location_type": "Island",
    "name_dv": "",
    "address_dv": ""
  },
  {
    "id": "887e63f6-1683-4ef1-a143-10af30aa7c7b",
    "name": "Eve Clinic Vinares",
    "address": "Eve Clinic Vinares, Eve",
    "category": "General Clinic",
    "location_type": "Island",
    "name_dv": "",
    "address_dv": ""
  },
  {
    "id": "93a64186-b2ff-42e7-a35f-4b28edca8c2e",
    "name": "Eye Care Clinic",
    "address": "Eye Care Clinic, Eye",
    "category": "Area Specific Clinic",
    "location_type": "Island",
    "name_dv": "",
    "address_dv": ""
  },
  {
    "id": "d327c695-2918-4c24-acd1-bda48a00d3c1",
    "name": "Eye Care Clinic Hulhumale' Branch",
    "address": "Eye Care Clinic Hulhumale' Branch, Eye",
    "category": "Area Specific Clinic",
    "location_type": "Hulhumale",
    "name_dv": "",
    "address_dv": ""
  },
  {
    "id": "175e9237-5c99-4c85-a3ee-9ddf9411e3b9",
    "name": "Eye Care Clinic, Fareedhee Magu BranchClosed",
    "address": "Eye Care Clinic, Fareedhee Magu BranchClosed, Eye",
    "category": "Area Specific Clinic",
    "location_type": "Island",
    "name_dv": "",
    "address_dv": ""
  },
  {
    "id": "148fa813-cb76-4f77-a8e0-f89ead86bf04",
    "name": "Eye Care Opticals",
    "address": "Eye Care Opticals, Eye",
    "category": "Area Specific Clinic",
    "location_type": "Island",
    "name_dv": "",
    "address_dv": ""
  },
  {
    "id": "5630ce00-e62e-4d61-be78-b2d00736e7db",
    "name": "F & C Medicare",
    "address": "F & C Medicare, F",
    "category": "General Clinic",
    "location_type": "Island",
    "name_dv": "",
    "address_dv": ""
  },
  {
    "id": "fde5f89a-0ae2-4443-8c94-c31cfda3be56",
    "name": "F & C Medicare, Meedhoo",
    "address": "F & C Medicare, Meedhoo, F",
    "category": "General Clinic",
    "location_type": "Island",
    "name_dv": "",
    "address_dv": ""
  },
  {
    "id": "68715852-0951-4905-bad4-9b652f32b13d",
    "name": "F. Biledhoo Health Centre",
    "address": "F. Biledhoo Health Centre, Faafu Atoll",
    "category": "Health Centre Grade 2",
    "location_type": "Resort",
    "name_dv": "",
    "address_dv": ""
  },
  {
    "id": "4bac4899-0742-4b3f-a5d0-8accb0a64a79",
    "name": "F. Dharanboodhoo Health Centre",
    "address": "F. Dharanboodhoo Health Centre, Faafu Atoll",
    "category": "Health Centre Grade 1",
    "location_type": "Resort",
    "name_dv": "",
    "address_dv": ""
  },
  {
    "id": "5f371de8-b6ec-43b3-a4b6-e8a7801311b2",
    "name": "F.Magoodhoo Health Centre",
    "address": "F.Magoodhoo Health Centre, F.Magoodhoo",
    "category": "Health Centre Grade 2",
    "location_type": "Island",
    "name_dv": "",
    "address_dv": ""
  },
  {
    "id": "5dcc7745-d094-4596-bcac-1a5973bf55c8",
    "name": "Family Care Clinic and Scan Center",
    "address": "Family Care Clinic and Scan Center, Family",
    "category": "General Clinic",
    "location_type": "Island",
    "name_dv": "",
    "address_dv": ""
  },
  {
    "id": "32239c6e-7d37-4986-b976-d49f9e585f23",
    "name": "Family Planning Centre",
    "address": "Family Planning Centre, Family",
    "category": "General Clinic",
    "location_type": "Island",
    "name_dv": "",
    "address_dv": ""
  },
  {
    "id": "d506aab8-2985-4fb0-99dd-9180c647519d",
    "name": "Farook HealthCare",
    "address": "Farook HealthCare, Farook",
    "category": "General Clinic",
    "location_type": "Island",
    "name_dv": "",
    "address_dv": ""
  },
  {
    "id": "a396323d-3a02-482b-80c3-2d38d8e62e18",
    "name": "Faxys Hijama Clinic",
    "address": "Faxys Hijama Clinic, Faxys",
    "category": "Complementary Medicine Clinic",
    "location_type": "Island",
    "name_dv": "",
    "address_dv": ""
  },
  {
    "id": "5f349228-4182-4ae3-94f9-d3a02ff2bfef",
    "name": "Four Seasons Resort Maldives at Kuda Huraa Clinic",
    "address": "Four Seasons Resort Maldives at Kuda Huraa Clinic, Four",
    "category": "General Clinic",
    "location_type": "Resort",
    "name_dv": "",
    "address_dv": ""
  },
  {
    "id": "7a09eb93-6866-4435-8ce7-b2647c9c3f90",
    "name": "Fuvahmulah Medical Centre",
    "address": "Fuvahmulah Medical Centre, Fuvahmulah",
    "category": "General Clinic",
    "location_type": "Island",
    "name_dv": "",
    "address_dv": ""
  },
  {
    "id": "d1ebc4e6-eca1-42b0-a881-8a7165858c06",
    "name": "GA. Dhevvadhoo Health Centre",
    "address": "GA. Dhevvadhoo Health Centre, GA.",
    "category": "Health Centre Grade 3",
    "location_type": "Island",
    "name_dv": "",
    "address_dv": ""
  },
  {
    "id": "f417c735-acd7-46eb-b00e-eaa87c71155c",
    "name": "GA. Kan'dhuhulhudhoo Health Centre",
    "address": "GA. Kan'dhuhulhudhoo Health Centre, GA.",
    "category": "Health Centre Grade 1",
    "location_type": "Island",
    "name_dv": "",
    "address_dv": ""
  },
  {
    "id": "b5b3dc16-f338-4331-9f1b-333a76d2a9f6",
    "name": "GA. Kolamafushi Health Centre",
    "address": "GA. Kolamafushi Health Centre, GA.",
    "category": "Health Centre Grade 3",
    "location_type": "Island",
    "name_dv": "",
    "address_dv": ""
  },
  {
    "id": "cf797d94-b77a-450d-a752-6881e95d0c60",
    "name": "GA. Kondey Health Centre",
    "address": "GA. Kondey Health Centre, GA.",
    "category": "Health Centre Grade 1",
    "location_type": "Island",
    "name_dv": "",
    "address_dv": ""
  },
  {
    "id": "fdc63b76-fe9f-4205-a15f-ba3808cf7040",
    "name": "GA. Maamendhoo Health Centre",
    "address": "GA. Maamendhoo Health Centre, GA.",
    "category": "Health Centre Grade 2",
    "location_type": "Island",
    "name_dv": "",
    "address_dv": ""
  },
  {
    "id": "732ee5b6-f285-4042-b687-2c9f6de45694",
    "name": "GA. Nilandhoo Health Centre",
    "address": "GA. Nilandhoo Health Centre, GA.",
    "category": "Health Centre Grade 1",
    "location_type": "Island",
    "name_dv": "",
    "address_dv": ""
  },
  {
    "id": "1ecdf95e-699f-4bd4-ab77-8127a5050b11",
    "name": "Gagan Clinic",
    "address": "Gagan Clinic, Gagan",
    "category": "General Clinic",
    "location_type": "Island",
    "name_dv": "",
    "address_dv": ""
  },
  {
    "id": "65dcfa91-b673-42e2-a96c-e8b2cd802b6a",
    "name": "Gangehi Clinic",
    "address": "Gangehi Clinic, Gangehi",
    "category": "General Clinic",
    "location_type": "Island",
    "name_dv": "",
    "address_dv": ""
  },
  {
    "id": "614132d3-bee4-48e3-9505-efe6721cbec4",
    "name": "GDh. Fares-mathoda Health Centre",
    "address": "GDh. Fares-mathoda Health Centre, Gaafu Dhaalu Atoll",
    "category": "Health Centre Grade 3",
    "location_type": "Resort",
    "name_dv": "",
    "address_dv": ""
  },
  {
    "id": "59c4451f-d55e-41db-a9b7-74287cd680eb",
    "name": "GDh. Fiyoaree Health Centre",
    "address": "GDh. Fiyoaree Health Centre, Gaafu Dhaalu Atoll",
    "category": "Health Centre Grade 2",
    "location_type": "Resort",
    "name_dv": "",
    "address_dv": ""
  },
  {
    "id": "31f36188-93e3-4ab6-892f-2754441a0f60",
    "name": "GDh. Gahdhoo Health Centre",
    "address": "GDh. Gahdhoo Health Centre, Gaafu Dhaalu Atoll",
    "category": "Health Centre Grade 4",
    "location_type": "Resort",
    "name_dv": "",
    "address_dv": ""
  },
  {
    "id": "6142c97e-28a8-4c11-a166-1b08f9ef177d",
    "name": "GDh. Hoadedhoo Health Centre",
    "address": "GDh. Hoadedhoo Health Centre, Gaafu Dhaalu Atoll",
    "category": "Health Centre Grade 2",
    "location_type": "Resort",
    "name_dv": "",
    "address_dv": ""
  },
  {
    "id": "fa416e1e-6804-4860-b652-a1037c084bb5",
    "name": "GDh. Madaveli Health Centre",
    "address": "GDh. Madaveli Health Centre, Gaafu Dhaalu Atoll",
    "category": "Health Centre Grade 2",
    "location_type": "Resort",
    "name_dv": "",
    "address_dv": ""
  },
  {
    "id": "16abaf57-676f-47a5-91fa-b655e74722b8",
    "name": "GDh. Nadella Health Centre",
    "address": "GDh. Nadella Health Centre, Gaafu Dhaalu Atoll",
    "category": "Health Centre Grade 2",
    "location_type": "Resort",
    "name_dv": "",
    "address_dv": ""
  },
  {
    "id": "1b964fe6-75cb-46f8-8982-1a005503d340",
    "name": "Gdh. Rathafandhoo Health Center",
    "address": "Gdh. Rathafandhoo Health Center, Gdh.",
    "category": "Health Centre Grade 2",
    "location_type": "Island",
    "name_dv": "",
    "address_dv": ""
  },
  {
    "id": "971342c7-ed11-40bc-a500-9d1571baf8df",
    "name": "GDh. Vaadhoo Health Centre",
    "address": "GDh. Vaadhoo Health Centre, Gaafu Dhaalu Atoll",
    "category": "Health Centre Grade 3",
    "location_type": "Resort",
    "name_dv": "",
    "address_dv": ""
  },
  {
    "id": "a8b6f8f4-ddb6-4d55-af3b-466e5afd8c0d",
    "name": "Gili Gets Well",
    "address": "Gili Gets Well, Gili",
    "category": "General Clinic",
    "location_type": "Island",
    "name_dv": "",
    "address_dv": ""
  },
  {
    "id": "5c85e772-820e-42c3-b4b9-8411455bfefb",
    "name": "Gnaviyani Atoll Hospital",
    "address": "Gnaviyani Atoll Hospital, Gnaviyani",
    "category": "Hospital Grade 2",
    "location_type": "Resort",
    "name_dv": "",
    "address_dv": ""
  },
  {
    "id": "2689ca64-b67e-42e9-a833-6a9806340a72",
    "name": "Grand Clinic",
    "address": "Grand Clinic, Grand",
    "category": "General Clinic",
    "location_type": "Island",
    "name_dv": "",
    "address_dv": ""
  },
  {
    "id": "c30d9dea-eda0-4a9a-b0dc-be3d594aa2b3",
    "name": "Guest And Staff Clinic",
    "address": "Guest And Staff Clinic, Guest",
    "category": "General Clinic",
    "location_type": "Island",
    "name_dv": "",
    "address_dv": ""
  },
  {
    "id": "3e333d93-121f-476e-9486-2e57e32e0934",
    "name": "Gynova",
    "address": "Gynova",
    "category": "General Clinic",
    "location_type": "Island",
    "name_dv": "",
    "address_dv": ""
  },
  {
    "id": "46f2aba7-cf12-473a-bb9a-bce9dd69cbaa",
    "name": "H Dh. Finey Health Center",
    "address": "H Dh. Finey Health Center, H",
    "category": "Health Centre Grade 1",
    "location_type": "Island",
    "name_dv": "",
    "address_dv": ""
  },
  {
    "id": "bd60174a-de71-4dff-8288-14a7804723e9",
    "name": "H.a Thakandhoo Health Centre",
    "address": "H.a Thakandhoo Health Centre, H.a",
    "category": "Health Centre Grade 2",
    "location_type": "Island",
    "name_dv": "",
    "address_dv": ""
  },
  {
    "id": "01dca602-787d-4444-ac1e-e4eb3d31a6e8",
    "name": "Ha. Atoll Hospital",
    "address": "Ha. Atoll Hospital, Ha.",
    "category": "Hospital Grade 2",
    "location_type": "Resort",
    "name_dv": "",
    "address_dv": ""
  },
  {
    "id": "a2f96b9f-bdc9-45ca-a900-2f1d96aa83bc",
    "name": "HA. Baarah Health Centre",
    "address": "HA. Baarah Health Centre, HA.",
    "category": "Health Centre Grade 3",
    "location_type": "Island",
    "name_dv": "",
    "address_dv": ""
  },
  {
    "id": "aa7dda7c-a29d-4da5-a996-24aad39d5dcd",
    "name": "Ha. Filladhoo Health Centre",
    "address": "Ha. Filladhoo Health Centre, Ha.",
    "category": "Health Centre Grade 1",
    "location_type": "Island",
    "name_dv": "",
    "address_dv": ""
  },
  {
    "id": "78779a98-28af-4fb4-acda-d20cdbf6cf7c",
    "name": "Ha. Hoarafushi Health Centre",
    "address": "Ha. Hoarafushi Health Centre, Ha.",
    "category": "Health Centre Grade 4",
    "location_type": "Island",
    "name_dv": "",
    "address_dv": ""
  },
  {
    "id": "c96ec63e-f4ae-4cc1-9cc9-68254e5c815d",
    "name": "Ha. Kela Health Centre",
    "address": "Ha. Kela Health Centre, Ha.",
    "category": "Health Centre Grade 3",
    "location_type": "Island",
    "name_dv": "",
    "address_dv": ""
  },
  {
    "id": "b661e0f6-9137-44a5-bb54-827cac5dee84",
    "name": "Ha. Maarandhoo Health Centre",
    "address": "Ha. Maarandhoo Health Centre, Ha.",
    "category": "Health Centre Grade 1",
    "location_type": "Island",
    "name_dv": "",
    "address_dv": ""
  },
  {
    "id": "3ea65603-7561-4dfb-88ae-41fed9673c87",
    "name": "Ha. Molhadhoo Health Centre",
    "address": "Ha. Molhadhoo Health Centre, Ha.",
    "category": "Health Centre Grade 1",
    "location_type": "Island",
    "name_dv": "",
    "address_dv": ""
  },
  {
    "id": "ac8a83af-d99e-4f6e-a88b-9a7cddd01ced",
    "name": "Ha. Muraidhoo Health Centre",
    "address": "Ha. Muraidhoo Health Centre, Ha.",
    "category": "Health Centre Grade 1",
    "location_type": "Island",
    "name_dv": "",
    "address_dv": ""
  },
  {
    "id": "0d5ebc8d-5352-4a2b-862f-338600c3a512",
    "name": "Ha. Thuraakurun Health Centre",
    "address": "Ha. Thuraakurun Health Centre, Ha.",
    "category": "Health Centre Grade 1",
    "location_type": "Island",
    "name_dv": "",
    "address_dv": ""
  },
  {
    "id": "2b6e48b9-bed3-49d1-8925-5251f70c9e14",
    "name": "Ha. Uligamu Health Centre",
    "address": "Ha. Uligamu Health Centre, Ha.",
    "category": "Health Centre Grade 1",
    "location_type": "Island",
    "name_dv": "",
    "address_dv": ""
  },
  {
    "id": "79007ef0-30cc-426a-b0af-eaca548313f6",
    "name": "Ha. Utheem Health Centre",
    "address": "Ha. Utheem Health Centre, Ha.",
    "category": "Health Centre Grade 2",
    "location_type": "Island",
    "name_dv": "",
    "address_dv": ""
  },
  {
    "id": "2d7ebccb-df7a-4539-978e-c655a992caaf",
    "name": "Ha. Vashafaru Health Centre",
    "address": "Ha. Vashafaru Health Centre, Ha.",
    "category": "Health Centre Grade 2",
    "location_type": "Island",
    "name_dv": "",
    "address_dv": ""
  },
  {
    "id": "32637ec4-2da0-4cef-924e-7c7073293ec7",
    "name": "Hadh. Hanimaadhoo Health Centre",
    "address": "Hadh. Hanimaadhoo Health Centre, Hadh.",
    "category": "Health Centre Grade 3",
    "location_type": "Island",
    "name_dv": "",
    "address_dv": ""
  },
  {
    "id": "44782aae-f3a1-4eb2-b992-e24dd871ed17",
    "name": "HDh. Hirimaradhoo Health Centre",
    "address": "HDh. Hirimaradhoo Health Centre, Haa Dhaalu Atoll",
    "category": "Health Centre Grade 1",
    "location_type": "Resort",
    "name_dv": "",
    "address_dv": ""
  },
  {
    "id": "5b7a501d-bc8d-455d-bf3e-cb5c4a4c4772",
    "name": "HDh. Kumundhoo Health Centre",
    "address": "HDh. Kumundhoo Health Centre, Haa Dhaalu Atoll",
    "category": "Health Centre Grade 1",
    "location_type": "Resort",
    "name_dv": "",
    "address_dv": ""
  },
  {
    "id": "7c519ecc-dc33-4752-abeb-09c79e3210f7",
    "name": "HDh. kurinbi Health Centre",
    "address": "HDh. kurinbi Health Centre, Haa Dhaalu Atolloll",
    "category": "Health Centre Grade 1",
    "location_type": "Resort",
    "name_dv": "",
    "address_dv": ""
  },
  {
    "id": "f582e47c-9161-458b-9bf4-fe37a5a72045",
    "name": "HDh. Makunudhoo Health Centre",
    "address": "HDh. Makunudhoo Health Centre, Haa Dhaalu Atoll",
    "category": "Health Centre Grade 3",
    "location_type": "Resort",
    "name_dv": "",
    "address_dv": ""
  },
  {
    "id": "a1871a0c-6b56-4a86-88b8-5e5439590acd",
    "name": "HDh. Naivaadhoo Health Centre",
    "address": "HDh. Naivaadhoo Health Centre, Haa Dhaalu Atoll",
    "category": "Health Centre Grade 1",
    "location_type": "Resort",
    "name_dv": "",
    "address_dv": ""
  },
  {
    "id": "9bbc0b7a-67c8-4cec-931f-114ae75dba56",
    "name": "HDh. Nellaidhoo HealthCentre",
    "address": "HDh. Nellaidhoo HealthCentre, Haa Dhaalu Atoll",
    "category": "Health Centre Grade 2",
    "location_type": "Resort",
    "name_dv": "",
    "address_dv": ""
  },
  {
    "id": "22fc7cad-13c5-4438-8bf1-f0ae0b3ce98a",
    "name": "HDh. Neykurendhoo Health Centre",
    "address": "HDh. Neykurendhoo Health Centre, Haa Dhaalu Atoll",
    "category": "Health Centre Grade 3",
    "location_type": "Resort",
    "name_dv": "",
    "address_dv": ""
  },
  {
    "id": "0e15cf23-9b96-4c51-84ab-d959c98b2e71",
    "name": "HDh. Nolhivaran Health Centre",
    "address": "HDh. Nolhivaran Health Centre, Haa Dhaalu Atoll",
    "category": "Health Centre Grade 3",
    "location_type": "Resort",
    "name_dv": "",
    "address_dv": ""
  },
  {
    "id": "a2596541-ac8f-4b55-8d31-f6e9ba7bddec",
    "name": "HDh. Nolhivaranfaru Health Centre",
    "address": "HDh. Nolhivaranfaru Health Centre, Haa Dhaalu Atoll",
    "category": "Health Centre Grade 3",
    "location_type": "Resort",
    "name_dv": "",
    "address_dv": ""
  },
  {
    "id": "d0637a65-7428-4b36-bb48-f01835cc9189",
    "name": "HDh. Vaikaradhoo HealthCentre",
    "address": "HDh. Vaikaradhoo HealthCentre, Haa Dhaalu Atoll",
    "category": "Health Centre Grade 3",
    "location_type": "Resort",
    "name_dv": "",
    "address_dv": ""
  },
  {
    "id": "8a23898c-5262-44f2-8882-fd30ecfe46e8",
    "name": "Hijama Faruva By Manara Clinic",
    "address": "Hijama Faruva By Manara Clinic, Hijama",
    "category": "Complementary Medicine Clinic",
    "location_type": "Island",
    "name_dv": "",
    "address_dv": ""
  },
  {
    "id": "09185dcb-89b3-4a20-9d20-2959c496688b",
    "name": "Hiyaa Medical Center",
    "address": "Hiyaa Medical Center, Hiyaa",
    "category": "General Clinic",
    "location_type": "Island",
    "name_dv": "",
    "address_dv": ""
  },
  {
    "id": "89288e29-2cb6-4709-9fa3-ae64d30a6ba0",
    "name": "Holistic Hijama MV",
    "address": "Holistic Hijama MV, Holistic",
    "category": "Complementary Medicine Clinic",
    "location_type": "Island",
    "name_dv": "",
    "address_dv": ""
  },
  {
    "id": "23160cad-e5f8-402d-a6cb-cc13cdb2886d",
    "name": "HPSN Medical Clinic",
    "address": "HPSN Medical Clinic, HPSN",
    "category": "General Clinic",
    "location_type": "Island",
    "name_dv": "",
    "address_dv": ""
  },
  {
    "id": "12e0040c-3852-4b0f-9efb-cc0c93810ac3",
    "name": "Hulhumale Hospital",
    "address": "Hulhumale Hospital, Hulhumale",
    "category": "Tertiary Hospital",
    "location_type": "Hulhumale",
    "name_dv": "",
    "address_dv": ""
  }
]

function escapeSqlString(str) {
  if (!str) return ''
  return str.replace(/'/g, "''").replace(/\\/g, '\\\\')
}

// Generate CSV template for user to fill
let csvContent = 'id,name,address,category,location_type,name_dv,address_dv\n'
hospitals.forEach(h => {
  csvContent += `"${h.id}","${escapeSqlString(h.name)}","${escapeSqlString(h.address)}","${h.category}","${h.location_type}",,\n`
})

const csvPath = join(__dirname, '../hospitals_missing_dhivehi_batch2.csv')
writeFileSync(csvPath, csvContent, 'utf8')
console.log(`✅ Generated CSV template: hospitals_missing_dhivehi_batch2.csv`)
console.log(`📝 Contains ${hospitals.length} hospitals`)
console.log(`\n📋 Next steps:`)
console.log(`1. Open hospitals_missing_dhivehi_batch2.csv in Excel`)
console.log(`2. Fill in name_dv and address_dv columns`)
console.log(`3. Send me the filled file to generate SQL`)
