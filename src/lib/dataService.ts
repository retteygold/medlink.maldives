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
