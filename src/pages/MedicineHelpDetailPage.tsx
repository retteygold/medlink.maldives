import { useEffect, useMemo, useState } from 'react'
import { useNavigate, useParams } from 'react-router-dom'
import { ChevronLeft, MessageCircle, Send, Image as ImageIcon } from 'lucide-react'
import { supabase } from '../lib/supabase'
import {
  createOrGetMedicineConversation,
  getMedicineRequestById,
  getSignedMedicineRequestImageUrl,
  listMedicineConversationsForRequest,
  listMedicineMessages,
  sendMedicineMessage
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
  status: 'open' | 'in_progress' | 'fulfilled' | 'cancelled'
  prescription_image_path?: string | null
  previous_medicine_image_path?: string | null
}

type MedicineConversation = {
  id: string
  request_id: string
  requester_id: string
  helper_id: string
}

type MedicineMessage = {
  id: string
  created_at: string
  conversation_id: string
  sender_id: string
  message: string
}

export default function MedicineHelpDetailPage() {
  const { id } = useParams<{ id: string }>()
  const navigate = useNavigate()

  const [loading, setLoading] = useState(true)
  const [meId, setMeId] = useState<string>('')

  const [request, setRequest] = useState<MedicineRequest | null>(null)
  const [prescriptionUrl, setPrescriptionUrl] = useState<string | null>(null)
  const [previousUrl, setPreviousUrl] = useState<string | null>(null)

  const [conversations, setConversations] = useState<MedicineConversation[]>([])
  const [activeConversation, setActiveConversation] = useState<MedicineConversation | null>(null)
  const [messages, setMessages] = useState<MedicineMessage[]>([])
  const [draft, setDraft] = useState('')
  const [error, setError] = useState<string | null>(null)

  useEffect(() => {
    load()
  }, [id])

  async function load() {
    if (!id) return
    setLoading(true)
    setError(null)

    const { data } = await supabase.auth.getSession()
    const session = data.session
    const uid = session?.user?.id || ''
    setMeId(uid)

    const req = await getMedicineRequestById(id)
    setRequest(req as any)

    if (req?.prescription_image_path) {
      const url = await getSignedMedicineRequestImageUrl(req.prescription_image_path)
      setPrescriptionUrl(url)
    } else {
      setPrescriptionUrl(null)
    }

    if (req?.previous_medicine_image_path) {
      const url = await getSignedMedicineRequestImageUrl(req.previous_medicine_image_path)
      setPreviousUrl(url)
    } else {
      setPreviousUrl(null)
    }

    const convs = await listMedicineConversationsForRequest(id)
    setConversations(convs as any)

    const mine = (convs as any[]).find((c) => c.requester_id === uid || c.helper_id === uid) || null
    setActiveConversation(mine)
    setLoading(false)
  }

  useEffect(() => {
    if (!activeConversation?.id) {
      setMessages([])
      return
    }
    loadMessages(activeConversation.id)
  }, [activeConversation?.id])

  async function loadMessages(conversationId: string) {
    const msgs = await listMedicineMessages(conversationId)
    setMessages(msgs as any)
  }

  const isOwner = useMemo(() => {
    if (!request?.user_id || !meId) return false
    return request.user_id === meId
  }, [meId, request?.user_id])

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

  async function onSend(e: React.FormEvent) {
    e.preventDefault()
    const text = (draft || '').trim()
    if (!text) return
    if (!activeConversation?.id) return

    setDraft('')
    const sent = await sendMedicineMessage({
      conversation_id: activeConversation.id,
      message: text
    })

    if (!sent?.id) {
      setError('Failed to send message')
      return
    }

    await loadMessages(activeConversation.id)
  }

  if (loading) {
    return (
      <div className="min-h-screen bg-gray-50 flex items-center justify-center">
        <p className="text-gray-500">Loading...</p>
      </div>
    )
  }

  if (!request) {
    return (
      <div className="min-h-screen bg-gray-50 flex items-center justify-center">
        <p className="text-gray-500">Request not found</p>
      </div>
    )
  }

  return (
    <div className="min-h-screen bg-gray-50 pb-24">
      <div className="bg-white px-4 pt-12 pb-4 shadow-sm">
        <div className="flex items-center gap-3">
          <button type="button" onClick={() => navigate(-1)} className="p-2 -ml-2">
            <ChevronLeft size={22} className="text-gray-600" />
          </button>
          <h1 className="text-xl font-bold text-gray-800">Request</h1>
        </div>
      </div>

      <div className="p-4 space-y-4">
        {error && <div className="bg-red-50 border border-red-200 text-red-700 rounded-xl p-3 text-sm">{error}</div>}

        <div className="card p-4">
          <div className="flex items-start justify-between gap-3">
            <div className="min-w-0">
              <div className="font-bold text-gray-800 truncate">{request.title || request.medicine_name || 'Medicine request'}</div>
              <div className="text-sm text-gray-600 mt-1">
                {[request.medicine_name, request.dosage].filter(Boolean).join(' · ')}
              </div>
              <div className="text-xs text-gray-500 mt-2">
                {[request.location_type, request.atoll].filter(Boolean).join(' · ')}
              </div>
              {request.notes && <div className="text-sm text-gray-700 mt-3 whitespace-pre-line">{request.notes}</div>}
            </div>
            <span className="text-xs px-2 py-0.5 rounded-full bg-gray-100 text-gray-700 font-medium">{request.status}</span>
          </div>

          {(prescriptionUrl || previousUrl) && (
            <div className="mt-4 grid grid-cols-2 gap-3">
              {prescriptionUrl && (
                <a href={prescriptionUrl} target="_blank" rel="noopener noreferrer" className="block">
                  <div className="w-full aspect-square bg-gray-100 rounded-xl overflow-hidden flex items-center justify-center">
                    <img src={prescriptionUrl} alt="Prescription" className="w-full h-full object-cover" />
                  </div>
                  <div className="text-xs text-gray-500 mt-1 flex items-center gap-1">
                    <ImageIcon size={14} /> Prescription
                  </div>
                </a>
              )}
              {previousUrl && (
                <a href={previousUrl} target="_blank" rel="noopener noreferrer" className="block">
                  <div className="w-full aspect-square bg-gray-100 rounded-xl overflow-hidden flex items-center justify-center">
                    <img src={previousUrl} alt="Medicine" className="w-full h-full object-cover" />
                  </div>
                  <div className="text-xs text-gray-500 mt-1 flex items-center gap-1">
                    <ImageIcon size={14} /> Medicine
                  </div>
                </a>
              )}
            </div>
          )}
        </div>

        {!isOwner && (
          <button type="button" onClick={startConversation} className="btn-primary w-full flex items-center justify-center gap-2">
            <MessageCircle size={18} /> Message requester
          </button>
        )}

        {isOwner && conversations.length > 0 && (
          <div className="card p-4">
            <div className="font-bold text-gray-800 mb-3">Chats</div>
            <div className="space-y-2">
              {conversations.map((c) => {
                const otherId = c.requester_id === meId ? c.helper_id : c.requester_id
                const active = activeConversation?.id === c.id
                return (
                  <button
                    key={c.id}
                    type="button"
                    onClick={() => setActiveConversation(c)}
                    className={`w-full text-left p-3 rounded-xl border ${active ? 'border-medical-500 bg-medical-50' : 'border-gray-200 bg-white'}`}
                  >
                    <div className="text-sm font-medium text-gray-800">Conversation</div>
                    <div className="text-xs text-gray-500">User: {otherId.slice(0, 8)}...</div>
                  </button>
                )
              })}
            </div>
          </div>
        )}

        {activeConversation?.id && (
          <div className="card p-4">
            <div className="font-bold text-gray-800 mb-3">Chat</div>
            <div className="space-y-2 max-h-80 overflow-auto">
              {messages.map((m) => (
                <div
                  key={m.id}
                  className={`p-3 rounded-xl text-sm ${m.sender_id === meId ? 'bg-medical-500 text-white ml-8' : 'bg-gray-100 text-gray-800 mr-8'}`}
                >
                  {m.message}
                </div>
              ))}
              {messages.length === 0 && <div className="text-sm text-gray-500">No messages yet.</div>}
            </div>

            <form onSubmit={onSend} className="mt-3 flex gap-2">
              <input
                className="input-field flex-1"
                value={draft}
                onChange={(e) => setDraft(e.target.value)}
                placeholder="Type a message..."
              />
              <button type="submit" className="btn-primary px-4" aria-label="Send">
                <Send size={18} />
              </button>
            </form>
          </div>
        )}
      </div>
    </div>
  )
}
