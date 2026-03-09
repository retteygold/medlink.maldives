import { useEffect, useMemo, useRef, useState } from 'react'
import { useNavigate, useParams } from 'react-router-dom'
import { 
  Send, 
  Image as ImageIcon, 
  Check, 
  CheckCheck,
  Truck,
  Star,
  X,
  ChevronLeft,
  MoreVertical,
  Clock
} from 'lucide-react'
import { usePushNotifications } from '../hooks/usePushNotifications'
import { supabase } from '../lib/supabase'
import {
  getUserProfileById,
  createOrGetMedicineConversation,
  getMedicineRequestById,
  getSignedMedicineRequestImageUrl,
  listMedicineConversationsForRequest,
  listMedicineMessages,
  sendMedicineMessageWithImage,
  uploadChatImage,
  markMessagesAsRead,
  markMedicineShipped,
  markMedicineReceived,
  submitMedicineReview,
  getMedicineReview,
  subscribeToMessages,
  subscribeToConversation
} from '../lib/dataService'

type MedicineRequest = {
  id: string
  created_at: string
  user_id: string
  title?: string
  medicine_name?: string
  dosage?: string
  quantity?: number
  needed_by?: string
  notes?: string
  location_type?: string
  atoll?: string
  status: 'open' | 'in_progress' | 'shipped' | 'received' | 'completed' | 'cancelled'
  prescription_image_path?: string | null
  previous_medicine_image_path?: string | null
}

