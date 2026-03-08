import { supabase } from './supabase'
import type { Hospital, Doctor } from '../types'


// Database types (must match Supabase schema)
interface DBHospital {
  id: string
  name: string
  registration_number: string | null
  operating_license_no: string | null
  address: string
  contact_phone: string | null
  email: string | null
  website: string | null
  category: string
  location_type: string
  image_url: string | null
  description: string | null
  has_emergency: boolean
  has_pharmacy: boolean
  has_laboratory: boolean
  has_radiology: boolean
  opening_hours: string | null
  is_active: boolean
  created_at: string
  rating: number
  review_count: number
}

interface DBDoctor {
  id: string
  name: string
  specialty: string
  hospital_id: string | null
  hospital_name: string
  qualifications: string[] | null
  languages?: string[] | null
  services?: string[] | null
  short_bio?: string | null
  profile_notes?: string | null
  website_url?: string | null
  google_search_url?: string | null
  google_maps_url?: string | null
  facebook_url?: string | null
  instagram_url?: string | null
  verification_source?: string | null
  last_verified_at?: string | null
  contact_phone: string | null
  email: string | null
  image_url: string | null
  about: string | null
  rating: number
  review_count: number
  is_active: boolean
  created_at: string
}

// Transform DBHospital to Hospital interface
function transformHospital(db: DBHospital): Hospital {
  return {
    id: db.id,
    name: db.name,
    registration_number: db.registration_number || '',
    operating_license_no: db.operating_license_no || '',
    address: db.address,
    contact_phone: db.contact_phone || '',
    email: db.email || '',
    website: db.website || '',
    category: db.category as Hospital['category'],
    location_type: db.location_type as Hospital['location_type'],
    image_url: db.image_url || '',
    description: db.description || '',
    has_emergency: db.has_emergency,
    has_pharmacy: db.has_pharmacy,
    has_laboratory: db.has_laboratory,
    has_radiology: db.has_radiology,
    opening_hours: db.opening_hours || '',
    is_active: db.is_active,
    created_at: db.created_at,
    rating: db.rating,
    review_count: db.review_count
  }
}

// Transform DBDoctor to Doctor interface
function transformDoctor(db: DBDoctor): Doctor {
  return {
    id: db.id,
    name: db.name,
    specialty: db.specialty,
    hospital_id: db.hospital_id || '',
    hospital_name: db.hospital_name,
    qualifications: db.qualifications || [],
    languages: (db.languages || []) as string[],
    services: (db.services || []) as string[],
    short_bio: db.short_bio || '',
    profile_notes: db.profile_notes || '',
    website_url: db.website_url || '',
    google_search_url: db.google_search_url || '',
    google_maps_url: db.google_maps_url || '',
    facebook_url: db.facebook_url || '',
    instagram_url: db.instagram_url || '',
    verification_source: db.verification_source || '',
    last_verified_at: db.last_verified_at || '',
    contact_phone: db.contact_phone || '',
    email: db.email || '',
    image_url: db.image_url || '',
    about: db.about || '',
    rating: db.rating,
    review_count: db.review_count,
    is_active: db.is_active,
    created_at: db.created_at
  }
}

// Hospitals
export async function getHospitals(): Promise<Hospital[]> {
  try {
    const { data, error } = await supabase
      .from('hospitals')
      .select('*')
      .eq('is_active', true)
      .order('name')
    if (error) throw error
    return (data || []).map(transformHospital)
  } catch (err) {
    console.error('Error fetching hospitals:', err)
    return []
  }
}

export async function createHospital(payload: {
  name: string
  category: Hospital['category']
  address?: string
  contact_phone?: string
  email?: string
  website?: string
  opening_hours?: string
  image_url?: string
}): Promise<Hospital | undefined> {
  try {
    const insertPayload: any = {
      name: payload.name,
      category: payload.category,
      address: payload.address || '',
      contact_phone: payload.contact_phone || null,
      email: payload.email || null,
      website: payload.website || null,
      opening_hours: payload.opening_hours || null,
      image_url: payload.image_url || null,
      location_type: 'Male',
      has_emergency: false,
      has_pharmacy: false,
      has_laboratory: false,
      has_radiology: false,
      is_active: true
    }

    const { data, error } = await supabase
      .from('hospitals')
      .insert(insertPayload)
      .select('*')
      .single()
    if (error) throw error
    return transformHospital(data)
  } catch (err) {
    console.error('Error creating hospital:', err)
    return undefined
  }
}

export async function updateHospital(
  id: string,
  payload: {
    name: string
    category: Hospital['category']
    address?: string
    contact_phone?: string
    email?: string
    website?: string
    opening_hours?: string
    image_url?: string
  }
): Promise<Hospital | undefined> {
  try {
    const updatePayload: any = {
      name: payload.name,
      category: payload.category,
      address: payload.address || '',
      contact_phone: payload.contact_phone || null,
      email: payload.email || null,
      website: payload.website || null,
      opening_hours: payload.opening_hours || null,
      image_url: payload.image_url || null
    }

    const { data, error } = await supabase
      .from('hospitals')
      .update(updatePayload)
      .eq('id', id)
      .select('*')
      .single()
    if (error) throw error
    return transformHospital(data)
  } catch (err) {
    console.error('Error updating hospital:', err)
    return undefined
  }
}

