import { supabase } from './supabase'
import type { Hospital, Doctor, RideDriverProfile, RideRequest, RideTrip, RideVehicleType } from '../types'
import { containsThaana, transliterateFromDhivehi } from './transliteration'


// Database types (must match Supabase schema)
interface DBHospital {
  id: string
  name: string
  name_dv?: string | null
  address_dv?: string | null
  registration_number: string | null
  operating_license_no: string | null
  address: string
  contact_phone: string | null
  email: string | null
  website: string | null
  google_maps_url?: string | null
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

export async function updateDriverTripLocation(tripId: string, lat: number, lng: number): Promise<boolean> {
  try {
    const payload: any = {
      driver_lat: typeof lat === 'number' ? lat : null,
      driver_lng: typeof lng === 'number' ? lng : null,
      driver_updated_at: new Date().toISOString()
    }

    const { error } = await supabase
      .from('ride_trips')
      .update(payload)
      .eq('id', tripId)

    if (error) throw error
    return true
  } catch (err) {
    console.error('Error updating driver trip location:', err)
    return false
  }
}

export async function setRideTripDelayReason(tripId: string, reason: string): Promise<boolean> {
  try {
    const msg = String(reason || '').trim()
    if (!msg) return false

    const { error } = await supabase
      .from('ride_trips')
      .update({ delay_reason: msg, delay_reported_at: new Date().toISOString() })
      .eq('id', tripId)
    if (error) throw error
    return true
  } catch (err) {
    console.error('Error setting ride trip delay reason:', err)
    return false
  }
}

export async function listAdminRideTrips(limit: number = 200): Promise<
  Array<RideTrip & { request?: RideRequest | null; driver?: RideDriverProfile | null }>
> {
  try {
    const { data: trips, error } = await supabase
      .from('ride_trips')
      .select('*')
      .order('accepted_at', { ascending: false })
      .limit(limit)

    if (error) throw error
    const list = (trips || []) as any[]
    if (list.length === 0) return []

    const requestIds = Array.from(new Set(list.map((t) => String(t.request_id)).filter(Boolean)))
    const driverUserIds = Array.from(new Set(list.map((t) => String(t.driver_user_id)).filter(Boolean)))

    const [reqRes, drvRes] = await Promise.all([
      supabase.from('ride_requests').select('*').in('id', requestIds),
      supabase.from('ride_driver_profiles').select('*').in('user_id', driverUserIds)
    ])

    const reqById = new Map<string, any>()
    if (!reqRes.error) {
      for (const r of reqRes.data || []) reqById.set(String((r as any).id), r)
    }

    const drvByUser = new Map<string, any>()
    if (!drvRes.error) {
      for (const d of drvRes.data || []) drvByUser.set(String((d as any).user_id), d)
    }

    return list.map((t) => {
      const request = reqById.get(String(t.request_id)) || null
      const driver = drvByUser.get(String(t.driver_user_id)) || null
      return ({ ...(t as any), request, driver } as any)
    })
  } catch (err) {
    console.error('Error listing admin ride trips:', err)
    return []
  }
}

export async function uploadRideDriverImage(file: File, kind: 'driver' | 'license' | 'vehicle'): Promise<string> {
  const { data: sessionData, error: sessionError } = await supabase.auth.getSession()
  if (sessionError) throw sessionError
  const user = sessionData.session?.user
  if (!user) throw new Error('Not authenticated')

  const safeName = (file.name || 'image').replace(/[^a-zA-Z0-9._-]+/g, '-')
  const path = `ride/${kind}/${user.id}/${Date.now()}-${safeName}`

  const { error } = await supabase.storage.from('medicine-requests').upload(path, file, {
    upsert: false,
    contentType: file.type || undefined
  })
  if (error) throw error
  return path
}

// Medicine Help (must match Supabase schema)
export type MedicineRequestStatus = 'open' | 'in_progress' | 'shipped' | 'received' | 'completed' | 'cancelled'

interface DBMedicineRequest {
  id: string
  created_at: string
  updated_at: string
  user_id: string
  title: string | null
  medicine_name: string | null
  dosage: string | null
  quantity: number | null
  needed_by: string | null
  notes: string | null
  location_type: string | null
  atoll: string | null
  prescription_image_path: string | null
  previous_medicine_image_path: string | null
  status: MedicineRequestStatus
}

interface DBMedicineConversation {
  id: string
  created_at: string
  request_id: string
  requester_id: string
  helper_id: string
  shipment_status: 'none' | 'shipped' | 'received' | null
  tracking_number: string | null
  shipped_at: string | null
  received_at: string | null
  completed_at: string | null
  is_active: boolean
}

interface DBMedicineMessage {
  id: string
  created_at: string
  conversation_id: string
  sender_id: string
  sender_name: string | null
  message: string
  image_path: string | null
  is_read: boolean
}

interface DBMedicineReview {
  id: string
  created_at: string
  conversation_id: string
  requester_id: string
  helper_id: string
  rating: number
  comment: string | null
  is_active: boolean
}

export type PharmacyFinderAvailability = 'in_stock' | 'out_of_stock' | 'unknown'

export type PharmacyFinderStatus = 'open' | 'answered' | 'closed'

export interface DBPharmacyFinderRequest {
  id: string
  created_at: string
  updated_at: string
  user_id: string
  image_path: string
  notes: string | null
  status: PharmacyFinderStatus
  pharmacy_name: string | null
  pharmacy_phone: string | null
  pharmacy_location: string | null
  availability: PharmacyFinderAvailability | null
  answered_by: string | null
  answered_at: string | null
}

interface DBDoctor {
  id: string
  name: string
  name_dv?: string | null
  specialty: string
  specialty_dv?: string | null
  hospital_id: string | null
  hospital_name: string
  hospital_name_dv?: string | null
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
    name_dv: db.name_dv || undefined,
    registration_number: db.registration_number || '',
    operating_license_no: db.operating_license_no || '',
    address: db.address,
    address_dv: db.address_dv || undefined,
    contact_phone: db.contact_phone || '',
    email: db.email || '',
    website: db.website || '',
    google_maps_url: db.google_maps_url || '',
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

export async function updateMedicineRequestStatus(
  id: string,
  status: MedicineRequestStatus
): Promise<boolean> {
  try {
    const { data, error } = await supabase
      .from('medicine_requests')
      .update({ status }, { count: 'exact' })
      .eq('id', id)
      .select('id')
    if (error) throw error
    return Boolean(data && data.length > 0)
  } catch (err) {
    console.error('Error updating medicine request status:', err)
    return false
  }
}

function extractMissingColumnFromPostgrestError(err: any): string | null {
  const message = typeof err?.message === 'string' ? err.message : ''
  const m = message.match(/Could not find the '([^']+)' column of '([^']+)'/i)
  if (!m) return null
  return m[1] || null
}

// Transform DBDoctor to Doctor interface
function transformDoctor(db: DBDoctor): Doctor {
  return {
    id: db.id,
    name: db.name,
    name_dv: db.name_dv || undefined,
    specialty: db.specialty,
    specialty_dv: db.specialty_dv || undefined,
    hospital_id: db.hospital_id || '',
    hospital_name: db.hospital_name,
    hospital_name_dv: db.hospital_name_dv || undefined,
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
  google_maps_url?: string
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
      google_maps_url: payload.google_maps_url || null,
      opening_hours: payload.opening_hours || null,
      image_url: payload.image_url || null,
      location_type: 'Male',
      has_emergency: false,
      has_pharmacy: false,
      has_laboratory: false,
      has_radiology: false,
      is_active: true
    }

    let { data, error } = await supabase
      .from('hospitals')
      .insert(insertPayload)
      .select('*')
      .maybeSingle()

    if (error) {
      const missing = extractMissingColumnFromPostgrestError(error)
      if (missing && missing in insertPayload) {
        delete insertPayload[missing]
        ;({ data, error } = await supabase
          .from('hospitals')
          .insert(insertPayload)
          .select('*')
          .maybeSingle())
      }
    }

    if (error) throw error
    if (!data) return undefined
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
    google_maps_url?: string
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
      google_maps_url: payload.google_maps_url || null,
      opening_hours: payload.opening_hours || null,
      image_url: payload.image_url || null
    }