type MedicineConversation = {
  id: string
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

type MedicineMessage = {
  id: string
  created_at: string
  conversation_id: string
  sender_id: string
  sender_name: string | null
  message: string
  image_path: string | null
  is_read: boolean
}

type MedicineReview = {
  id: string
  rating: number
  comment: string | null
  created_at: string
}

export default function MedicineHelpDetailPage() {
  const { id } = useParams<{ id: string }>()
  const navigate = useNavigate()
  const messagesEndRef = useRef<HTMLDivElement>(null)
  const fileInputRef = useRef<HTMLInputElement>(null)

  const [loading, setLoading] = useState(true)
  const [meId, setMeId] = useState<string>('')
  const [myEmail, setMyEmail] = useState<string>('')

  const [request, setRequest] = useState<MedicineRequest | null>(null)
  const [prescriptionUrl, setPrescriptionUrl] = useState<string | null>(null)
  const [, setPreviousUrl] = useState<string | null>(null)
  const [, setConversations] = useState<MedicineConversation[]>([])
  const [activeConversation, setActiveConversation] = useState<MedicineConversation | null>(null)
  const [otherUserProfile, setOtherUserProfile] = useState<{email: string; name?: string} | null>(null)
  const [messages, setMessages] = useState<MedicineMessage[]>([])
  const [draft, setDraft] = useState('')
  const [error, setError] = useState<string | null>(null)
  const [sendingImage, setSendingImage] = useState(false)

  // Shipment tracking
  const [showShipModal, setShowShipModal] = useState(false)
  const [trackingNumber, setTrackingNumber] = useState('')
  const [shipmentLoading, setShipmentLoading] = useState(false)

  // Review
  const [showReviewModal, setShowReviewModal] = useState(false)
  const [reviewRating, setReviewRating] = useState(5)
  const [reviewComment, setReviewComment] = useState('')
  const [reviewLoading, setReviewLoading] = useState(false)
  const [existingReview, setExistingReview] = useState<MedicineReview | null>(null)

  // Push notifications
  const { showNotification } = usePushNotifications(!!activeConversation?.id)
  const messageSubscriptionRef = useRef<any>(null)
  const conversationSubscriptionRef = useRef<any>(null)

  useEffect(() => {
    load()
  }, [id])

  useEffect(() => {
    if (activeConversation?.id) {
      setupRealtimeSubscriptions()
      markMessagesAsRead(activeConversation.id)
    }
    return () => {
      cleanupSubscriptions()
    }
  }, [activeConversation?.id])

  useEffect(() => {
    scrollToBottom()
  }, [messages])

  function scrollToBottom() {
    messagesEndRef.current?.scrollIntoView({ behavior: 'smooth' })
  }

  function cleanupSubscriptions() {
    if (messageSubscriptionRef.current) {
      supabase.removeChannel(messageSubscriptionRef.current)
    }
    if (conversationSubscriptionRef.current) {
      supabase.removeChannel(conversationSubscriptionRef.current)
    }
  }

  function setupRealtimeSubscriptions() {
    cleanupSubscriptions()

    if (!activeConversation?.id) return

    messageSubscriptionRef.current = subscribeToMessages(
      activeConversation.id,
      (payload) => {
        const newMessage = payload.new as MedicineMessage
        setMessages((prev) => {
          if (prev.find(m => m.id === newMessage.id)) return prev
          return [...prev, newMessage]
        })
        if (newMessage.sender_id !== meId) {
          markMessagesAsRead(activeConversation.id)
          // Show push notification for new message
          showNotification(
            newMessage.sender_name || 'New Message',
            {
              body: newMessage.message || 'Sent an image',
              tag: `msg-${newMessage.id}`,
              data: { conversationId: activeConversation.id }
            }
          )
        }
      }
    )

    conversationSubscriptionRef.current = subscribeToConversation(
      activeConversation.id,
      (payload) => {
        const updated = payload.new as MedicineConversation
        const oldStatus = activeConversation.shipment_status
        const newStatus = updated.shipment_status
        
        // Show notification for shipment updates
        if (oldStatus !== newStatus) {
          if (newStatus === 'shipped' && !isHelper) {
            showNotification('Medicine Shipped!', {
              body: updated.tracking_number 
                ? `Tracking: ${updated.tracking_number}` 
                : 'Your medicine has been shipped',
              tag: 'shipment-update'
            })
          } else if (newStatus === 'received' && isHelper) {
            showNotification('Medicine Received', {
              body: 'The requester has received the medicine',
              tag: 'shipment-update'
            })
          }
        }
        
        setActiveConversation(updated)
        setConversations(prev => 
          prev.map(c => c.id === updated.id ? updated : c)
        )
      }
    )
  }

  async function load() {
    if (!id) return
    setLoading(true)
    setError(null)

    try {
      const { data } = await supabase.auth.getSession()
      const session = data.session
      const uid = session?.user?.id || ''
      const email = session?.user?.email || ''
      setMeId(uid)
      setMyEmail(email)

      const req = await getMedicineRequestById(id)
      setRequest(req as any)

      if (req?.prescription_image_path) {
        const url = await getSignedMedicineRequestImageUrl(req.prescription_image_path)
        setPrescriptionUrl(url)
      }

      if (req?.previous_medicine_image_path) {
        const url = await getSignedMedicineRequestImageUrl(req.previous_medicine_image_path)
        setPreviousUrl(url)
      }

      const convs = await listMedicineConversationsForRequest(id)
      setConversations(convs as any)

      const mine = (convs as any[]).find((c) => c.requester_id === uid || c.helper_id === uid) || null
      setActiveConversation(mine)

      // Fetch other user's profile for display name
      if (mine) {
        const otherId = mine.requester_id === uid ? mine.helper_id : mine.requester_id
        const profile = await getUserProfileById(otherId)
        setOtherUserProfile(profile)
      }

      if (mine?.id) {
        const msgs = await listMedicineMessages(mine.id)
        setMessages(msgs as any)
        
        const review = await getMedicineReview(mine.id)
        setExistingReview(review as any)
        
        await markMessagesAsRead(mine.id)
      }
    } catch (err: any) {
      setError(err?.message || 'Failed to load')
    } finally {
      setLoading(false)
    }
  }

  const isOwner = useMemo(() => {
    if (!request?.user_id || !meId) return false
    return request.user_id === meId
  }, [meId, request?.user_id])

  const isHelper = useMemo(() => {
    if (!activeConversation || !meId) return false
    return activeConversation.helper_id === meId
  }, [activeConversation, meId])

  const otherUserName = useMemo(() => {
    // First check messages for other user's sender_name
    const otherUserMessage = messages.find(m => m.sender_id !== meId && m.sender_name)
    if (otherUserMessage?.sender_name) return otherUserMessage.sender_name
    // Then check profile
    if (otherUserProfile?.name) return otherUserProfile.name
    if (otherUserProfile?.email) return otherUserProfile.email.split('@')[0]
    // Fallback to ID slice
    if (!activeConversation || !meId) return 'User'
    const otherId = activeConversation.requester_id === meId 
      ? activeConversation.helper_id 
      : activeConversation.requester_id
    return otherId.slice(0, 8) + '...'
  }, [activeConversation, meId, otherUserProfile, messages])

  async function startConversation() {
    if (!request?.id || !request.user_id) return
    if (!meId) return
    if (meId === request.user_id) return

    setError(null)
    const conv = await createOrGetMedicineConversation({
      request_id: request.id,
      requester_id: request.user_id,
      helper_id: meId
    })

    if (!conv?.id) {
      setError('Failed to start chat')
      return
    }

    setActiveConversation(conv as any)
    const convs = await listMedicineConversationsForRequest(request.id)
    setConversations(convs as any)
  }

  async function onSend(e?: React.FormEvent) {
    e?.preventDefault()
    const text = (draft || '').trim()
    if (!text && !sendingImage) return
    if (!activeConversation?.id) return

    setDraft('')
    
    const sent = await sendMedicineMessageWithImage({
      conversation_id: activeConversation.id,
      message: text,
      sender_name: myEmail.split('@')[0]
    })

    if (!sent?.id) {
      setError('Failed to send message')
      return
    }

    setMessages(prev => [...prev, sent as MedicineMessage])
  }

  async function onImageSelect(e: React.ChangeEvent<HTMLInputElement>) {
    const file = e.target.files?.[0]
    if (!file || !activeConversation?.id) return

    setSendingImage(true)
    setError(null)

    try {
      const imagePath = await uploadChatImage(file)
      const imageUrl = await getSignedMedicineRequestImageUrl(imagePath)
      const sent = await sendMedicineMessageWithImage({
        conversation_id: activeConversation.id,
        message: '',
        image_path: imageUrl,
        sender_name: myEmail.split('@')[0]
      })

      if (sent?.id) {
        setMessages(prev => [...prev, sent as MedicineMessage])
      }
    } catch (err: any) {
      setError(err?.message || 'Failed to send image')
    } finally {
      setSendingImage(false)
      if (fileInputRef.current) {
        fileInputRef.current.value = ''
      }
    }
  }

  async function handleMarkShipped() {
    if (!activeConversation?.id) return
    setShipmentLoading(true)
    setError(null)

    const success = await markMedicineShipped(activeConversation.id, trackingNumber)
    if (success) {
      setShowShipModal(false)
      setTrackingNumber('')
      const convs = await listMedicineConversationsForRequest(request!.id)
      setConversations(convs as any)
      const updated = convs.find((c: any) => c.id === activeConversation.id)
      if (updated) setActiveConversation(updated as any)
    } else {
      setError('Failed to mark as shipped')
    }
    setShipmentLoading(false)
  }

  async function handleMarkReceived() {
    if (!activeConversation?.id) return
    setShipmentLoading(true)
    setError(null)

    const success = await markMedicineReceived(activeConversation.id)
    if (success) {
      const convs = await listMedicineConversationsForRequest(request!.id)
      setConversations(convs as any)
      const updated = convs.find((c: any) => c.id === activeConversation.id)
      if (updated) setActiveConversation(updated as any)
      setShowReviewModal(true)
    } else {
      setError('Failed to mark as received')
    }
    setShipmentLoading(false)
  }

  async function handleSubmitReview() {
    if (!activeConversation?.id || !request) return
    setReviewLoading(true)
    setError(null)

    const success = await submitMedicineReview({
      conversation_id: activeConversation.id,
      requester_id: activeConversation.requester_id,
      helper_id: activeConversation.helper_id,
      rating: reviewRating,
      comment: reviewComment
    })

    if (success) {
      setShowReviewModal(false)
      setExistingReview(success as any)
      await load()
    } else {
      setError('Failed to submit review')
    }
    setReviewLoading(false)
  }

  if (loading) {
    return (
      <div className="min-h-screen bg-[#f0f2f5] flex flex-col items-center justify-center px-4">
        <img src="/images/storyset/Researchers-pana.svg" alt="Loading" className="w-64 h-64 object-contain" />
        <p className="text-gray-600 mt-2">Loading...</p>
      </div>
    )
  }

  if (!request) {
    return (
      <div className="min-h-screen bg-[#f0f2f5] flex flex-col items-center justify-center px-4">
        <img src="/images/storyset/Doctors-rafiki.svg" alt="Not found" className="w-64 h-64 object-contain" />
        <p className="text-gray-700 font-medium mt-2">Request not found</p>
        <button className="btn-primary mt-4 w-full" onClick={() => navigate('/medicine-help')}>Back to list</button>
      </div>
    )
  }

  return (
    <div className="min-h-screen bg-[#f0f2f5] pb-4">
      {/* WhatsApp-style Header */}
      <div className="bg-medical-600 text-white px-4 pt-12 pb-4 sticky top-0 z-50">
        <div className="flex items-center justify-between">
          <button onClick={() => navigate(-1)} className="p-2 -ml-2 hover:bg-white/10 rounded-full">
            <ChevronLeft size={24} />
          </button>
          
          <div className="flex items-center gap-3 flex-1 ml-3">
            <div className="w-10 h-10 bg-white/20 rounded-full flex items-center justify-center">
              <span className="text-white font-bold">{otherUserName.charAt(0).toUpperCase()}</span>
            </div>
            <div className="flex-1 min-w-0">
              <h1 className="font-semibold truncate">{otherUserName}</h1>
              <p className="text-xs text-white/80">{activeConversation?.is_active ? 'Active' : 'Completed'}</p>
            </div>
          </div>

          <button className="p-2 hover:bg-white/10 rounded-full"><MoreVertical size={20} /></button>
        </div>
      </div>

      {/* Medicine Info Card */}
      <div className="px-4 py-3">
        <div className="bg-white rounded-xl shadow-sm p-4">
          <div className="flex items-start gap-3">
            <div className="flex-1 min-w-0">
              <h2 className="font-semibold text-gray-800 truncate">{request.title || request.medicine_name || 'Medicine Request'}</h2>
              <p className="text-sm text-gray-500 mt-1">{[request.medicine_name, request.dosage].filter(Boolean).join(' · ')}</p>
              <div className="flex items-center gap-2 mt-2">
                <span className={`text-xs px-2 py-1 rounded-full font-medium ${
                  request.status === 'open' ? 'bg-green-100 text-green-700' :
                  request.status === 'in_progress' ? 'bg-yellow-100 text-yellow-700' :
                  request.status === 'shipped' ? 'bg-blue-100 text-blue-700' :
                  request.status === 'received' ? 'bg-purple-100 text-purple-700' :
                  request.status === 'completed' ? 'bg-gray-200 text-gray-700' :
                  'bg-red-100 text-red-700'
                }`}>{request.status}</span>
                <span className="text-xs text-gray-400">{request.location_type}</span>
              </div>
            </div>
            {prescriptionUrl && (
              <a href={prescriptionUrl} target="_blank" rel="noopener noreferrer" className="w-12 h-12 rounded-lg bg-gray-100 overflow-hidden flex-shrink-0">
                <img src={prescriptionUrl} alt="Rx" className="w-full h-full object-cover" />
              </a>
            )}
          </div>
        </div>
      </div>

      {/* Shipment Tracking Bar */}
      {activeConversation && (
        <div className="px-4 mb-3">
          <div className="bg-white rounded-xl shadow-sm p-4">
            <div className="flex items-center justify-between">
              <div className="flex items-center gap-3">
                <div className={`w-10 h-10 rounded-full flex items-center justify-center ${
                  activeConversation.shipment_status === 'shipped' || activeConversation.shipment_status === 'received'
                    ? 'bg-blue-100 text-blue-600' : 'bg-gray-100 text-gray-400'
                }`}>
                  <Truck size={20} />
                </div>
                <div>
                  <p className="font-medium text-sm">
                    {activeConversation.shipment_status === 'none' && 'Not shipped yet'}
                    {activeConversation.shipment_status === 'shipped' && 'Medicine shipped'}
                    {activeConversation.shipment_status === 'received' && 'Medicine received'}
                  </p>
                  {activeConversation.tracking_number && (
                    <p className="text-xs text-gray-500">Tracking: {activeConversation.tracking_number}</p>
                  )}
                </div>
              </div>

              <div className="flex gap-2">
                {isHelper && activeConversation.shipment_status === 'none' && (
                  <button onClick={() => setShowShipModal(true)} className="px-3 py-1.5 bg-blue-500 text-white text-sm rounded-lg hover:bg-blue-600">Mark Shipped</button>
                )}
                {isOwner && activeConversation.shipment_status === 'shipped' && (
                  <button onClick={handleMarkReceived} disabled={shipmentLoading} className="px-3 py-1.5 bg-green-500 text-white text-sm rounded-lg hover:bg-green-600 disabled:opacity-50">
                    {shipmentLoading ? 'Processing...' : 'Mark Received'}
                  </button>
                )}
              </div>
            </div>
          </div>
        </div>
      )}

      {/* Chat Area */}
      <div className="px-4 flex-1">
        <div className="bg-white rounded-xl shadow-sm overflow-hidden">
          {/* Messages */}
          <div className="p-4 space-y-3 max-h-[500px] overflow-y-auto min-h-[300px]">
            {!activeConversation ? (
              <div className="text-center py-12">
                {!isOwner ? (
                  <button onClick={startConversation} className="btn-primary inline-flex items-center gap-2">
                    <Send size={18} /> Start Conversation
                  </button>
                ) : (
                  <p className="text-gray-500">Wait for someone to offer help...</p>
                )}
              </div>
            ) : (
              <>
                {messages.map((m, idx) => {
                  const isMe = m.sender_id === meId
                  const showAvatar = idx === 0 || messages[idx - 1].sender_id !== m.sender_id
                  
                  return (
                    <div key={m.id} className={`flex ${isMe ? 'justify-end' : 'justify-start'} gap-2`}>
                      {!isMe && showAvatar && (
                        <div className="w-8 h-8 bg-gray-200 rounded-full flex items-center justify-center flex-shrink-0">
                          <span className="text-xs font-bold text-gray-600">{(m.sender_name || 'U').charAt(0).toUpperCase()}</span>
                        </div>
                      )}
                      {!isMe && !showAvatar && <div className="w-8" />}
                      
                      <div className={`max-w-[75%] ${isMe ? 'items-end' : 'items-start'}`}>
                        {showAvatar && !isMe && (
                          <p className="text-xs text-gray-500 mb-1 ml-1">{m.sender_name || 'User'}</p>
                        )}
                        <div className={`rounded-2xl px-4 py-2.5 ${
                          isMe ? 'bg-medical-500 text-white rounded-br-none' : 'bg-gray-100 text-gray-800 rounded-bl-none'
                        }`}>
                          {m.image_path && (
                            <img src={m.image_path} alt="Shared" className="max-w-full rounded-lg mb-1 max-h-48 object-cover" />
                          )}
                          {m.message && <p className="text-sm">{m.message}</p>}
                        </div>
                        <div className={`flex items-center gap-1 mt-1 ${isMe ? 'justify-end' : 'justify-start'}`}>
                          <span className="text-xs text-gray-400">
                            {new Date(m.created_at).toLocaleTimeString([], { hour: '2-digit', minute: '2-digit' })}
                          </span>
                          {isMe && (
                            m.is_read ? <CheckCheck size={14} className="text-blue-500" /> : <Check size={14} className="text-gray-400" />
                          )}
                        </div>
                      </div>
                    </div>
                  )
                })}
                <div ref={messagesEndRef} />
              </>
            )}
          </div>

          {/* Input Area */}
          {activeConversation?.is_active && (
            <div className="border-t border-gray-100 p-3">
              {error && <div className="mb-2 bg-red-50 text-red-700 text-sm rounded-lg p-2">{error}</div>}
              
              <form onSubmit={onSend} className="flex items-center gap-2">
                <input type="file" accept="image/*" ref={fileInputRef} onChange={onImageSelect} className="hidden" />
                <button type="button" onClick={() => fileInputRef.current?.click()} disabled={sendingImage} className="p-2.5 text-gray-500 hover:bg-gray-100 rounded-full">
                  {sendingImage ? <Clock size={22} className="animate-spin" /> : <ImageIcon size={22} />}
                </button>
                
                <input type="text" value={draft} onChange={(e) => setDraft(e.target.value)} placeholder="Type a message..." className="flex-1 bg-gray-100 rounded-full px-4 py-2.5 text-sm outline-none focus:ring-2 focus:ring-medical-500" />
                
                <button type="submit" disabled={!draft.trim() && !sendingImage} className="p-2.5 bg-medical-500 text-white rounded-full hover:bg-medical-600 disabled:opacity-50">
                  <Send size={20} />
                </button>
              </form>
            </div>
          )}

          {/* Review Section */}
          {existingReview && (
            <div className="border-t border-gray-100 p-4 bg-yellow-50">
              <div className="flex items-center gap-2 mb-2">
                <Star size={16} className="text-yellow-500 fill-yellow-500" />
                <span className="font-medium">Review Submitted</span>
              </div>
              <div className="flex items-center gap-1 mb-2">
                {[...Array(5)].map((_, i) => (
                  <Star key={i} size={16} className={i < existingReview.rating ? 'text-yellow-500 fill-yellow-500' : 'text-gray-300'} />
                ))}
              </div>
              {existingReview.comment && <p className="text-sm text-gray-700 italic">"{existingReview.comment}"</p>}
            </div>
          )}

          {!activeConversation?.is_active && !existingReview && (
            <div className="border-t border-gray-100 p-4 text-center text-gray-500">This conversation has ended.</div>
          )}
        </div>
      </div>

      {/* Ship Modal */}
      {showShipModal && (
        <div className="fixed inset-0 bg-black/50 flex items-center justify-center z-50 p-4">
          <div className="bg-white rounded-2xl p-6 w-full max-w-sm">
            <div className="flex items-center justify-between mb-4">
              <h3 className="font-bold text-lg">Mark as Shipped</h3>
              <button onClick={() => setShowShipModal(false)} className="p-1 hover:bg-gray-100 rounded-full"><X size={20} /></button>
            </div>
            <p className="text-gray-600 text-sm mb-4">Enter tracking number (optional) and confirm medicine has been shipped.</p>
            <input type="text" value={trackingNumber} onChange={(e) => setTrackingNumber(e.target.value)} placeholder="Tracking number (optional)" className="input-field w-full mb-4" />
            <div className="flex gap-2">
              <button onClick={() => setShowShipModal(false)} className="flex-1 py-2.5 border border-gray-300 rounded-xl font-medium">Cancel</button>
              <button onClick={handleMarkShipped} disabled={shipmentLoading} className="flex-1 py-2.5 bg-blue-500 text-white rounded-xl font-medium disabled:opacity-50">
                {shipmentLoading ? 'Processing...' : 'Confirm Shipped'}
              </button>
            </div>
          </div>
        </div>
      )}

      {/* Review Modal */}
      {showReviewModal && (
        <div className="fixed inset-0 bg-black/50 flex items-center justify-center z-50 p-4">
          <div className="bg-white rounded-2xl p-6 w-full max-w-sm">
            <div className="flex items-center justify-between mb-4">
              <h3 className="font-bold text-lg">Rate Your Experience</h3>
              <button onClick={() => setShowReviewModal(false)} className="p-1 hover:bg-gray-100 rounded-full"><X size={20} /></button>
            </div>
            <p className="text-gray-600 text-sm mb-4">Please rate the medicine provider and leave a comment.</p>
            
            <div className="flex justify-center gap-2 mb-4">
              {[1, 2, 3, 4, 5].map((star) => (
                <button key={star} onClick={() => setReviewRating(star)} className="p-1">
                  <Star size={28} className={star <= reviewRating ? 'text-yellow-500 fill-yellow-500' : 'text-gray-300'} />
                </button>
              ))}
            </div>
            
            <textarea value={reviewComment} onChange={(e) => setReviewComment(e.target.value)} placeholder="Write your review..." rows={3} className="input-field w-full mb-4 resize-none" />
            
            <div className="flex gap-2">
              <button onClick={() => setShowReviewModal(false)} className="flex-1 py-2.5 border border-gray-300 rounded-xl font-medium">Skip</button>
              <button onClick={handleSubmitReview} disabled={reviewLoading} className="flex-1 py-2.5 bg-medical-500 text-white rounded-xl font-medium disabled:opacity-50">
                {reviewLoading ? 'Submitting...' : 'Submit Review'}
              </button>
            </div>
          </div>
        </div>
      )}
    </div>
  )
}
