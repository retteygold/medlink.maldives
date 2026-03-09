# Changelog

All notable changes to MedLink Maldives will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

---

## [Unreleased]

### Planned
- Online appointment booking
- Doctor availability calendar
- Push notifications for appointments
- Patient history portal
- Insurance provider integration
- Expanded island coverage
- Video consultation integration

---

## [1.3.1] – 2026-03-10

### Added
- **Not sure which pharmacy has your medicine?** (renamed from Pharmacy Finder)
  - New routes: `/pharmacy-finder`, `/pharmacy-finder/inbox`
  - Upload prescription or medicine photo with optional medicine name/brand
  - Providers/admins can answer with pharmacy details (name, phone, location, availability)
  - Viber fallback for urgent requests: Shikavathi Chatline +7951400
  - Bilingual support (English/Dhivehi)
- **Visitor Analytics** (admin-only)
  - New table `app_visits` for logging page visits
  - Admin dashboard shows: total visits, unique visitors, logged-in vs anonymous
  - Detailed visit log table with user agent and timestamp

### Changed
- **Pharmacy Finder renamed** to "Not sure which pharmacy has your medicine?"
  - Updated all UI text, translations (EN/DV), docs, and video script
  - Simplified form: image upload + optional medicine name/brand only

---

## [1.3.0] – 2026-03-09

### Added
- **Medicine Help (authenticated-only)**
  - New routes: `/medicine-help`, `/medicine-help/new`, `/medicine-help/:id`
  - Create medicine request with prescription image and optional previous medicine photo
  - Signed URLs for private images stored in Supabase Storage (`medicine-requests` bucket)
  - **1-to-1 chat** per request between requester and helper (conversations + messages)
- **User Authentication**
  - New routes: `/login`, `/signup`
  - Signup role selection saved in user metadata: `need_service` / `provide_service`
- **Admin Medicine Help Management**
  - New route: `/admin/medicine-help` to review requests and update request status
- **Admin Access Control**
  - Admin routes require membership in `admin_users` table

### Changed
- **Home Screen**
  - Added a Medicine Help CTA card on `/` linking to `/medicine-help` (login required)
- **Hospitals**
  - Added separate hospital filters: Area (Male/Hulhumale/Island/Resort) and Atoll
  - Added optional hospital `google_maps_url` and an "Open in Maps" button with fallback search
- **Hospital Detail Page**
  - Added doctor search autocomplete within each hospital page

### Fixed
- Supabase update issues due to schema mismatches (missing columns) now fail gracefully in admin hospital updates
- Avoided PostgREST single-row coercion errors by updating selection strategy where applicable

---

## [1.2.0] – 2025-03-10

### Added
- **Supabase Integration**: Switched from local JSON to Supabase for real-time data
- **Admin Dashboard**: Full CRUD for hospitals, doctors, and reviews
- **Community Q&A**: Users can ask health questions and answer others
- **Image Uploads**: Admins can upload doctor/hospital photos
- **PWA Improvements**: Better install prompts and offline fallback
- **Dropdown Search**: Instant suggestions while typing on SearchPage
- **Error Handling**: Retry buttons and better loading states

### Changed
- **Data Layer**: `dataService.ts` now uses Supabase client instead of fetch
- **Build Config**: Disabled PWA service worker in development to avoid cache issues
- **Footer**: Redesigned with dark gradient and better layout
- **Navigation**: Added Community tab to bottom nav

### Fixed
- **Infinite Loading**: Doctors/hospitals no longer stuck on loading screen
- **Footer Visibility**: Footer now visible above bottom navigation on all non-admin pages
- **Search Dropdown**: Click-outside-to-close behavior implemented
- **Type Errors**: Fixed AdminDashboard imports and types

### Security
- Environment variables for Supabase URL and anon key
- No hardcoded credentials

---

## [1.1.0] – 2025-03-07

### Added
- **Footer**: App footer with branding and links (visible on all non-admin pages)
- **Admin Routes**: `/admin/*` routes for dashboard and management tools
- **AdminDashboard**: Overview with stats and quick actions
- **AdminHospitals**: Manage hospital listings (add/edit/delete)
- **AdminDoctors**: Manage doctor listings (add/edit/delete/move)
- **AdminReviews**: Moderate patient reviews and comments
- **Community Pages**:
  - `CommunityPage`: Browse and search community questions
  - `AskQuestionPage`: Submit new health questions
  - `QuestionDetailPage`: View question and answers, like/post answers

### Changed
- **App Routing**: Added admin and community routes
- **Footer Placement**: Conditionally render on non-admin pages
- **Data Structure**: Extended types to support reviews and Q&A

### Fixed
- **Footer Overlap**: Footer no longer hidden by bottom navigation

---

## [1.0.0] – 2025-03-01

### Added
- **Initial Release**:
  - Home screen with search and specialties
  - Doctors listing with filters and search
  - Hospitals listing with filters and search
  - Doctor and Hospital detail pages
  - Smart Matcher (symptom-based finder)
  - Dhivehi/English language toggle
  - PWA support (installable)
  - Responsive mobile-first design
  - Local JSON data loading (`medlink_database_complete.json`)
  - Storyset illustrations
  - Modern UI with Tailwind CSS and Lucide icons

### Features
- Search doctors and hospitals
- Filter by specialty, location, services
- View ratings and contact info
- Multi-language support (English/Dhivehi)
- PWA install prompt
- Clean mobile UI

### Tech Stack
- React 18 + TypeScript + Vite
- Tailwind CSS + Lucide Icons
- React Router v6
- VitePWA
- Local JSON data

---

## [0.9.0] – 2025-02-20

### Added
- Project scaffolding
- Basic routing and components
- Language context setup
- Storyset assets integration
- Initial data structure definitions

---

## Migration Notes

### From 1.1 to 1.2 (Supabase Migration)

**Before**: Local JSON in `public/data/`  
**After**: Supabase PostgreSQL

**Steps for existing deployments**:
1. Create Supabase project
2. Run schema from `README.md`
3. Import existing JSON data via Supabase CSV import or script
4. Set `VITE_SUPABASE_URL` and `VITE_SUPABASE_ANON_KEY` in environment
5. Redeploy to Vercel

**Breaking Changes**:
- `dataService.ts` now requires Supabase env vars
- Local JSON loading removed; ensure Supabase is populated

### From 1.0 to 1.1

- No breaking changes
- Footer added to layout
- New routes added; existing routes unchanged

---

## Roadmap

### v1.3.0 (Expected 2025-04)
- [ ] Online appointment booking system
- [ ] Doctor availability calendars
- [ ] Push notifications for appointments
- [ ] Patient portal with history

### v1.4.0 (Expected 2025-05)
- [ ] Video consultation integration
- [ ] Insurance provider lookup
- [ ] Expanded atoll/island coverage
- [ ] Enhanced search with AI recommendations

### v2.0.0 (Expected 2025-06)
- [ ] Full patient accounts
- [ ] Prescription management
- [ ] Lab results integration
- [ ] Multi-hospital integration APIs

---

## Support

- Report issues via GitHub Issues
- Email: support@medlink.mv
- Documentation: See `USER_MANUAL.md`

---

_“Connecting you to healthcare since 2019 – Made with ❤️ in Maldives”_
