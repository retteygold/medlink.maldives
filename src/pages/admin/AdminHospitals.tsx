import { useState, useEffect } from 'react'
import { useNavigate } from 'react-router-dom'
import { 
  ArrowLeft, 
  Plus, 
  Search, 
  Building2, 
  Phone, 
  MapPin, 
  Edit2,
  Trash2,
  Upload,
  X,
  Save
} from 'lucide-react'
import { createHospital, getHospitals, updateHospital } from '../../lib/dataService'
import type { Hospital } from '../../types'

export default function AdminHospitals() {
  const navigate = useNavigate()
  const [hospitals, setHospitals] = useState<Hospital[]>([])
  const [searchQuery, setSearchQuery] = useState('')
  const [showForm, setShowForm] = useState(false)
  const [editingHospital, setEditingHospital] = useState<Hospital | null>(null)
  const [saving, setSaving] = useState(false)
  const [error, setError] = useState<string | null>(null)
  const [formData, setFormData] = useState({
    name: '',
    category: 'General Clinic',
    address: '',
    contact_phone: '',
    email: '',
    website: '',
    opening_hours: '',
    image_url: ''
  })

  useEffect(() => {
    loadHospitals()
  }, [])

  async function loadHospitals() {
    const data = await getHospitals()
    setHospitals(data)
  }

  const filteredHospitals = hospitals.filter(h => 
    h.name.toLowerCase().includes(searchQuery.toLowerCase())
  )

  function handleEdit(hospital: Hospital) {
    setEditingHospital(hospital)
    setError(null)
    setFormData({
      name: hospital.name,
      category: hospital.category,
      address: hospital.address || '',
      contact_phone: hospital.contact_phone || '',
      email: hospital.email || '',
      website: hospital.website || '',
      opening_hours: hospital.opening_hours || '',
      image_url: hospital.image_url || ''
    })
    setShowForm(true)
  }

  async function handleSubmit(e: React.FormEvent) {
    e.preventDefault()
    setSaving(true)
    setError(null)

    try {
      const payload = {
        name: formData.name.trim(),
        category: formData.category as Hospital['category'],
        address: formData.address,
        contact_phone: formData.contact_phone,
        email: formData.email,
        website: formData.website,
        opening_hours: formData.opening_hours,
        image_url: formData.image_url
      }

      if (!payload.name) return

      if (editingHospital?.id) {
        const updated = await updateHospital(editingHospital.id, payload)
        if (!updated) throw new Error('Update failed')
        setHospitals((prev) => prev.map((h) => (h.id === updated.id ? updated : h)))
      } else {
        const created = await createHospital(payload)
        if (!created) throw new Error('Create failed')
        setHospitals((prev) => [created, ...prev])
      }

      setShowForm(false)
      setEditingHospital(null)
      setFormData({
        name: '',
        category: 'General Clinic',
        address: '',
        contact_phone: '',
        email: '',
        website: '',
        opening_hours: '',
        image_url: ''
      })

      await loadHospitals()
    } catch (err: any) {
      const msg = typeof err?.message === 'string' ? err.message : 'Failed to save hospital'
      setError(msg)
    } finally {
      setSaving(false)
    }
  }

  function handleImageUpload(e: React.ChangeEvent<HTMLInputElement>) {
    const file = e.target.files?.[0]
    if (file) {
      // TODO: Upload image to storage
      const reader = new FileReader()
      reader.onloadend = () => {
        setFormData({ ...formData, image_url: reader.result as string })
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
              {editingHospital ? 'Edit Hospital' : 'Add Hospital'}
            </h1>
          </div>
        </div>

        {/* Form */}
        <form onSubmit={handleSubmit} className="px-4 py-6 space-y-4">
          {error && (
            <div className="bg-red-50 text-red-700 border border-red-200 rounded-xl p-3 text-sm">
              {error}
            </div>
          )}
          {/* Image Upload */}
          <div className="bg-white rounded-xl p-4">
            <label className="block text-sm font-medium text-gray-700 mb-2">
              Hospital Image
            </label>
            <div className="flex items-center gap-4">
              {formData.image_url ? (
                <div className="relative">
                  <img 
                    src={formData.image_url} 
                    alt="Preview" 
                    className="w-24 h-24 object-cover rounded-xl"
                  />
                  <button
                    type="button"
                    onClick={() => setFormData({ ...formData, image_url: '' })}
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
                Hospital Name *
              </label>
              <input
                type="text"
                required
                value={formData.name}
                onChange={(e) => setFormData({ ...formData, name: e.target.value })}
                className="input-field"
                placeholder="Enter hospital name"
              />
            </div>

            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1">
                Category
              </label>
              <select
                value={formData.category}
                onChange={(e) => setFormData({ ...formData, category: e.target.value as Hospital['category'] })}
                className="input-field"
              >
                <option value="General Clinic">General Clinic</option>
                <option value="Private Hospital">Private Hospital</option>
                <option value="Speciality Hospital">Speciality Hospital</option>
                <option value="Diagnostic Clinic">Diagnostic Clinic</option>
                <option value="Resort Clinic">Resort Clinic</option>
                <option value="Therapeutic Clinic">Therapeutic Clinic</option>
                <option value="Area Specific Clinic">Area Specific Clinic</option>
                <option value="Speciality Clinic">Speciality Clinic</option>
                <option value="Traditional Clinic">Traditional Clinic</option>
              </select>
            </div>

            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1">
                Address
              </label>
              <textarea
                value={formData.address}
                onChange={(e) => setFormData({ ...formData, address: e.target.value })}
                className="input-field"
                rows={2}
                placeholder="Enter full address"
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
                value={formData.contact_phone}
                onChange={(e) => setFormData({ ...formData, contact_phone: e.target.value })}
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
                placeholder="hospital@example.com"
              />
            </div>

            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1">
                Website
              </label>
              <input
                type="url"
                value={formData.website}
                onChange={(e) => setFormData({ ...formData, website: e.target.value })}
                className="input-field"
                placeholder="https://..."
              />
            </div>
          </div>

          {/* Location */}
          <div className="bg-white rounded-xl p-4 space-y-4">
            <h2 className="font-bold text-gray-800">Opening Hours</h2>

            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1">
                Hours
              </label>
              <input
                type="text"
                value={formData.opening_hours}
                onChange={(e) => setFormData({ ...formData, opening_hours: e.target.value })}
                className="input-field"
                placeholder="24 hours / 8:00 AM - 10:00 PM"
              />
            </div>
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
              disabled={saving}
              className="flex-1 btn-primary flex items-center justify-center gap-2"
            >
              <Save size={18} />
              {saving ? 'Saving...' : editingHospital ? 'Update' : 'Save'}
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
          <h1 className="text-xl font-bold">Manage Hospitals</h1>
        </div>

        {/* Search */}
        <div className="relative">
          <Search className="absolute left-4 top-1/2 -translate-y-1/2 text-gray-400" size={20} />
          <input
            type="text"
            placeholder="Search hospitals..."
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
          className="w-full bg-medical-500 text-white py-3 rounded-xl font-medium flex items-center justify-center gap-2 hover:bg-medical-600 transition-colors"
        >
          <Plus size={20} />
          Add New Hospital
        </button>
      </div>

      {/* Hospitals List */}
      <div className="px-4 pb-6 space-y-3">
        {filteredHospitals.map((hospital) => (
          <div
            key={hospital.id}
            className="bg-white rounded-xl p-4 shadow-sm"
          >
            <div className="flex items-start gap-3">
              <div className="w-16 h-16 bg-medical-100 rounded-xl flex items-center justify-center flex-shrink-0">
                {hospital.image_url ? (
                  <img 
                    src={hospital.image_url} 
                    alt={hospital.name}
                    className="w-full h-full object-cover rounded-xl"
                  />
                ) : (
                  <Building2 size={24} className="text-medical-600" />
                )}
              </div>
              <div className="flex-1 min-w-0">
                <h3 className="font-bold text-gray-800 truncate">{hospital.name}</h3>
                <p className="text-sm text-medical-600">{hospital.category}</p>
                {hospital.address && (
                  <p className="text-sm text-gray-500 truncate flex items-center gap-1 mt-1">
                    <MapPin size={12} />
                    {hospital.address}
                  </p>
                )}
                {hospital.contact_phone && (
                  <p className="text-sm text-gray-500 flex items-center gap-1 mt-1">
                    <Phone size={12} />
                    {hospital.contact_phone}
                  </p>
                )}
              </div>
            </div>
            <div className="flex gap-2 mt-4">
              <button
                onClick={() => handleEdit(hospital)}
                className="flex-1 bg-blue-50 text-blue-600 py-2 rounded-lg font-medium flex items-center justify-center gap-2 hover:bg-blue-100 transition-colors"
              >
                <Edit2 size={16} />
                Edit
              </button>
              <button
                onClick={() => {
                  // TODO: Delete hospital
                  if (confirm('Are you sure you want to delete this hospital?')) {
                    console.log('Deleting hospital:', hospital.id)
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