export async function getHospitalById(id: string): Promise<Hospital | undefined> {
  try {
    const { data, error } = await supabase
      .from('hospitals')
      .select('*')
      .eq('id', id)
      .eq('is_active', true)
      .single()
    if (error) throw error
    return transformHospital(data)
  } catch (err) {
    console.error('Error fetching hospital by ID:', err)
    return undefined
  }
}

// Doctors
export async function getDoctors(): Promise<Doctor[]> {
  try {
    const { data, error } = await supabase
      .from('doctors')
      .select('*')
      .eq('is_active', true)
      .order('name')
    if (error) throw error
    return (data || []).map(transformDoctor)
  } catch (err) {
    console.error('Error fetching doctors:', err)
    return []
  }
}

export async function getDoctorById(id: string): Promise<Doctor | undefined> {
  try {
    const { data, error } = await supabase
      .from('doctors')
      .select('*')
      .eq('id', id)
      .eq('is_active', true)
      .single()
    if (error) throw error
    return transformDoctor(data)
  } catch (err) {
    console.error('Error fetching doctor by ID:', err)
    return undefined
  }
}

// Specialties
export async function getSpecialties(): Promise<string[]> {
  try {
    const { data, error } = await supabase
      .from('specialties')
      .select('name')
      .order('name')
    if (error) throw error
    return (data || []).map(s => s.name)
  } catch (err) {
    console.error('Error fetching specialties:', err)
    return []
  }
}

// Search
export async function searchHospitals(query: string): Promise<Hospital[]> {
  try {
    const { data, error } = await supabase
      .from('hospitals')
      .select('*')
      .eq('is_active', true)
      .or(`name.ilike.%${query}%,address.ilike.%${query}%,category.ilike.%${query}%`)
      .order('name')
    if (error) throw error
    return (data || []).map(transformHospital)
  } catch (err) {
    console.error('Error searching hospitals:', err)
    return []
  }
}

export async function searchDoctors(query: string): Promise<Doctor[]> {
  try {
    const { data, error } = await supabase
      .from('doctors')
      .select('*')
      .eq('is_active', true)
      .or(`name.ilike.%${query}%,specialty.ilike.%${query}%,hospital_name.ilike.%${query}%`)
      .order('name')
    if (error) throw error
    return (data || []).map(transformDoctor)
  } catch (err) {
    console.error('Error searching doctors:', err)
    return []
  }
}

// Reviews
export async function getDoctorReviews(doctorId: string) {
  try {
    const { data, error } = await supabase
      .from('doctor_reviews')
      .select('*')
      .eq('doctor_id', doctorId)
      .eq('is_active', true)
      .order('created_at', { ascending: false })
    if (error) throw error
    return data || []
  } catch (err) {
    console.error('Error fetching doctor reviews:', err)
    return []
  }
}

export async function addDoctorReview(review: {
  doctor_id: string
  rating: number
  comment?: string
  author_name?: string
}) {
  try {
    const { data, error } = await supabase
      .from('doctor_reviews')
      .insert(review)
      .select()
      .single()
    if (error) throw error
    return data
  } catch (err) {
    console.error('Error adding doctor review:', err)
    throw err
  }
}

// Community Q&A
export async function getQuestions() {
  try {
    const { data, error } = await supabase
      .from('questions')
      .select('*')
      .eq('is_active', true)
      .order('created_at', { ascending: false })
    if (error) throw error
    return data || []
  } catch (err) {
    console.error('Error fetching questions:', err)
    return []
  }
}

export async function getQuestionById(id: string) {
  try {
    const { data, error } = await supabase
      .from('questions')
      .select('*')
      .eq('id', id)
      .eq('is_active', true)
      .single()
    if (error) throw error
    return data
  } catch (err) {
    console.error('Error fetching question by ID:', err)
    return undefined
  }
}

export async function getAnswersForQuestion(questionId: string) {
  try {
    const { data, error } = await supabase
      .from('answers')
      .select('*')
      .eq('question_id', questionId)
      .eq('is_active', true)
      .order('created_at', { ascending: false })
    if (error) throw error
    return data || []
  } catch (err) {
    console.error('Error fetching answers:', err)
    return []
  }
}

export async function createQuestion(question: {
  title: string
  content: string
  category?: string
  author_name?: string
}) {
  try {
    const { data, error } = await supabase
      .from('questions')
      .insert(question)
      .select()
      .single()
    if (error) throw error
    return data
  } catch (err) {
    console.error('Error creating question:', err)
    throw err
  }
}

export async function createAnswer(answer: {
  question_id: string
  content: string
  author_name?: string
}) {
  try {
    const { data, error } = await supabase
      .from('answers')
      .insert(answer)
      .select()
      .single()
    if (error) throw error
    return data
  } catch (err) {
    console.error('Error creating answer:', err)
    throw err
  }
}

// Stats
export async function getDatabaseStats() {
  try {
    // Use working functions instead of count queries
    const [hospitals, doctors, specialties] = await Promise.all([
      getHospitals(),
      getDoctors(),
      getSpecialties()
    ])
    return {
      total_facilities: hospitals.length,
      total_doctors: doctors.length,
      total_specialties: specialties.length
    }
  } catch (err) {
    console.error('Error fetching database stats:', err)
    return { total_facilities: 0, total_doctors: 0, total_specialties: 0 }
  }
}
