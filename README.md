# MedLink Maldives

> Find doctors, hospitals, and specialists in the Maldives.  
> Built with React 18, TypeScript, Tailwind CSS, Supabase, and deployed on Vercel.

## 🚀 Live Demo

[https://medlink-maldives.vercel.app](https://medlink-maldives.vercel.app)

## 📱 Features

- **🔍 Search** doctors and hospitals with instant dropdown suggestions
- **🏥 Browse** by specialty or location (Male’, Hulhumale’, Islands, Resorts)
- **⭐ Ratings & Reviews** for doctors and hospitals
- **👨‍⚕️ Doctor Profiles** with qualifications, contact, and hospital info
- **🏨 Hospital Details** with services, emergency, pharmacy, lab info
- **🗣️ Dhivehi & English** language toggle
- **👥 Community Q&A** – ask health questions and get answers
- **🛠️ Admin Dashboard** – manage hospitals, doctors, and reviews
- **📱 PWA Ready** – installable as a mobile app

## 🛠️ Tech Stack

- **Frontend**: React 18 + TypeScript + Vite
- **Styling**: Tailwind CSS + Lucide Icons
- **Routing**: React Router v6
- **Backend**: Supabase (PostgreSQL + Auth + Storage)
- **Deployment**: Vercel
- **PWA**: VitePWA

## 📦 Setup & Installation

### Prerequisites

- Node.js 18+
- GitHub account
- Supabase account (free tier is fine)
- Vercel account

### 1. Clone & Install

```bash
git clone https://github.com/your-username/medlink-maldives.git
cd medlink-maldives
npm install
```

### 2. Supabase Setup

1. Create a new project at [supabase.com](https://supabase.com)
2. Run the SQL below in the Supabase SQL Editor to create tables
3. Go to Settings > API and copy:
   - `SUPABASE_URL` (Project URL)
   - `SUPABASE_ANON_KEY` (anon/public key)

#### Supabase Schema

```sql
-- Hospitals
create table hospitals (
  id uuid primary key default gen_random_uuid(),
  name text not null,
  registration_number text,
  operating_license_no text,
  address text not null,
  contact_phone text,
  email text,
  category text not null, -- 'Hospital', 'Clinic', 'Pharmacy', etc.
  location_type text not null, -- 'Male', 'Hulhumale', 'Island', 'Resort'
  has_emergency boolean default false,
  has_pharmacy boolean default false,
  has_laboratory boolean default false,
  has_radiology boolean default false,
  opening_hours text,
  is_active boolean default true,
  created_at timestamp with time zone default now(),
  rating float default 0,
  review_count int default 0
);

-- Doctors
create table doctors (
  id uuid primary key default gen_random_uuid(),
  name text not null,
  specialty text not null,
  hospital_id uuid references hospitals(id),
  hospital_name text not null,
  qualifications text[],
  contact_phone text,
  email text,
  about text,
  rating float default 0,
  review_count int default 0,
  is_active boolean default true,
  created_at timestamp with time zone default now()
);

-- Specialties
create table specialties (
  id uuid primary key default gen_random_uuid(),
  name text not null unique,
  category text default 'Medical'
);

-- Community Questions
create table questions (
  id uuid primary key default gen_random_uuid(),
  title text not null,
  content text not null,
  category text,
  author_name text,
  author_id uuid,
  created_at timestamp with time zone default now(),
  likes int default 0,
  is_active boolean default true
);

-- Community Answers
create table answers (
  id uuid primary key default gen_random_uuid(),
  question_id uuid references questions(id) on delete cascade,
  content text not null,
  author_name text,
  author_id uuid,
  created_at timestamp with time zone default now(),
  likes int default 0,
  is_active boolean default true
);

-- Reviews for doctors
create table doctor_reviews (
  id uuid primary key default gen_random_uuid(),
  doctor_id uuid references doctors(id) on delete cascade,
  rating int not null check (rating >= 1 and rating <= 5),
  comment text,
  author_name text,
  created_at timestamp with time zone default now(),
  is_active boolean default true
);

-- Optional: Insert some specialties
insert into specialties (name) values
('Cardiology'), ('Pediatrics'), ('Obstetrics & Gynecology'), ('Dermatology'),
('Orthopedics'), ('Neurology'), ('Psychiatry'), ('General Practice'),
('Emergency Medicine'), ('Anesthesiology'), ('Radiology'), ('Pathology');
```

### 3. Environment Variables

Create `.env.local` in the root:

```env
VITE_SUPABASE_URL=YOUR_SUPABASE_URL
VITE_SUPABASE_ANON_KEY=YOUR_SUPABASE_ANON_KEY
```

> **Never commit `.env.local`**. A `.env.example` is included for reference.

### 4. Run Locally

```bash
npm run dev
```

Open [http://localhost:3000](http://localhost:3000).

### 5. (Optional) Seed Supabase from existing JSON

If you have `data/medlink_database_complete.json` and want to import it:

1. Add your Supabase **Service Role Key** to `.env` (not the anon key):
   ```env
   SUPABASE_URL=YOUR_SUPABASE_URL
   SUPABASE_SERVICE_ROLE_KEY=YOUR_SUPABASE_SERVICE_ROLE_KEY
   ```

2. Run the seed script:
   ```bash
   npm run seed:supabase
   ```

   This will:
   - Insert specialties, hospitals, and doctors
   - Infer location types and services
   - Link doctors to hospitals by name

### 6. Deploy to Vercel

1. Push your code to GitHub
2. Link your GitHub repo to [Vercel](https://vercel.com)
3. In Vercel > Settings > Environment Variables, add:
   - `VITE_SUPABASE_URL`
   - `VITE_SUPABASE_ANON_KEY`
4. Deploy – Vercel will build and host the app automatically

## 📂 Project Structure

```
src/
├── components/       # Reusable UI (Footer, LanguageToggle, etc.)
├── lib/             # dataService.ts (Supabase client + data fetching)
├── pages/           # Page components (HomePage, DoctorsPage, etc.)
├── types/           # TypeScript interfaces
├── contexts/        # Language context (Dhivehi/English)
├── App.tsx          # Main router + layout
└── main.tsx         # App entry point

public/
└── images/          # Logo, illustrations, storyset assets
```

## 🧩 Data Flow

1. **Supabase** is the single source of truth (doctors, hospitals, reviews, Q&A)
2. `src/lib/dataService.ts` wraps Supabase queries and returns typed data
3. Pages call functions like `getDoctors()`, `getHospitals()`, `searchDoctors(query)`
4. UI components render lists, cards, and detail views

## 🌐 PWA

- The app is installable as a PWA (logo, theme color, offline fallback)
- Service Worker is disabled in dev to avoid cache issues
- Enabled in production builds only

## 🧪 Testing & Linting

```bash
# Build check
npm run build

# Preview production build locally
npm run preview
```

## 📄 License

MIT © 2025 MedLink Maldives

## 🤝 Contributing

1. Fork
2. Feature branch (`git checkout -b feature/amazing-feature`)
3. Commit (`git commit -m 'Add amazing feature'`)
4. Push (`git push origin feature/amazing-feature`)
5. Pull Request

## 📞 Support

- Email: support@medlink.mv
- Emergency: 102

---

_“Connecting you to healthcare since 2019 – Made with ❤️ in Maldives”_
