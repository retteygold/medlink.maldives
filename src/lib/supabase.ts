import { createClient } from '@supabase/supabase-js'

const supabaseUrl = (import.meta as any).env?.VITE_SUPABASE_URL || ''
const supabaseAnonKey = (import.meta as any).env?.VITE_SUPABASE_ANON_KEY || ''

export const supabase = createClient(supabaseUrl, supabaseAnonKey)

// Database types and helper functions
export type Database = {
  doctors: {
    id: string
    name: string
    specialty: string
    hospital_id: string
    hospital_name: string
    qualifications: string[]
    experience_years: number
    languages: string[]
    consultation_fee: number
    available_days: string[]
    available_times: string[]
    contact_phone: string
    email: string
    image_url: string
    about: string
    rating: number
    review_count: number
    is_active: boolean
    created_at: string
  }
  hospitals: {
    id: string
    name: string
    registration_number: string
    operating_license_no: string
    address: string
    contact_phone: string
    email: string
    website: string
    category: string
    location_type: string
    island_name: string
    atoll: string
    has_emergency: boolean
    has_pharmacy: boolean
    has_laboratory: boolean
    has_radiology: boolean
    opening_hours: string
    image_url: string
    description: string
    rating: number
    review_count: number
    is_active: boolean
    created_at: string
  }
  specialties: {
    id: string
    name: string
    category: string
    description: string
    icon_url: string
    common_conditions: string[]
    created_at: string
  }
}

// Helper function to fetch doctors with filters
export async function fetchDoctors(filters?: {
  specialty?: string
  hospitalId?: string
  searchQuery?: string
}) {
  let query = supabase.from('doctors').select('*').eq('is_active', true)

  if (filters?.specialty) {
    query = query.eq('specialty', filters.specialty)
  }
  if (filters?.hospitalId) {
    query = query.eq('hospital_id', filters.hospitalId)
  }
  if (filters?.searchQuery) {
    query = query.or(`name.ilike.%${filters.searchQuery}%,specialty.ilike.%${filters.searchQuery}%`)
  }

  const { data, error } = await query.order('rating', { ascending: false })
  
  if (error) {
    console.error('Error fetching doctors:', error)
    return []
  }
  
  return data || []
}

// Helper function to fetch hospitals with filters
export async function fetchHospitals(filters?: {
  category?: string
  locationType?: string
  hasEmergency?: boolean
  searchQuery?: string
}) {
  let query = supabase.from('hospitals').select('*').eq('is_active', true)

  if (filters?.category) {
    query = query.eq('category', filters.category)
  }
  if (filters?.locationType) {
    query = query.eq('location_type', filters.locationType)
  }
  if (filters?.hasEmergency) {
    query = query.eq('has_emergency', true)
  }
  if (filters?.searchQuery) {
    query = query.or(`name.ilike.%${filters.searchQuery}%,address.ilike.%${filters.searchQuery}%`)
  }

  const { data, error } = await query.order('rating', { ascending: false })
  
  if (error) {
    console.error('Error fetching hospitals:', error)
    return []
  }
  
  return data || []
}

// Helper function to fetch all specialties
export async function fetchSpecialties() {
  const { data, error } = await supabase
    .from('specialties')
    .select('*')
    .order('name')

  if (error) {
    console.error('Error fetching specialties:', error)
    return []
  }

  return data || []
}

// Helper function to search by symptoms
export async function searchBySymptoms(symptoms: string) {
  // First, get all specialties with their common conditions
  const { data: specialties } = await supabase
    .from('specialties')
    .select('*')

  if (!specialties) return { doctors: [], specialties: [], urgency: 'low' }

  // Match symptoms to specialties based on common conditions
  const symptomLower = symptoms.toLowerCase()
  const matchedSpecialties = specialties.filter(spec => 
    spec.common_conditions?.some((condition: string) => 
      symptomLower.includes(condition.toLowerCase())
    ) || symptomLower.includes(spec.name.toLowerCase())
  )

  // Get doctors for matched specialties
  const specialtyNames = matchedSpecialties.map(s => s.name)
  
  if (specialtyNames.length === 0) {
    return { doctors: [], specialties: [], urgency: 'low' }
  }

  const { data: doctors } = await supabase
    .from('doctors')
    .select('*')
    .in('specialty', specialtyNames)
    .eq('is_active', true)
    .order('rating', { ascending: false })
    .limit(10)

  return {
    doctors: doctors || [],
    specialties: matchedSpecialties,
    urgency: matchedSpecialties.some(s => 
      ['Emergency Medicine', 'Cardiology', 'Neurology'].includes(s.name)
    ) ? 'high' : 'low'
  }
}

export interface HomePageProps {
  installPrompt?: any
}
