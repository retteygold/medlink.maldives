import { useState, useEffect } from 'react'
import { useNavigate } from 'react-router-dom'
import { 
  ArrowLeft, 
  Plus, 
  Search, 
  User, 
  Star,
  Edit2,
  Trash2,
  Upload,
  X,
  Save,
  Building2
} from 'lucide-react'
import { getDoctors, getHospitals } from '../../lib/dataService'
import type { Doctor, Hospital } from '../../types'

export default function AdminDoctors() {
  const navigate = useNavigate()
  const [doctors, setDoctors] = useState<Doctor[]>([])
  const [hospitals, setHospitals] = useState<Hospital[]>([])
  const [searchQuery, setSearchQuery] = useState('')
  const [showForm, setShowForm] = useState(false)
  const [editingDoctor, setEditingDoctor] = useState<Doctor | null>(null)
  const [formData, setFormData] = useState({
    name: '',
    specialty: '',
    hospital_id: '',
    qualifications: [] as string[],
    experience_years: '',
    languages: [] as string[],
    phone: '',
    email: '',
    about: '',
    rating: '4.0',
    is_active: true,
    image: ''
  })

  useEffect(() => {
    loadData()
  }, [])

  async function loadData() {
    const [doctorsData, hospitalsData] = await Promise.all([
      getDoctors(),
      getHospitals()
    ])
    setDoctors(doctorsData)
    setHospitals(hospitalsData)
  }

  const filteredDoctors = doctors.filter(d => 
    d.name.toLowerCase().includes(searchQuery.toLowerCase()) ||
    d.specialty.toLowerCase().includes(searchQuery.toLowerCase())
  )

  function handleEdit(doctor: Doctor) {
    setEditingDoctor(doctor)
    setFormData({
      name: doctor.name,
      specialty: doctor.specialty,
      hospital_id: doctor.hospital_id,
      qualifications: doctor.qualifications || [],
      experience_years: doctor.experience_years?.toString() || '',
      languages: doctor.languages || [],
      phone: doctor.contact_phone || '',
      email: doctor.email || '',
      about: doctor.about || '',
      rating: doctor.rating?.toString() || '4.0',
      is_active: doctor.is_active ?? true,
      image: doctor.image_url || ''
    })
    setShowForm(true)
  }

  function handleSubmit(e: React.FormEvent) {
    e.preventDefault()
    // TODO: Save doctor to database
    console.log('Saving doctor:', formData)
    setShowForm(false)
    setEditingDoctor(null)
    resetForm()
  }

  function resetForm() {
    setFormData({
      name: '', specialty: '', hospital_id: '', qualifications: [],
      experience_years: '', languages: [], phone: '', email: '',
      about: '', rating: '4.0', is_active: true, image: ''
    })
  }

  function handleImageUpload(e: React.ChangeEvent<HTMLInputElement>) {
    const file = e.target.files?.[0]
    if (file) {
      const reader = new FileReader()
      reader.onloadend = () => {
        setFormData({ ...formData, image: reader.result as string })
      }
      reader.readAsDataURL(file)
    }
  }

  if (showForm) {
    return (
      <div className="min-h-screen bg-gray-50">
        {/* Header */}
        <div className="bg-medical-600 text-white px-4 pt-12 pb-6">
          <div className="flex items-center gap-3 mb-4">
            <button 
              onClick={() => setShowForm(false)}
              className="p-2 bg-white/10 rounded-lg hover:bg-white/20 transition-colors"
            >
              <ArrowLeft size={20} />
            </button>
            <h1 className="text-xl font-bold">
              {editingDoctor ? 'Edit Doctor' : 'Add Doctor'}
            </h1>
          </div>
        </div>

        {/* Form */}
        <form onSubmit={handleSubmit} className="px-4 py-6 space-y-4">
          {/* Image Upload */}
          <div className="bg-white rounded-xl p-4">
            <label className="block text-sm font-medium text-gray-700 mb-2">
              Doctor Photo
            </label>
            <div className="flex items-center gap-4">
              {formData.image ? (
                <div className="relative">
                  <img 
                    src={formData.image} 
                    alt="Preview" 
                    className="w-24 h-24 object-cover rounded-xl"
                  />
                  <button
                    type="button"
                    onClick={() => setFormData({ ...formData, image: '' })}
                    className="absolute -top-2 -right-2 w-6 h-6 bg-red-500 text-white rounded-full flex items-center justify-center"
                  >
                    <X size={14} />
                  </button>
                </div>
              ) : (
                <label className="w-24 h-24 border-2 border-dashed border-gray-300 rounded-xl flex flex-col items-center justify-center cursor-pointer hover:border-medical-500 transition-colors">
                  <Upload size={20} className="text-gray-400 mb-1" />
                  <span className="text-xs text-gray-500">Upload</span>
                  <input 
                    type="file" 
                    accept="image/*" 
                    className="hidden" 
                    onChange={handleImageUpload}
                  />
                </label>
              )}
            </div>
          </div>

          {/* Basic Info */}
          <div className="bg-white rounded-xl p-4 space-y-4">
            <h2 className="font-bold text-gray-800">Basic Information</h2>
            
            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1">
                Full Name *
              </label>
              <input
                type="text"
                required
                value={formData.name}
                onChange={(e) => setFormData({ ...formData, name: e.target.value })}
                className="input-field"
                placeholder="Dr. ..."
              />
            </div>

            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1">
                Specialty *
              </label>
              <input
                type="text"
                required
                value={formData.specialty}
                onChange={(e) => setFormData({ ...formData, specialty: e.target.value })}
                className="input-field"
                placeholder="Cardiology, General Medicine..."
              />
            </div>

            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1">
                Hospital *
              </label>
              <select
                required
                value={formData.hospital_id}
                onChange={(e) => setFormData({ ...formData, hospital_id: e.target.value })}
                className="input-field"
              >
                <option value="">Select Hospital</option>
                {hospitals.map(h => (
                  <option key={h.id} value={h.id}>{h.name}</option>
                ))}
              </select>
            </div>

            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1">
                Qualifications (comma separated)
              </label>
              <input
                type="text"
                value={formData.qualifications.join(', ')}
                onChange={(e) => setFormData({ ...formData, qualifications: e.target.value.split(',').map(s => s.trim()) })}
                className="input-field"
                placeholder="MBBS, MD, FRCS..."
              />
            </div>

            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1">
                Years of Experience
              </label>
              <input
                type="number"
                value={formData.experience_years}
                onChange={(e) => setFormData({ ...formData, experience_years: e.target.value })}
                className="input-field"
                placeholder="10"
              />
            </div>
          </div>

          {/* Contact Info */}
          <div className="bg-white rounded-xl p-4 space-y-4">
            <h2 className="font-bold text-gray-800">Contact Information</h2>
            
            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1">
                Phone
              </label>
              <input
                type="tel"
                value={formData.phone}
                onChange={(e) => setFormData({ ...formData, phone: e.target.value })}
                className="input-field"
                placeholder="+960 ..."
              />
            </div>

            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1">
                Email
              </label>
              <input
                type="email"
                value={formData.email}
                onChange={(e) => setFormData({ ...formData, email: e.target.value })}
                className="input-field"
                placeholder="doctor@example.com"
              />
            </div>
          </div>

          {/* About */}
          <div className="bg-white rounded-xl p-4 space-y-4">
            <h2 className="font-bold text-gray-800">About</h2>
            <textarea
              value={formData.about}
              onChange={(e) => setFormData({ ...formData, about: e.target.value })}
              className="input-field"
              rows={4}
              placeholder="Brief description about the doctor..."
            />
          </div>

          {/* Status */}
          <div className="bg-white rounded-xl p-4">
            <label className="flex items-center gap-3 cursor-pointer">
              <input
                type="checkbox"
                checked={formData.is_active}
                onChange={(e) => setFormData({ ...formData, is_active: e.target.checked })}
                className="w-5 h-5 text-medical-500 rounded focus:ring-medical-500"
              />
              <span className="font-medium text-gray-700">Active</span>
            </label>
          </div>

          {/* Submit */}
          <div className="flex gap-3">
            <button
              type="button"
              onClick={() => setShowForm(false)}
              className="flex-1 btn-secondary"
            >
              Cancel
            </button>
            <button
              type="submit"
              className="flex-1 btn-primary flex items-center justify-center gap-2"
            >
              <Save size={18} />
              {editingDoctor ? 'Update' : 'Save'}
            </button>
          </div>
        </form>
      </div>
    )
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
          <h1 className="text-xl font-bold">Manage Doctors</h1>
        </div>

        {/* Search */}
        <div className="relative">
          <Search className="absolute left-4 top-1/2 -translate-y-1/2 text-gray-400" size={20} />
          <input
            type="text"
            placeholder="Search doctors..."
            className="w-full pl-12 pr-4 py-3 rounded-xl bg-white text-gray-800 placeholder-gray-400 focus:outline-none"
            value={searchQuery}
            onChange={(e) => setSearchQuery(e.target.value)}
          />
        </div>
      </div>

      {/* Add Button */}
      <div className="px-4 py-4">
        <button
          onClick={() => setShowForm(true)}
          className="w-full bg-green-500 text-white py-3 rounded-xl font-medium flex items-center justify-center gap-2 hover:bg-green-600 transition-colors"
        >
          <Plus size={20} />
          Add New Doctor
        </button>
      </div>

      {/* Doctors List */}
      <div className="px-4 pb-6 space-y-3">
        {filteredDoctors.map((doctor) => (
          <div
            key={doctor.id}
            className="bg-white rounded-xl p-4 shadow-sm"
          >
            <div className="flex items-start gap-3">
              <div className="w-16 h-16 bg-gradient-to-br from-medical-100 to-medical-200 rounded-xl flex items-center justify-center flex-shrink-0">
                {doctor.image_url ? (
                  <img 
                    src={doctor.image_url} 
                    alt={doctor.name}
                    className="w-full h-full object-cover rounded-xl"
                  />
                ) : (
                  <User size={24} className="text-medical-600" />
                )}
              </div>
              <div className="flex-1 min-w-0">
                <h3 className="font-bold text-gray-800 truncate">{doctor.name}</h3>
                <p className="text-sm text-medical-600">{doctor.specialty}</p>
                <p className="text-sm text-gray-500 flex items-center gap-1 mt-1">
                  <Building2 size={12} />
                  {doctor.hospital_name}
                </p>
                <div className="flex items-center gap-2 mt-2">
                  <span className="text-xs bg-yellow-50 text-yellow-700 px-2 py-1 rounded-full flex items-center gap-1">
                    <Star size={10} className="fill-yellow-500" />
                    {doctor.rating?.toFixed(1) || '4.0'}
                  </span>
                  {doctor.is_active && (
                    <span className="text-xs bg-green-50 text-green-700 px-2 py-1 rounded-full">
                      Active
                    </span>
                  )}
                </div>
              </div>
            </div>
            <div className="flex gap-2 mt-4">
              <button
                onClick={() => handleEdit(doctor)}
                className="flex-1 bg-blue-50 text-blue-600 py-2 rounded-lg font-medium flex items-center justify-center gap-2 hover:bg-blue-100 transition-colors"
              >
                <Edit2 size={16} />
                Edit
              </button>
              <button
                onClick={() => {
                  if (confirm('Are you sure you want to delete this doctor?')) {
                    console.log('Deleting doctor:', doctor.id)
                  }
                }}
                className="flex-1 bg-red-50 text-red-600 py-2 rounded-lg font-medium flex items-center justify-center gap-2 hover:bg-red-100 transition-colors"
              >
                <Trash2 size={16} />
                Delete
              </button>
            </div>
          </div>
        ))}
      </div>
    </div>
  )
}
