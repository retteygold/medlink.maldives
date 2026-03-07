export interface Doctor {
  id: string;
  name: string;
  specialty: string;
  hospital_id: string;
  hospital_name: string;
  qualifications?: string[];
  experience_years?: number;
  languages?: string[];
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
  registration_number?: string;
  operating_license_no?: string;
  address: string;
  contact_phone?: string;
  email?: string;
  website?: string;
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
