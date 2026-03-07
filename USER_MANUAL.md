# MedLink Maldives – User Manual

## Table of Contents

1. [Getting Started](#getting-started)
2. [Home Screen](#home-screen)
3. [Searching](#searching)
4. [Doctors](#doctors)
5. [Hospitals](#hospitals)
6. [Smart Matcher](#smart-matcher)
7. [Community Q&A](#community-qa)
8. [Language Toggle](#language-toggle)
9. [PWA Installation](#pwa-installation)
10. [Admin Dashboard](#admin-dashboard)
11. [Troubleshooting](#troubleshooting)

---

## Getting Started

MedLink Maldives is a mobile-first web app that helps you find doctors, hospitals, and specialists across the Maldives. No download is required – it works in any modern browser.

**URL**: [https://medlink-maldives.vercel.app](https://medlink-maldives.vercel.app)

### Requirements

- Modern browser (Chrome, Safari, Firefox, Edge)
- Internet connection
- Mobile phone or tablet (recommended) or desktop

---

## Home Screen

The home screen is your starting point.

- **Greeting**: Changes based on time of day (Good Morning/Afternoon/Evening)
- **Search Bar**: Type to search doctors or hospitals instantly
- **Smart Matcher Button**: Quick symptom-based doctor finder (center circular button)
- **Specialties Grid**: Tap a specialty to see relevant doctors
- **Featured Sections**: Quick links to top doctors and hospitals

### How to Use

1. Tap the search bar and type a name, specialty, or hospital
2. Tap a specialty card (e.g., “Cardiology”) to filter doctors
3. Tap the Smart Matcher button for guided symptom-based search
4. Scroll to browse featured doctors and hospitals

---

## Searching

Search is available on the Home screen and the dedicated Search page.

### Search Tips

- **Doctor names**: “Dr. Ahmed”
- **Specialties**: “cardiologist”, “pediatrician”
- **Hospitals**: “IGMH”, “ADK”
- **Locations**: “Male”, “Hulhumale”

### Dropdown Suggestions

- Results appear instantly as you type
- Tap any result to view details
- No need to press Enter

### Filters

- **Specialty**: Select from a list of medical specialties
- **Location**: Filter by Male’, Hulhumale’, Islands, Resorts
- **Services**: Emergency, Pharmacy, Laboratory, Radiology

---

## Doctors

### Viewing Doctors

1. From the home, tap “Doctors” in the bottom nav or a specialty card
2. Browse the list or use search/filters
3. Tap a doctor to see their profile

### Doctor Profile Includes

- **Photo/Avatar**
- **Name and Specialty**
- **Hospital/Clinic affiliation**
- **Qualifications**
- **Ratings** (1–5 stars)
- **Contact options** (Book Now, Call)

### Actions

- **Book Now**: Opens appointment flow (placeholder)
- **Call**: Dials the doctor’s phone number if available
- **Share**: Share the profile via WhatsApp, email, etc.

---

## Hospitals

### Viewing Hospitals

1. Tap “Search” > select “Hospitals” tab, or
2. From the home, tap a hospital in the featured section

### Hospital Details Include

- **Name and Address**
- **Contact Phone and Email**
- **Category** (Hospital, Clinic, etc.)
- **Services** (Emergency, Pharmacy, Lab, Radiology)
- **Opening Hours**
- **Location Type** (Male’, Hulhumale’, Island, Resort)
- **Ratings and Reviews**

### Actions

- **Call**: Dial the hospital’s main number
- **Directions**: Open in Google Maps (if available)
- **Share**: Share the hospital info

---

## Smart Matcher

The Smart Matcher helps you find the right doctor based on symptoms.

### How to Use

1. Tap the center circular button from any screen
2. Select your symptoms from the list
3. Choose your preferred location
4. View recommended doctors and book

### Example

- Symptoms: “Chest pain”, “Shortness of breath”
- Location: “Male’”
- Result: Cardiologists at IGMH, ADK, etc.

---

## Community Q&A

Ask health-related questions and get answers from the community.

### Asking a Question

1. From the home, tap the “Community” tab or go to /community
2. Tap “Ask Question”
3. Fill in:
   - Title (short summary)
   - Details (full description)
   - Category (optional)
4. Submit

### Answering Questions

1. Tap any question to view answers
2. Scroll to the answer form at the bottom
3. Write your answer and submit

### Guidelines

- Be respectful and helpful
- Do not share personal medical advice
- Report inappropriate content

---

## Language Toggle

Switch between English and Dhivehi.

- **Location**: Top-right of most screens (globe icon)
- **Effect**: Changes UI text and content where available
- **Persistence**: Your choice is saved for future visits

---

## PWA Installation

Install MedLink as a mobile app for quick access and offline support.

### On Android (Chrome)

1. Open the app in Chrome
2. Tap the menu (⋮) > “Install app” or “Add to Home screen”
3. Confirm – the app icon will appear on your home screen

### On iOS (Safari)

1. Open in Safari
2. Tap the Share button (square with arrow)
3. Scroll and tap “Add to Home Screen”
4. Tap “Add”

### Benefits

- Faster loading
- Works offline with cached data
- No browser bars
- Full-screen experience

---

## Admin Dashboard

For hospital/clinic administrators to manage listings.

### Access

- Go to `/admin`
- Login credentials required (contact support)

### Features

- **Dashboard Overview**: Stats for doctors, hospitals, reviews
- **Manage Hospitals**: Add, edit, delete hospitals; upload images
- **Manage Doctors**: Add, edit, delete doctors; move between hospitals
- **Manage Reviews**: Moderate patient reviews and comments

### Adding a Doctor

1. Go to Admin > Doctors
2. Tap “Add Doctor”
3. Fill in:
   - Name, Specialty, Hospital
   - Qualifications, Contact
   - Upload photo (optional)
4. Save

### Editing a Hospital

1. Go to Admin > Hospitals
2. Search and select the hospital
3. Edit any field
4. Upload new images if needed
5. Save

---

## Troubleshooting

### Common Issues

#### App won’t load or shows “Loading…” forever

- **Cause**: Network issue or browser cache
- **Fix**:
  - Refresh the page
  - Check internet connection
  - Clear browser cache
  - Try a different browser

#### Search not working

- **Cause**: No internet or data sync issue
- **Fix**:
  - Ensure you’re online
  - Wait a few seconds and retry
  - Check if filters are too restrictive

#### Can’t install PWA

- **Cause**: Browser or device limitation
- **Fix**:
  - Use Chrome on Android or Safari on iOS
  - Ensure enough storage space
  - Update your browser

#### Wrong language displayed

- **Fix**: Tap the language toggle (globe icon) to switch

#### Data seems outdated

- **Fix**: Data is updated regularly by admins. Refresh to see latest

### Performance Tips

- Use a modern browser
- Ensure good internet connection
- Install as PWA for faster access
- Close unused tabs if slow

### Support

- **Email**: support@medlink.mv
- **Emergency**: 102
- **Live URL**: [medlink-maldives.vercel.app](https://medlink-maldives.vercel.app)

---

## Privacy & Security

- No personal data is stored on your device
- Location is only used to filter results (not tracked)
- All data is stored securely in Supabase
- We do not share your information with third parties

---

## Frequently Asked Questions

**Q: Is the app free?**  
A: Yes, MedLink Maldives is free for all users.

**Q: Can I book appointments through the app?**  
A: Currently, you can call doctors directly. Online booking is coming soon.

**Q: How accurate is the data?**  
A: Data is regularly updated by hospital administrators. Report any errors via support.

**Q: Does it work offline?**  
A: Installed PWA can show previously loaded data offline; live data requires internet.

**Q: Can I add my clinic?**  
A: Yes – contact support or use the admin dashboard if you’re an authorized admin.

---

_“Connecting you to healthcare since 2019 – Made with ❤️ in Maldives”_