    let { data, error } = await supabase
      .from('hospitals')
      .update(updatePayload, { count: 'exact' })
      .eq('id', id)
      .select('*')

    if (error) {
      const missing = extractMissingColumnFromPostgrestError(error)
      if (missing && missing in updatePayload) {
        delete updatePayload[missing]
        ;({ data, error } = await supabase
          .from('hospitals')
          .update(updatePayload, { count: 'exact' })
          .eq('id', id)
          .select('*'))
      }
    }

    if (error) throw error
    if (!data || data.length === 0) {
      throw new Error('No rows were updated. This is usually caused by Supabase RLS policies blocking UPDATE for this user.')
    }

    return transformHospital(data[0])
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

async function fetchAllPages<T>(fetchPage: (from: number, to: number) => Promise<T[]>, pageSize: number) {
  const all: T[] = []
  let from = 0
  while (true) {
    const to = from + pageSize - 1
    const page = await fetchPage(from, to)
    all.push(...page)
    if (page.length < pageSize) break
    from += pageSize
  }
  return all
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

export async function getAllDoctors(pageSize: number = 1000): Promise<Doctor[]> {
  try {
    const rows = await fetchAllPages<any>(
      async (from, to) => {
        const { data, error } = await supabase
          .from('doctors')
          .select('*')
          .eq('is_active', true)
          .order('name')
          .range(from, to)
        if (error) throw error
        return (data || []) as any[]
      },
      pageSize
    )
    return rows.map(transformDoctor)
  } catch (err) {
    console.error('Error fetching all doctors:', err)
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

// Search - supports both English and Dhivehi (name_dv, specialty_dv, address_dv)
// When Dhivehi text is detected, it also transliterates and searches English fields
export async function searchHospitals(query: string): Promise<Hospital[]> {
  try {
    const queries = [query]
    // If query contains Dhivehi, also search transliterated English
    if (containsThaana(query)) {
      const latinQuery = transliterateFromDhivehi(query)
      if (latinQuery && latinQuery !== query) {
        queries.push(latinQuery)
      }
    }
    
    // Build OR conditions for all queries across all fields
    const conditions: string[] = []
    for (const q of queries) {
      const escaped = q.replace(/%/g, '\\%').replace(/_/g, '\\_')
      conditions.push(
        `name.ilike.%${escaped}%`,
        `address.ilike.%${escaped}%`,
        `category.ilike.%${escaped}%`,
        `name_dv.ilike.%${escaped}%`,
        `address_dv.ilike.%${escaped}%`
      )
    }
    
    const { data, error } = await supabase
      .from('hospitals')
      .select('*')
      .eq('is_active', true)
      .or(conditions.join(','))
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
    const queries = [query]
    // If query contains Dhivehi, also search transliterated English
    if (containsThaana(query)) {
      const latinQuery = transliterateFromDhivehi(query)
      if (latinQuery && latinQuery !== query) {
        queries.push(latinQuery)
      }
    }
    
    // Build OR conditions for all queries across all fields
    const conditions: string[] = []
    for (const q of queries) {
      const escaped = q.replace(/%/g, '\\%').replace(/_/g, '\\_')
      conditions.push(
        `name.ilike.%${escaped}%`,
        `specialty.ilike.%${escaped}%`,
        `hospital_name.ilike.%${escaped}%`,
        `name_dv.ilike.%${escaped}%`,
        `specialty_dv.ilike.%${escaped}%`,
        `hospital_name_dv.ilike.%${escaped}%`
      )
    }
    
    const { data, error } = await supabase
      .from('doctors')
      .select('*')
      .eq('is_active', true)
      .or(conditions.join(','))
      .order('name')
    if (error) throw error
    return (data || []).map(transformDoctor)
  } catch (err) {
    console.error('Error searching doctors:', err)
    return []
  }
}

// =====================
// Medicine Help
// =====================

export async function listMedicineRequests(): Promise<DBMedicineRequest[]> {
  try {
    const { data, error } = await supabase
      .from('medicine_requests')
      .select('*')
      .order('created_at', { ascending: false })
    if (error) throw error
    return (data || []) as any
  } catch (err) {
    console.error('Error listing medicine requests:', err)
    return []
  }
}

export async function getMedicineRequestById(id: string): Promise<DBMedicineRequest | undefined> {
  try {
    const { data, error } = await supabase
      .from('medicine_requests')
      .select('*')
      .eq('id', id)
      .maybeSingle()
    if (error) throw error
    return (data || undefined) as any
  } catch (err) {
    console.error('Error fetching medicine request:', err)
    return undefined
  }
}

export async function createMedicineRequest(payload: {
  title?: string
  medicine_name?: string
  dosage?: string
  quantity?: number | null
  needed_by?: string | null
  notes?: string
  location_type?: string | null
  atoll?: string | null
  prescription_image_path?: string | null
  previous_medicine_image_path?: string | null
}): Promise<DBMedicineRequest | undefined> {
  try {
    const { data: sessionData, error: sessionError } = await supabase.auth.getSession()
    if (sessionError) throw sessionError
    const user = sessionData.session?.user
    if (!user) throw new Error('Not authenticated')

    const insertPayload: any = {
      user_id: user.id,
      title: payload.title || null,
      medicine_name: payload.medicine_name || null,
      dosage: payload.dosage || null,
      quantity: typeof payload.quantity === 'number' ? payload.quantity : null,
      needed_by: payload.needed_by || null,
      notes: payload.notes || null,
      location_type: payload.location_type || null,
      atoll: payload.atoll || null,
      prescription_image_path: payload.prescription_image_path || null,
      previous_medicine_image_path: payload.previous_medicine_image_path || null,
      status: 'open'
    }

    const { data, error } = await supabase
      .from('medicine_requests')
      .insert(insertPayload)
      .select('*')
      .maybeSingle()
    if (error) throw error
    return (data || undefined) as any
  } catch (err) {
    console.error('Error creating medicine request:', err)
    return undefined
  }
}

export async function uploadMedicineRequestImage(file: File): Promise<string> {
  const { data: sessionData, error: sessionError } = await supabase.auth.getSession()
  if (sessionError) throw sessionError
  const user = sessionData.session?.user
  if (!user) throw new Error('Not authenticated')

  const safeName = (file.name || 'image').replace(/[^a-zA-Z0-9._-]+/g, '-')
  const path = `${user.id}/${Date.now()}-${safeName}`

  const { error } = await supabase.storage.from('medicine-requests').upload(path, file, {
    upsert: false,
    contentType: file.type || undefined
  })
  if (error) throw error
  return path
}

export async function uploadPharmacyFinderImage(file: File): Promise<string> {
  const { data: sessionData, error: sessionError } = await supabase.auth.getSession()
  if (sessionError) throw sessionError
  const user = sessionData.session?.user
  if (!user) throw new Error('Not authenticated')

  const safeName = (file.name || 'image').replace(/[^a-zA-Z0-9._-]+/g, '-')
  const path = `pharmacy-finder/${user.id}/${Date.now()}-${safeName}`

  const { error } = await supabase.storage.from('medicine-requests').upload(path, file, {
    upsert: false,
    contentType: file.type || undefined
  })
  if (error) throw error
  return path
}

export async function createPharmacyFinderRequest(payload: {
  image_path: string
  notes?: string
}): Promise<DBPharmacyFinderRequest | undefined> {
  try {
    const { data: sessionData, error: sessionError } = await supabase.auth.getSession()
    if (sessionError) throw sessionError
    const user = sessionData.session?.user
    if (!user) throw new Error('Not authenticated')

    const { data, error } = await supabase
      .from('pharmacy_finder_requests')
      .insert({
        user_id: user.id,
        image_path: payload.image_path,
        notes: payload.notes?.trim() || null,
        status: 'open'
      })
      .select('*')
      .maybeSingle()
    if (error) throw error
    return (data || undefined) as any
  } catch (err) {
    console.error('Error creating pharmacy finder request:', err)
    return undefined
  }
}

export async function listMyPharmacyFinderRequests(): Promise<DBPharmacyFinderRequest[]> {
  try {
    const { data: sessionData, error: sessionError } = await supabase.auth.getSession()
    if (sessionError) throw sessionError
    const user = sessionData.session?.user
    if (!user) throw new Error('Not authenticated')

    const { data, error } = await supabase
      .from('pharmacy_finder_requests')
      .select('*')
      .eq('user_id', user.id)
      .order('created_at', { ascending: false })
    if (error) throw error
    return (data || []) as any
  } catch (err) {
    console.error('Error listing my pharmacy finder requests:', err)
    return []
  }
}

export async function listOpenPharmacyFinderRequests(): Promise<DBPharmacyFinderRequest[]> {
  try {
    const { data, error } = await supabase
      .from('pharmacy_finder_requests')
      .select('*')
      .eq('status', 'open')
      .order('created_at', { ascending: false })
    if (error) throw error
    return (data || []) as any
  } catch (err) {
    console.error('Error listing open pharmacy finder requests:', err)
    return []
  }
}

export async function getPharmacyFinderRequestById(id: string): Promise<DBPharmacyFinderRequest | undefined> {
  try {
    const { data, error } = await supabase
      .from('pharmacy_finder_requests')
      .select('*')
      .eq('id', id)
      .maybeSingle()
    if (error) throw error
    return (data || undefined) as any
  } catch (err) {
    console.error('Error fetching pharmacy finder request:', err)
    return undefined
  }
}

export async function answerPharmacyFinderRequest(payload: {
  id: string
  pharmacy_name: string
  pharmacy_phone?: string
  pharmacy_location?: string
  availability: PharmacyFinderAvailability
}): Promise<boolean> {
  try {
    const { data: sessionData, error: sessionError } = await supabase.auth.getSession()
    if (sessionError) throw sessionError
    const user = sessionData.session?.user
    if (!user) throw new Error('Not authenticated')

    const updatePayload: any = {
      status: 'answered',
      pharmacy_name: payload.pharmacy_name.trim(),
      pharmacy_phone: payload.pharmacy_phone?.trim() || null,
      pharmacy_location: payload.pharmacy_location?.trim() || null,
      availability: payload.availability,
      answered_by: user.id,
      answered_at: new Date().toISOString()
    }

    const { error } = await supabase
      .from('pharmacy_finder_requests')
      .update(updatePayload)
      .eq('id', payload.id)
    if (error) throw error
    return true
  } catch (err) {
    console.error('Error answering pharmacy finder request:', err)
    return false
  }
}

export async function getSignedMedicineRequestImageUrl(path: string, expiresInSeconds = 60 * 60): Promise<string> {
  const { data, error } = await supabase.storage
    .from('medicine-requests')
    .createSignedUrl(path, expiresInSeconds)
  if (error) throw error
  if (!data?.signedUrl) throw new Error('Failed to create signed URL')
  return data.signedUrl
}

export async function listMedicineConversationsForRequest(requestId: string): Promise<DBMedicineConversation[]> {
  try {
    const { data, error } = await supabase
      .from('medicine_conversations')
      .select('*')
      .eq('request_id', requestId)
      .order('created_at', { ascending: false })
    if (error) throw error
    return (data || []) as any
  } catch (err) {
    console.error('Error listing medicine conversations:', err)
    return []
  }
}

export async function createOrGetMedicineConversation(payload: {
  request_id: string
  requester_id: string
  helper_id: string
}): Promise<DBMedicineConversation | undefined> {
  try {
    const { data, error } = await supabase
      .from('medicine_conversations')
      .upsert(payload, { onConflict: 'request_id,requester_id,helper_id' })
      .select('*')
      .maybeSingle()
    if (error) throw error
    return (data || undefined) as any
  } catch (err) {
    console.error('Error creating medicine conversation:', err)
    return undefined
  }
}

export async function listMedicineMessages(conversationId: string): Promise<DBMedicineMessage[]> {
  try {
    const { data, error } = await supabase
      .from('medicine_messages')
      .select('*')
      .eq('conversation_id', conversationId)
      .order('created_at', { ascending: true })
    if (error) throw error
    return (data || []) as any
  } catch (err) {
    console.error('Error listing medicine messages:', err)
    return []
  }
}

export async function sendMedicineMessage(payload: {
  conversation_id: string
  message: string
}): Promise<DBMedicineMessage | undefined> {
  try {
    const { data: sessionData, error: sessionError } = await supabase.auth.getSession()
    if (sessionError) throw sessionError
    const user = sessionData.session?.user
    if (!user) throw new Error('Not authenticated')

    const insertPayload: any = {
      conversation_id: payload.conversation_id,
      sender_id: user.id,
      message: payload.message
    }

    const { data, error } = await supabase
      .from('medicine_messages')
      .insert(insertPayload)
      .select('*')
      .maybeSingle()
    if (error) throw error
    return (data || undefined) as any
  } catch (err) {
    console.error('Error sending medicine message:', err)
    return undefined
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

// Get user profile by ID (for chat display names)
// Note: Profiles table may not exist, returns null to trigger fallback
export async function getUserProfileById(_userId: string): Promise<{ email: string; name?: string } | null> {
  // Profiles table doesn't exist - return null to use fallback (email from conversation)
  return null
}

// Enhanced Medicine Chat with Images
export async function sendMedicineMessageWithImage(payload: {
  conversation_id: string
  message: string
  image_path?: string | null
  sender_name?: string
}): Promise<DBMedicineMessage | undefined> {
  try {
    const { data: sessionData, error: sessionError } = await supabase.auth.getSession()
    if (sessionError) throw sessionError
    const user = sessionData.session?.user
    if (!user) throw new Error('Not authenticated')

    const insertPayload: any = {
      conversation_id: payload.conversation_id,
      sender_id: user.id,
      sender_name: payload.sender_name || user.email?.split('@')[0] || 'User',
      message: payload.message?.trim() || null,
      image_path: payload.image_path || null,
      is_read: false
    }

    const { data, error } = await supabase
      .from('medicine_messages')
      .insert(insertPayload)
      .select('*')
      .maybeSingle()
    if (error) throw error
    return (data || undefined) as any
  } catch (err) {
    console.error('Error sending medicine message:', err)
    return undefined
  }
}

export async function uploadChatImage(file: File): Promise<string> {
  const { data: sessionData, error: sessionError } = await supabase.auth.getSession()
  if (sessionError) throw sessionError
  const user = sessionData.session?.user
  if (!user) throw new Error('Not authenticated')

  const safeName = (file.name || 'image').replace(/[^a-zA-Z0-9._-]+/g, '-')
  const path = `chat/${user.id}/${Date.now()}-${safeName}`

  const { error } = await supabase.storage.from('medicine-requests').upload(path, file, {
    upsert: false,
    contentType: file.type || undefined
  })
  if (error) throw error
  return path
}

export async function markMessagesAsRead(conversationId: string): Promise<boolean> {
  try {
    const { data: sessionData } = await supabase.auth.getSession()
    const userId = sessionData.session?.user?.id
    if (!userId) return false

    const { error } = await supabase
      .from('medicine_messages')
      .update({ is_read: true })
      .eq('conversation_id', conversationId)
      .neq('sender_id', userId)
      .eq('is_read', false)
    if (error) throw error
    return true
  } catch (err) {
    console.error('Error marking messages as read:', err)
    return false
  }
}

// Shipment Tracking
export async function markMedicineShipped(
  conversationId: string,
  trackingNumber?: string
): Promise<boolean> {
  try {
    const { data: sessionData, error: sessionError } = await supabase.auth.getSession()
    if (sessionError) throw sessionError
    const user = sessionData.session?.user
    if (!user) throw new Error('Not authenticated')

    const updatePayload: any = {
      shipment_status: 'shipped',
      shipped_at: new Date().toISOString(),
      tracking_number: trackingNumber || null
    }

    const { error } = await supabase
      .from('medicine_conversations')
      .update(updatePayload)
      .eq('id', conversationId)
      .eq('helper_id', user.id)
    if (error) throw error
    return true
  } catch (err) {
    console.error('Error marking medicine shipped:', err)
    return false
  }
}

export async function markMedicineReceived(conversationId: string): Promise<boolean> {
  try {
    const { data: sessionData, error: sessionError } = await supabase.auth.getSession()
    if (sessionError) throw sessionError
    const user = sessionData.session?.user
    if (!user) throw new Error('Not authenticated')

    const { error } = await supabase
      .from('medicine_conversations')
      .update({
        shipment_status: 'received',
        received_at: new Date().toISOString()
      })
      .eq('id', conversationId)
      .eq('requester_id', user.id)
    if (error) throw error
    return true
  } catch (err) {
    console.error('Error marking medicine received:', err)
    return false
  }
}

// Medicine Reviews
export async function submitMedicineReview(payload: {
  conversation_id: string
  requester_id: string
  helper_id: string
  rating: number
  comment: string
}): Promise<DBMedicineReview | undefined> {
  try {
    const { data: sessionData, error: sessionError } = await supabase.auth.getSession()
    if (sessionError) throw sessionError
    const user = sessionData.session?.user
    if (!user) throw new Error('Not authenticated')

    const insertPayload: any = {
      conversation_id: payload.conversation_id,
      requester_id: payload.requester_id,
      helper_id: payload.helper_id,
      rating: payload.rating,
      comment: payload.comment || null,
      is_active: true
    }

    const { data, error } = await supabase
      .from('medicine_reviews')
      .insert(insertPayload)
      .select('*')
      .maybeSingle()
    if (error) throw error

    // Complete the conversation
    await supabase
      .from('medicine_conversations')
      .update({
        is_active: false,
        completed_at: new Date().toISOString()
      })
      .eq('id', payload.conversation_id)

    return (data || undefined) as any
  } catch (err) {
    console.error('Error submitting medicine review:', err)
    return undefined
  }
}

export async function getMedicineReview(conversationId: string): Promise<DBMedicineReview | undefined> {
  try {
    const { data, error } = await supabase
      .from('medicine_reviews')
      .select('*')
      .eq('conversation_id', conversationId)
      .eq('is_active', true)
      .maybeSingle()
    if (error) throw error
    return (data || undefined) as any
  } catch (err) {
    console.error('Error fetching medicine review:', err)
    return undefined
  }
}

export async function getMedicineReviewsForUser(userId: string): Promise<DBMedicineReview[]> {
  try {
    const { data, error } = await supabase
      .from('medicine_reviews')
      .select('*')
      .or(`requester_id.eq.${userId},helper_id.eq.${userId}`)
      .eq('is_active', true)
      .order('created_at', { ascending: false })
    if (error) throw error
    return (data || []) as any
  } catch (err) {
    console.error('Error fetching medicine reviews for user:', err)
    return []
  }
}

// Admin: Get all medicine transactions with tracking
export async function getAllMedicineTransactions(): Promise<any[]> {
  try {
    const { data, error } = await supabase
      .from('medicine_conversations')
      .select(`
        *,
        medicine_requests (id, title, medicine_name, user_id),
        medicine_reviews (rating, comment)
      `)
      .order('created_at', { ascending: false })
    if (error) throw error
    return data || []
  } catch (err) {
    console.error('Error fetching medicine transactions:', err)
    return []
  }
}

// Real-time subscriptions
export function subscribeToMessages(
  conversationId: string,
  callback: (payload: any) => void
) {
  return supabase
    .channel(`messages:${conversationId}`)
    .on(
      'postgres_changes',
      {
        event: 'INSERT',
        schema: 'public',
        table: 'medicine_messages',
        filter: `conversation_id=eq.${conversationId}`
      },
      callback
    )
    .subscribe()
}

export function subscribeToConversation(
  conversationId: string,
  callback: (payload: any) => void
) {
  return supabase
    .channel(`conversation:${conversationId}`)
    .on(
      'postgres_changes',
      {
        event: 'UPDATE',
        schema: 'public',
        table: 'medicine_conversations',
        filter: `id=eq.${conversationId}`
      },
      callback
    )
    .subscribe()
}

// Visitor Analytics Types
export interface AppVisit {
  id: string
  created_at: string
  path: string
  user_id: string | null
  session_id: string | null
  user_agent: string | null
  referrer: string | null
}

export interface VisitAnalytics {
  totalVisits: number
  uniqueVisitors: number
  loggedInVisits: number
  anonymousVisits: number
}

// Log a page visit
export async function logAppVisit(
  path: string,
  sessionId: string,
  userAgent?: string,
  referrer?: string
): Promise<boolean> {
  const { data: { session } } = await supabase.auth.getSession()
  const userId = session?.user?.id || null

  const { error } = await supabase.from('app_visits').insert({
    path,
    user_id: userId,
    session_id: sessionId,
    user_agent: userAgent?.slice(0, 500),
    referrer: referrer?.slice(0, 500)
  })

  if (error) {
    console.error('Error logging visit:', error)
    return false
  }
  return true
}

// Get visit analytics (admin only)
export async function getVisitAnalytics(
  startDate?: string,
  endDate?: string
): Promise<VisitAnalytics> {
  let query = supabase.from('app_visits').select('*')

  if (startDate) {
    query = query.gte('created_at', startDate)
  }
  if (endDate) {
    query = query.lte('created_at', endDate)
  }

  const { data, error } = await query

  if (error || !data) {
    console.error('Error fetching visit analytics:', error)
    return { totalVisits: 0, uniqueVisitors: 0, loggedInVisits: 0, anonymousVisits: 0 }
  }

  const totalVisits = data.length
  const uniqueSessions = new Set(data.map((v: AppVisit) => v.session_id).filter(Boolean)).size
  const loggedInVisits = data.filter((v: AppVisit) => v.user_id).length
  const anonymousVisits = totalVisits - loggedInVisits

  return {
    totalVisits,
    uniqueVisitors: uniqueSessions,
    loggedInVisits,
    anonymousVisits
  }
}

// Get recent visits with user emails (admin only)
export async function getRecentVisitsWithUsers(limit: number = 100): Promise<(AppVisit & { user_email?: string })[]> {
  const { data, error } = await supabase
    .rpc('get_visits_with_users', { limit_count: limit })

  if (error) {
    console.error('Error fetching visits with users:', error)
    return []
  }
  return data || []
}
export async function getDatabaseStats() {
  try {
    const [hospitalsCountResult, doctorsCountResult, specialtiesCountResult] = await Promise.all([
      supabase.from('hospitals').select('id', { count: 'exact', head: true }).eq('is_active', true),
      supabase.from('doctors').select('id', { count: 'exact', head: true }).eq('is_active', true),
      supabase.from('specialties').select('id', { count: 'exact', head: true })
    ])

    if (hospitalsCountResult.error || doctorsCountResult.error || specialtiesCountResult.error) {
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
    }

    return {
      total_facilities: hospitalsCountResult.count || 0,
      total_doctors: doctorsCountResult.count || 0,
      total_specialties: specialtiesCountResult.count || 0
    }
  } catch (err) {
    console.error('Error fetching database stats:', err)
    return { total_facilities: 0, total_doctors: 0, total_specialties: 0 }
  }
}

export async function getMyRideDriverProfile(): Promise<RideDriverProfile | null> {
  try {
    const { data: sessionData, error: sessionError } = await supabase.auth.getSession()
    if (sessionError) throw sessionError
    const user = sessionData.session?.user
    if (!user) throw new Error('Not authenticated')

    const { data, error } = await supabase
      .from('ride_driver_profiles')
      .select('*')
      .eq('user_id', user.id)
      .maybeSingle()
    if (error) throw error
    return (data || null) as any
  } catch (err) {
    console.error('Error fetching my ride driver profile:', err)
    return null
  }
}

export async function createRideDriverProfile(payload: {
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
  vehicle_image_path?: string | null
}): Promise<RideDriverProfile | undefined> {
  try {
    const { data: sessionData, error: sessionError } = await supabase.auth.getSession()
    if (sessionError) throw sessionError
    const user = sessionData.session?.user
    if (!user) throw new Error('Not authenticated')

    const insertPayload: any = {
      user_id: user.id,
      full_name: payload.full_name.trim(),
      phone: payload.phone.trim(),
      vehicle_type: payload.vehicle_type,
      vehicle_brand: payload.vehicle_brand.trim(),
      vehicle_color: payload.vehicle_color.trim(),
      vehicle_number: payload.vehicle_number.trim(),
      license_number: payload.license_number.trim(),
      annual_fee: typeof payload.annual_fee === 'number' ? payload.annual_fee : 0,
      driver_image_path: payload.driver_image_path || null,
      license_image_path: payload.license_image_path || null,
      vehicle_image_path: payload.vehicle_image_path || null,
      status: 'pending'
    }

    const { data, error } = await supabase
      .from('ride_driver_profiles')
      .insert(insertPayload)
      .select('*')
      .maybeSingle()
    if (error) throw error
    return (data || undefined) as any
  } catch (err) {
    console.error('Error creating ride driver profile:', err)
    return undefined
  }
}

export async function updateMyRideDriverProfile(payload: {
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
  vehicle_image_path?: string | null
}): Promise<RideDriverProfile | undefined> {
  try {
    const { data: sessionData, error: sessionError } = await supabase.auth.getSession()
    if (sessionError) throw sessionError
    const user = sessionData.session?.user
    if (!user) throw new Error('Not authenticated')

    const updatePayload: any = {
      full_name: payload.full_name.trim(),
      phone: payload.phone.trim(),
      vehicle_type: payload.vehicle_type,
      vehicle_brand: payload.vehicle_brand.trim(),
      vehicle_color: payload.vehicle_color.trim(),
      vehicle_number: payload.vehicle_number.trim(),
      license_number: payload.license_number.trim(),
      annual_fee: typeof payload.annual_fee === 'number' ? payload.annual_fee : 0
    }

    if (payload.driver_image_path !== undefined) updatePayload.driver_image_path = payload.driver_image_path
    if (payload.license_image_path !== undefined) updatePayload.license_image_path = payload.license_image_path
    if (payload.vehicle_image_path !== undefined) updatePayload.vehicle_image_path = payload.vehicle_image_path

    updatePayload.status = 'pending'
    updatePayload.rejection_reason = null
    updatePayload.suspended_reason = null
    updatePayload.suspended_at = null

    const { data, error } = await supabase
      .from('ride_driver_profiles')
      .update(updatePayload)
      .eq('user_id', user.id)
      .select('*')
      .maybeSingle()
    if (error) throw error
    return (data || undefined) as any
  } catch (err) {
    console.error('Error updating ride driver profile:', err)
    return undefined
  }
}

export async function createRideRequest(payload: {
  origin_text: string
  origin_lat?: number | null
  origin_lng?: number | null
  destination_text: string
  destination_lat?: number | null
  destination_lng?: number | null
  vehicle_type: RideVehicleType
  fare: number
}): Promise<RideRequest | undefined> {
  try {
    const { data: sessionData, error: sessionError } = await supabase.auth.getSession()
    if (sessionError) throw sessionError
    const user = sessionData.session?.user
    if (!user) throw new Error('Not authenticated')

    const { data, error } = await supabase
      .from('ride_requests')
      .insert({
        rider_user_id: user.id,
        origin_text: payload.origin_text.trim(),
        origin_lat: typeof payload.origin_lat === 'number' ? payload.origin_lat : null,
        origin_lng: typeof payload.origin_lng === 'number' ? payload.origin_lng : null,
        destination_text: payload.destination_text.trim(),
        destination_lat: typeof payload.destination_lat === 'number' ? payload.destination_lat : null,
        destination_lng: typeof payload.destination_lng === 'number' ? payload.destination_lng : null,
        vehicle_type: payload.vehicle_type,
        fare: typeof payload.fare === 'number' ? payload.fare : 0,
        status: 'open'
      })
      .select('*')
      .maybeSingle()
    if (error) throw error
    return (data || undefined) as any
  } catch (err) {
    console.error('Error creating ride request:', err)
    return undefined
  }
}

export async function cancelMyOpenRideRequest(): Promise<boolean> {
  try {
    const { data: sessionData, error: sessionError } = await supabase.auth.getSession()
    if (sessionError) throw sessionError
    const user = sessionData.session?.user
    if (!user) throw new Error('Not authenticated')

    const { error } = await supabase
      .from('ride_requests')
      .update({ status: 'cancelled' })
      .eq('rider_user_id', user.id)
      .eq('status', 'open')
    if (error) throw error
    return true
  } catch (err) {
    console.error('Error cancelling ride request:', err)
    return false
  }
}

export async function getMyLatestRideState(): Promise<{
  request: RideRequest | null
  trip: (RideTrip & { driver?: RideDriverProfile | null; request?: RideRequest | null }) | null
} | null> {
  try {
    const { data: sessionData, error: sessionError } = await supabase.auth.getSession()
    if (sessionError) throw sessionError
    const user = sessionData.session?.user
    if (!user) throw new Error('Not authenticated')

    const { data: req, error: reqError } = await supabase
      .from('ride_requests')
      .select('*')
      .eq('rider_user_id', user.id)
      .in('status', ['open', 'matched'])
      .order('created_at', { ascending: false })
      .limit(1)
      .maybeSingle()
    if (reqError) throw reqError
    if (!req?.id) return { request: null, trip: null }

    const { data: trip, error: tripError } = await supabase
      .from('ride_trips')
      .select('*')
      .eq('request_id', req.id)
      .maybeSingle()
    if (tripError) throw tripError

    let driver: RideDriverProfile | null = null
    if (trip?.driver_user_id) {
      const { data: d, error: dErr } = await supabase
        .from('ride_driver_profiles')
        .select('*')
        .eq('user_id', trip.driver_user_id)
        .maybeSingle()
      if (!dErr) driver = (d || null) as any
    }

    return {
      request: (req || null) as any,
      trip: trip ? ({ ...(trip as any), driver, request: req } as any) : null
    }
  } catch (err) {
    console.error('Error getting ride state:', err)
    return null
  }
}

export async function getDriverOpenRideRequests(vehicleType: string): Promise<RideRequest[]> {
  try {
    const { data, error } = await supabase
      .from('ride_requests')
      .select('*')
      .eq('status', 'open')
      .eq('vehicle_type', vehicleType)
      .order('created_at', { ascending: false })
    if (error) throw error
    return (data || []) as any
  } catch (err) {
    console.error('Error listing open ride requests:', err)
    return []
  }
}

export async function acceptRideRequest(requestId: string): Promise<RideTrip | undefined> {
  try {
    const { data: sessionData, error: sessionError } = await supabase.auth.getSession()
    if (sessionError) throw sessionError
    const user = sessionData.session?.user
    if (!user) throw new Error('Not authenticated')

    const { data: request, error: reqError } = await supabase
      .from('ride_requests')
      .select('*')
      .eq('id', requestId)
      .maybeSingle()
    if (reqError) throw reqError
    if (!request?.id) throw new Error('Request not found')
    if (String(request.status) !== 'open') throw new Error('Request is not available')

    const { error: updError } = await supabase
      .from('ride_requests')
      .update({ status: 'matched' })
      .eq('id', requestId)
      .eq('status', 'open')
    if (updError) throw updError

    const { data: trip, error: tripError } = await supabase
      .from('ride_trips')
      .insert({
        request_id: requestId,
        driver_user_id: user.id,
        status: 'accepted',
        amount: request.fare || 0
      })
      .select('*')
      .maybeSingle()
    if (tripError) throw tripError
    return (trip || undefined) as any
  } catch (err) {
    console.error('Error accepting ride request:', err)
    return undefined
  }
}

export async function getDriverActiveTrip(): Promise<(RideTrip & { request?: RideRequest | null }) | null> {
  try {
    const { data: sessionData, error: sessionError } = await supabase.auth.getSession()
    if (sessionError) throw sessionError
    const user = sessionData.session?.user
    if (!user) throw new Error('Not authenticated')

    const { data: trip, error } = await supabase
      .from('ride_trips')
      .select('*')
      .eq('driver_user_id', user.id)
      .in('status', ['accepted', 'arrived', 'started'])
      .order('accepted_at', { ascending: false })
      .limit(1)
      .maybeSingle()
    if (error) throw error
    if (!trip?.id) return null

    const { data: req, error: reqError } = await supabase
      .from('ride_requests')
      .select('*')
      .eq('id', trip.request_id)
      .maybeSingle()
    if (reqError) throw reqError

    return ({ ...(trip as any), request: req || null } as any)
  } catch (err) {
    console.error('Error getting driver active trip:', err)
    return null
  }
}

export async function markRideTripEnRoute(tripId: string): Promise<boolean> {
  try {
    const now = new Date().toISOString()
    const { error } = await supabase
      .from('ride_trips')
      .update({ en_route_at: now })
      .eq('id', tripId)
      .is('en_route_at', null)
    if (error) throw error
    return true
  } catch (err) {
    console.error('Error marking trip en-route:', err)
    return false
  }
}

export async function updateRideTripStatus(
  tripId: string,
  status: 'arrived' | 'started' | 'finished' | 'cancelled',
  extra?: {
    cash_paid?: boolean
    amount?: number
    rider_rating?: number
    rider_rating_comment?: string
  }
): Promise<boolean> {
  try {
    const payload: any = { status }
    const now = new Date().toISOString()
    if (status === 'arrived') payload.arrived_at = now
    if (status === 'started') payload.started_at = now
    if (status === 'finished') payload.finished_at = now
    if (typeof extra?.cash_paid === 'boolean') payload.cash_paid = extra.cash_paid
    if (typeof extra?.amount === 'number') payload.amount = extra.amount
    if (typeof extra?.rider_rating === 'number') payload.rider_rating = extra.rider_rating
    if (typeof extra?.rider_rating_comment === 'string') payload.rider_rating_comment = extra.rider_rating_comment

    const { error } = await supabase
      .from('ride_trips')
      .update(payload)
      .eq('id', tripId)
    if (error) throw error
    return true
  } catch (err) {
    console.error('Error updating ride trip status:', err)
    return false
  }
}
