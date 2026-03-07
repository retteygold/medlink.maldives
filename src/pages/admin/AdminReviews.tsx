import { useState, useEffect } from 'react'
import { useNavigate } from 'react-router-dom'
import { 
  ArrowLeft, 
  Plus, 
  Search, 
  ThumbsUp,
  User,
  Clock,
  Send
} from 'lucide-react'
import { getDoctors } from '../../lib/dataService'
import type { Doctor } from '../../types'

interface Review {
  id: string
  doctor_id: string
  patient_name: string
  rating: number
  comment: string
  date: string
  helpful_count: number
  screenshots?: string[]
}

export default function AdminReviews() {
  const navigate = useNavigate()
  const [doctors, setDoctors] = useState<Doctor[]>([])
  const [selectedDoctor, setSelectedDoctor] = useState<string>('')
  const [reviews, setReviews] = useState<Review[]>([])
  const [showForm, setShowForm] = useState(false)
  const [searchQuery, setSearchQuery] = useState('')

  // Mock reviews data - in real app, load from database
  const mockReviews: Review[] = [
    {
      id: '1',
      doctor_id: '1',
      patient_name: 'Ahmed Ali',
      rating: 5,
      comment: 'Excellent doctor, very professional and caring. Highly recommended!',
      date: '2024-03-01',
      helpful_count: 12
    },
    {
      id: '2',
      doctor_id: '1',
      patient_name: 'Fatima Hassan',
      rating: 4,
      comment: 'Good experience overall. Waiting time was a bit long but doctor was thorough.',
      date: '2024-02-28',
      helpful_count: 8
    }
  ]

  useEffect(() => {
    loadDoctors()
    setReviews(mockReviews)
  }, [])

  async function loadDoctors() {
    const data = await getDoctors()
    setDoctors(data)
  }

  const filteredReviews = reviews.filter(r => {
    const matchesDoctor = selectedDoctor === '' || r.doctor_id === selectedDoctor
    const matchesSearch = r.patient_name.toLowerCase().includes(searchQuery.toLowerCase()) ||
                         r.comment.toLowerCase().includes(searchQuery.toLowerCase())
    return matchesDoctor && matchesSearch
  })

  function handleAddReview(e: React.FormEvent) {
    e.preventDefault()
    // TODO: Save review to database
    setShowForm(false)
  }

  return (
    <div className="min-h-screen bg-gray-50">
      {/* Header */}
      <div className="bg-medical-600 text-white px-4 pt-12 pb-6">
        <div className="flex items-center gap-3 mb-4">
          <button 
            onClick={() => navigate('/admin')}
            className="p-2 bg-white/10 rounded-lg hover:bg-white/20 transition-colors"
          >
            <ArrowLeft size={20} />
          </button>
          <h1 className="text-xl font-bold">Manage Reviews</h1>
        </div>

        {/* Search */}
        <div className="relative mb-3">
          <Search className="absolute left-4 top-1/2 -translate-y-1/2 text-gray-400" size={20} />
          <input
            type="text"
            placeholder="Search reviews..."
            className="w-full pl-12 pr-4 py-3 rounded-xl bg-white text-gray-800 placeholder-gray-400 focus:outline-none"
            value={searchQuery}
            onChange={(e) => setSearchQuery(e.target.value)}
          />
        </div>

        {/* Doctor Filter */}
        <select
          value={selectedDoctor}
          onChange={(e) => setSelectedDoctor(e.target.value)}
          className="w-full px-4 py-2 rounded-xl bg-white/10 text-white border border-white/20 focus:outline-none"
        >
          <option value="" className="text-gray-800">All Doctors</option>
          {doctors.map(d => (
            <option key={d.id} value={d.id} className="text-gray-800">{d.name}</option>
          ))}
        </select>
      </div>

      {/* Add Review Button */}
      <div className="px-4 py-4">
        <button
          onClick={() => setShowForm(true)}
          className="w-full bg-yellow-500 text-white py-3 rounded-xl font-medium flex items-center justify-center gap-2 hover:bg-yellow-600 transition-colors"
        >
          <Plus size={20} />
          Add Review
        </button>
      </div>

      {/* Reviews List */}
      <div className="px-4 pb-6 space-y-4">
        {filteredReviews.map((review) => {
          const doctor = doctors.find(d => d.id === review.doctor_id)
          return (
            <div key={review.id} className="bg-white rounded-xl p-4 shadow-sm">
              {/* Doctor Info */}
              <div className="flex items-center gap-2 mb-3 pb-3 border-b">
                <User size={16} className="text-medical-500" />
                <span className="font-medium text-gray-800">{doctor?.name || 'Unknown Doctor'}</span>
                <span className="text-gray-400">•</span>
                <span className="text-sm text-gray-500">{doctor?.specialty}</span>
              </div>

              {/* Review Content */}
              <div className="flex items-start gap-3">
                <div className="w-10 h-10 bg-gray-100 rounded-full flex items-center justify-center flex-shrink-0">
                  <span className="font-bold text-gray-600">{review.patient_name[0]}</span>
                </div>
                <div className="flex-1">
                  <div className="flex items-center justify-between mb-1">
                    <h4 className="font-medium text-gray-800">{review.patient_name}</h4>
                    <div className="flex items-center gap-1 bg-yellow-50 px-2 py-1 rounded-lg">
                      <span className="text-yellow-600 font-bold">{review.rating}</span>
                      <span className="text-yellow-500">★</span>
                    </div>
                  </div>
                  <p className="text-gray-600 text-sm mb-2">{review.comment}</p>
                  <div className="flex items-center gap-4 text-xs text-gray-400">
                    <span className="flex items-center gap-1">
                      <Clock size={12} />
                      {review.date}
                    </span>
                    <span className="flex items-center gap-1">
                      <ThumbsUp size={12} />
                      {review.helpful_count} helpful
                    </span>
                  </div>

                  {/* Screenshots */}
                  {review.screenshots && review.screenshots.length > 0 && (
                    <div className="flex gap-2 mt-3">
                      {review.screenshots.map((screenshot, idx) => (
                        <img
                          key={idx}
                          src={screenshot}
                          alt={`Screenshot ${idx + 1}`}
                          className="w-16 h-16 object-cover rounded-lg cursor-pointer hover:opacity-80"
                        />
                      ))}
                    </div>
                  )}
                </div>
              </div>

              {/* Actions */}
              <div className="flex gap-2 mt-4">
                <button
                  onClick={() => console.log('Edit review:', review.id)}
                  className="flex-1 bg-blue-50 text-blue-600 py-2 rounded-lg font-medium text-sm hover:bg-blue-100 transition-colors"
                >
                  Edit
                </button>
                <button
                  onClick={() => {
                    if (confirm('Delete this review?')) {
                      console.log('Delete review:', review.id)
                    }
                  }}
                  className="flex-1 bg-red-50 text-red-600 py-2 rounded-lg font-medium text-sm hover:bg-red-100 transition-colors"
                >
                  Delete
                </button>
              </div>
            </div>
          )
        })}
      </div>

      {/* Add Review Modal */}
      {showForm && (
        <div className="fixed inset-0 bg-black/50 flex items-end z-50">
          <div className="bg-white w-full rounded-t-3xl p-4 max-h-[90vh] overflow-auto">
            <div className="flex justify-between items-center mb-4">
              <h2 className="text-lg font-bold text-gray-800">Add Review</h2>
              <button 
                onClick={() => setShowForm(false)}
                className="p-2 hover:bg-gray-100 rounded-lg"
              >
                <ArrowLeft size={20} />
              </button>
            </div>

            <form onSubmit={handleAddReview} className="space-y-4">
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-1">
                  Select Doctor *
                </label>
                <select
                  required
                  className="input-field"
                >
                  <option value="">Choose a doctor</option>
                  {doctors.map(d => (
                    <option key={d.id} value={d.id}>{d.name} - {d.specialty}</option>
                  ))}
                </select>
              </div>

              <div>
                <label className="block text-sm font-medium text-gray-700 mb-1">
                  Patient Name *
                </label>
                <input
                  type="text"
                  required
                  className="input-field"
                  placeholder="Enter patient name"
                />
              </div>

              <div>
                <label className="block text-sm font-medium text-gray-700 mb-1">
                  Rating *
                </label>
                <select
                  required
                  className="input-field"
                >
                  <option value="5">5 - Excellent</option>
                  <option value="4">4 - Very Good</option>
                  <option value="3">3 - Good</option>
                  <option value="2">2 - Fair</option>
                  <option value="1">1 - Poor</option>
                </select>
              </div>

              <div>
                <label className="block text-sm font-medium text-gray-700 mb-1">
                  Review Comment *
                </label>
                <textarea
                  required
                  rows={4}
                  className="input-field"
                  placeholder="Write your review..."
                />
              </div>

              <div>
                <label className="block text-sm font-medium text-gray-700 mb-1">
                  Screenshots (optional)
                </label>
                <div className="border-2 border-dashed border-gray-300 rounded-xl p-4 text-center">
                  <p className="text-sm text-gray-500">Tap to upload screenshots</p>
                </div>
              </div>

              <button
                type="submit"
                className="w-full btn-primary flex items-center justify-center gap-2"
              >
                <Send size={18} />
                Submit Review
              </button>
            </form>
          </div>
        </div>
      )}
    </div>
  )
}
