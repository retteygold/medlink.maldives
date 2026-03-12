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
10. [Medicine Help](#medicine-help)
11. [Not sure which pharmacy has your medicine?](#not-sure-which-pharmacy-has-your-medicine)
12. [Account & Login](#account--login)
13. [Admin Dashboard](#admin-dashboard)
14. [Troubleshooting](#troubleshooting)

---

## Getting Started

MedLink Maldives is a mobile-first web app that helps you find doctors, hospitals, and specialists across the Maldives. No download is required – it works in any modern browser.

The app uses a consistent MedLink color palette and illustrated screens (Storyset) for a modern, friendly experience.

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
- **Directions / Open in Maps**: Opens the hospital in Google Maps
  - If an exact Google Maps link is saved by admin, it opens that
  - Otherwise it falls back to a Google Maps search using the hospital name + address
- **Share**: Share the hospital info

### Searching Doctors inside a Hospital

On each hospital detail screen:

1. Scroll to **Doctors at {Hospital}**
2. Start typing a doctor name
3. A dropdown list will appear
4. Tap a suggestion to open the doctor profile

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

---

## Medlink Ride

Medlink Ride lets riders request a pickup and drivers accept requests. After a driver accepts, the rider can see the driver moving on the map.

### Rider Flow

1. Go to **Ride**
2. Book a ride by entering:
   - Pickup location
   - Destination
3. You will be taken to **My Ride Status**
4. Once a driver accepts, the status becomes **ACCEPTED**
5. When the driver taps **On the way**, you will see:
   - “Driver is on the way to pickup”
   - Driver marker moving on the map (live GPS updates)
6. When the driver arrives, the status becomes **ARRIVED**
7. When the trip starts, the status becomes **STARTED**
8. When the trip ends, the status becomes **FINISHED**

### Driver Flow

1. Go to **Driver Dashboard**
2. If your driver profile is approved, you will see **open ride requests**
3. Tap **Accept** to accept a request
4. After accepting:
   - Tap **On the way** to notify the rider you are heading to pickup
   - Your GPS location is sent periodically so the rider can see movement
5. At the pickup point, tap **Arrived**
6. When the rider is picked up, tap **Start**
7. At destination, tap **Finish & Cash**

### Live Tracking & Notifications

- The rider status page updates every few seconds.
- If notifications are enabled in the browser, the rider can get toast/notification messages for:
  - Driver accepted
  - Driver on the way
  - Driver arrived
  - Ride finished
- No browser bars
- Full-screen experience

---

## Medicine Help

Medicine Help is a community feature to request medicine that is not available locally.

### Who can use it?

- You must be **logged in** to view and post Medicine Help requests.
- You must be **logged in** to message someone about a request.

### Accessing Medicine Help

1. From the Home screen, tap **Medicine Help**
2. If you are not logged in, the app will take you to **Login / Signup**
3. After signing in, you will be redirected back to Medicine Help

### Creating a Request

1. Go to **Medicine Help**
2. Tap the **+** button
3. Fill in any optional fields:
   - Title
   - Medicine name
   - Dosage
   - Quantity
   - Needed by date
   - Location / Atoll
   - Notes
4. Upload:
   - **Prescription image** (recommended)
   - **Previous medicine photo** (optional)
5. Tap **Post request**

### Viewing Requests

- Use the search bar to find a request
- Tap a request card to open details

### Messaging (1-to-1 chat)

#### If you want to help (Helper)

1. Open a request
2. Tap **Message requester**
3. Type and send your message

#### If you posted the request (Requester)

1. Open your request
2. You will see a **Chats** section
3. Open a conversation
4. Reply to the helper

### Privacy note

- Prescription images can contain sensitive information.
- Before uploading, **hide personal details** when possible.
- Images are stored in a private storage bucket and only accessible to logged-in users.

---

## Not sure which pharmacy has your medicine?

This feature helps you find a pharmacy that has your medicine in stock by uploading a prescription or medicine photo.

### How to Use

1. From the Home screen, tap **Not sure which pharmacy has your medicine?**
2. Optionally add the medicine name or brand
3. Upload a prescription or medicine photo
4. Wait for a provider/admin to respond with:
   - Pharmacy name
   - Phone
   - Location
   - Availability (in stock / out of stock / unknown)

### If you need urgent help

If you can’t wait for an in-app response, you can share the image via **Viber** to **Shikavathi Chatline +7951400**.

---

## Account & Login

### Signup

When creating an account, select a role:

- **Request medicine help** (`need_service`)
- **Help others bring medicine** (`provide_service`)

This role is saved in your account metadata and can be used for future filtering or features.

The signup screen uses a guided role selection UI.

### Login

- Login uses **email + password**.
- If you try to open Medicine Help while logged out, the app will redirect you to Login automatically.

The login screen includes an illustrated header and clear success/error messages.

---

## Admin Dashboard

For hospital/clinic administrators to manage listings.

### Access

- Go to `/admin`
- Login credentials required (contact support)

The admin login screen uses the same modern UI style as the user login.

### Admin Access Control

Admin access is controlled by the `admin_users` table in Supabase.

- Only users listed in `admin_users` can access `/admin/*`.
- If a non-admin logs in at `/admin/login`, the system will sign them out and show an error.

### Features

- **Dashboard Overview**: Stats for doctors, hospitals, reviews
- **Manage Hospitals**: Add, edit, delete hospitals; upload images
- **Manage Doctors**: Add, edit, delete doctors; move between hospitals
- **Manage Reviews**: Moderate patient reviews and comments

### Medicine Help Management (Admin)

1. Go to Admin Dashboard
2. Tap **Medicine Help**
3. Search requests
4. Change request status:
   - `open`
   - `in_progress`
   - `fulfilled`
   - `cancelled`

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

#### New features not appearing after deployment

Because MedLink Maldives is a PWA, browsers may cache older JavaScript bundles.

- **Fix (desktop Chrome/Edge)**:
  1. Open DevTools (F12)
  2. Application → Service Workers → **Unregister**
  3. Application → Storage → **Clear site data**
  4. Reload the page

- **Fix (mobile installed app/PWA)**:
  - Remove the installed app icon
  - Clear site data in browser settings
  - Reopen the site

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
