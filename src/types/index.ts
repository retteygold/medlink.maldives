export interface Doctor {
  id: string;
  name: string;
  name_dv?: string;
  specialty: string;
  specialty_dv?: string;
  hospital_id: string;
  hospital_name: string;
  hospital_name_dv?: string;
  qualifications?: string[];
  experience_years?: number;
  languages?: string[];
  services?: string[];
  short_bio?: string;
  profile_notes?: string;
  website_url?: string;
  google_search_url?: string;
  google_maps_url?: string;
  facebook_url?: string;
  instagram_url?: string;
  verification_source?: string;
  last_verified_at?: string;
  consultation_fee?: number;
  available_days?: string[];
  available_times?: string[];
  contact_phone?: string;
  email?: string;
  image_url?: string;
  about?: string;
  rating?: number;
  review_count?: number;
  is_active: boolean;
  created_at: string;
}

export interface Hospital {
  id: string;
  name: string;
  name_dv?: string;
  registration_number?: string;
  operating_license_no?: string;
  address: string;
  address_dv?: string;
  contact_phone?: string;
  email?: string;
  website?: string;
  google_maps_url?: string;
  category: 'General Clinic' | 'Private Hospital' | 'Speciality Hospital' | 'Diagnostic Clinic' | 'Resort Clinic' | 'Therapeutic Clinic' | 'Area Specific Clinic' | 'Speciality Clinic' | 'Traditional Clinic';
  location_type: 'Male' | 'Hulhumale' | 'Island' | 'Resort';
  island_name?: string;
  atoll?: string;
  has_emergency: boolean;
  has_pharmacy: boolean;
  has_laboratory: boolean;
  has_radiology: boolean;
  opening_hours?: string;
  image_url?: string;
  description?: string;
  rating?: number;
  review_count?: number;
  is_active: boolean;
  created_at: string;
}

export interface Specialty {
  id: string;
  name: string;
  category: 'Medical' | 'Surgical' | 'Diagnostic' | 'Therapeutic' | 'Dental' | 'Vision' | 'Other';
  description?: string;
  icon_url?: string;
  common_conditions?: string[];
  created_at: string;
}

export interface SymptomToSpecialty {
  symptom: string;
  keywords: string[];
  suggested_specialties: string[];
  urgency_level: 'low' | 'medium' | 'high' | 'emergency';
  description: string;
}

export interface SearchFilters {
  query?: string;
  specialty?: string;
  location_type?: string;
  island_name?: string;
  has_emergency?: boolean;
  category?: string;
  available_today?: boolean;
}

export interface UserLocation {
  latitude: number;
  longitude: number;
  accuracy?: number;
}

export type RideVehicleType = 'bike' | 'car' | 'van' | 'pickup'

export interface RideDriverProfile {
  id: string
  user_id: string
  full_name: string
  phone: string
  vehicle_type: RideVehicleType
  vehicle_brand: string
  vehicle_color: string
  vehicle_number: string
  license_number: string
  annual_fee: number
  driver_image_path?: string | null
  license_image_path?: string | null
  status: 'pending' | 'approved' | 'rejected'
  rejection_reason?: string | null
  created_at: string
  updated_at: string
}

export interface RideRequest {
  id: string
  rider_user_id: string
  origin_text: string
  destination_text: string
  vehicle_type: RideVehicleType
  fare: number
  status: 'open' | 'matched' | 'cancelled'
  created_at: string
}

export interface RideTrip {
  id: string
  request_id: string
  driver_user_id: string
  status: 'accepted' | 'arrived' | 'started' | 'finished' | 'cancelled'
  accepted_at: string
  arrived_at?: string | null
  started_at?: string | null
  finished_at?: string | null
  cash_paid: boolean
  amount: number
  rider_rating?: number | null
  rider_rating_comment?: string | null
}
