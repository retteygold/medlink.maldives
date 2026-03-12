import { useEffect, useState } from 'react'
import { useNavigate } from 'react-router-dom'
import { ArrowLeft, Plus, MapPin, Trash2, Edit2, Save, X, CheckCircle2 } from 'lucide-react'
import { supabase } from '../../lib/supabase'

interface Zone {
  id: string
  name: string
  slug: string
  description?: string | null
  is_active: boolean
  sort_order: number
  created_at: string
  updated_at: string
}

export default function AdminRideZones() {
  const navigate = useNavigate()
  const [zones, setZones] = useState<Zone[]>([])
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState<string | null>(null)
  const [showForm, setShowForm] = useState(false)
  const [editingZone, setEditingZone] = useState<Zone | null>(null)
  const [formData, setFormData] = useState({
    name: '',
    slug: '',
    description: '',
    is_active: true,
    sort_order: 0
  })

  useEffect(() => {
    load()
  }, [])

  async function load() {
    setLoading(true)
    try {
      setError(null)
      const { data, error } = await supabase
        .from('ride_zones')
        .select('*')
        .order('sort_order', { ascending: true })
        .order('name', { ascending: true })

      if (error) throw error
      setZones(data || [])
    } catch (err: any) {
      setError(err?.message || 'Failed to load zones')
    } finally {
      setLoading(false)
    }
  }

  function handleEdit(zone: Zone) {
    setEditingZone(zone)
    setFormData({
      name: zone.name,
      slug: zone.slug,
      description: zone.description || '',
      is_active: zone.is_active,
      sort_order: zone.sort_order
    })
    setShowForm(true)
  }

  async function handleSubmit(e: React.FormEvent) {
    e.preventDefault()
    try {
      if (editingZone) {
        const { error } = await supabase
          .from('ride_zones')
          .update({
            name: formData.name,
            slug: formData.slug,
            description: formData.description || null,
            is_active: formData.is_active,
            sort_order: formData.sort_order
          })
          .eq('id', editingZone.id)
        if (error) throw error
      } else {
        const { error } = await supabase
          .from('ride_zones')
          .insert({
            name: formData.name,
            slug: formData.slug,
            description: formData.description || null,
            is_active: formData.is_active,
            sort_order: formData.sort_order
          })
        if (error) throw error
      }
      setShowForm(false)
      setEditingZone(null)
      resetForm()
      await load()
    } catch (err: any) {
      setError(err?.message || 'Failed to save zone')
    }
  }

  async function deleteZone(id: string) {
    try {
      const ok = window.confirm('Delete this zone? This will also delete associated fare rules.')
      if (!ok) return
      const { error } = await supabase
        .from('ride_zones')
        .delete()
        .eq('id', id)
      if (error) throw error
      await load()
    } catch (err: any) {
      setError(err?.message || 'Failed to delete zone')
    }
  }

  async function toggleActive(zone: Zone) {
    try {
      const { error } = await supabase
        .from('ride_zones')
        .update({ is_active: !zone.is_active })
        .eq('id', zone.id)
      if (error) throw error
      await load()
    } catch (err: any) {
      setError(err?.message || 'Failed to update zone')
    }
  }

  function resetForm() {
    setFormData({ name: '', slug: '', description: '', is_active: true, sort_order: 0 })
  }

  return (
    <div className="min-h-screen bg-gray-50">
      <div className="bg-medical-600 text-white px-4 pt-12 pb-6">
        <div className="flex items-center gap-3">
          <button
            onClick={() => navigate('/admin')}
            className="w-10 h-10 bg-white/10 rounded-xl flex items-center justify-center"
            aria-label="Back"
          >
            <ArrowLeft size={20} />
          </button>
          <div>
            <h1 className="text-xl font-bold">Ride Zones</h1>
            <p className="text-white/80 text-sm">Manage service zones</p>
          </div>
        </div>
      </div>

      <div className="px-4 py-5 space-y-3">
        {error ? <div className="text-sm text-red-600">{error}</div> : null}

        <div className="flex items-center justify-between">
          <div className="text-sm text-gray-600">Total: {zones.length}</div>
          <button
            onClick={() => {
              setEditingZone(null)
              resetForm()
              setShowForm(true)
            }}
            className="inline-flex items-center gap-2 px-3 py-2 rounded-xl bg-medical-600 text-white text-sm font-semibold"
          >
            <Plus size={16} /> Add Zone
          </button>
        </div>

        {showForm && (
          <div className="bg-white rounded-xl p-4 shadow-sm border border-gray-100">
            <form onSubmit={handleSubmit} className="space-y-3">
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-1">Name</label>
                <input
                  type="text"
                  value={formData.name}
                  onChange={(e) => setFormData({ ...formData, name: e.target.value })}
                  className="w-full px-3 py-2 rounded-xl border border-gray-200 text-sm"
                  placeholder="e.g., Male"
                  required
                />
              </div>
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-1">Slug</label>
                <input
                  type="text"
                  value={formData.slug}
                  onChange={(e) => setFormData({ ...formData, slug: e.target.value })}
                  className="w-full px-3 py-2 rounded-xl border border-gray-200 text-sm"
                  placeholder="e.g., male"
                  required
                />
              </div>
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-1">Description</label>
                <input
                  type="text"
                  value={formData.description}
                  onChange={(e) => setFormData({ ...formData, description: e.target.value })}
                  className="w-full px-3 py-2 rounded-xl border border-gray-200 text-sm"
                  placeholder="e.g., Capital city area"
                />
              </div>
              <div className="flex gap-3">
                <div className="flex-1">
                  <label className="block text-sm font-medium text-gray-700 mb-1">Sort Order</label>
                  <input
                    type="number"
                    value={formData.sort_order}
                    onChange={(e) => setFormData({ ...formData, sort_order: Number(e.target.value) })}
                    className="w-full px-3 py-2 rounded-xl border border-gray-200 text-sm"
                  />
                </div>
                <div className="flex-1">
                  <label className="block text-sm font-medium text-gray-700 mb-1">Active</label>
                  <select
                    value={formData.is_active ? 'true' : 'false'}
                    onChange={(e) => setFormData({ ...formData, is_active: e.target.value === 'true' })}
                    className="w-full px-3 py-2 rounded-xl border border-gray-200 text-sm"
                  >
                    <option value="true">Active</option>
                    <option value="false">Inactive</option>
                  </select>
                </div>
              </div>
              <div className="flex gap-2 pt-2">
                <button
                  type="submit"
                  className="flex-1 inline-flex items-center justify-center gap-2 px-3 py-2 rounded-xl bg-medical-600 text-white text-sm font-semibold"
                >
                  <Save size={16} /> {editingZone ? 'Update' : 'Create'}
                </button>
                <button
                  type="button"
                  onClick={() => {
                    setShowForm(false)
                    setEditingZone(null)
                    resetForm()
                  }}
                  className="inline-flex items-center justify-center gap-2 px-3 py-2 rounded-xl bg-gray-100 text-gray-700 text-sm font-semibold"
                >
                  <X size={16} /> Cancel
                </button>
              </div>
            </form>
          </div>
        )}

        {loading ? <div className="text-sm text-gray-500">Loading...</div> : null}

        {!loading && zones.length === 0 ? (
          <div className="text-sm text-gray-500">No zones found. Add the first zone above.</div>
        ) : null}

        {zones.map((z) => (
          <div key={z.id} className="bg-white rounded-xl p-4 shadow-sm border border-gray-100">
            <div className="flex items-start justify-between gap-3">
              <div className="flex items-start gap-3 min-w-0">
                <div className="w-10 h-10 rounded-xl bg-medical-50 flex items-center justify-center shrink-0">
                  <MapPin size={18} className="text-medical-600" />
                </div>
                <div className="min-w-0">
                  <div className="flex items-center gap-2">
                    <div className="font-bold text-gray-900 truncate">{z.name}</div>
                    {z.is_active ? (
                      <span className="inline-flex items-center gap-1 text-xs bg-green-50 text-green-700 px-2 py-0.5 rounded-full">
                        <CheckCircle2 size={12} /> Active
                      </span>
                    ) : (
                      <span className="inline-flex items-center gap-1 text-xs bg-gray-100 text-gray-600 px-2 py-0.5 rounded-full">
                        Inactive
                      </span>
                    )}
                  </div>
                  <div className="text-sm text-gray-600 truncate">Slug: {z.slug}</div>
                  {z.description ? (
                    <div className="text-xs text-gray-500">{z.description}</div>
                  ) : null}
                  <div className="text-xs text-gray-500 mt-1">Sort: {z.sort_order}</div>
                </div>
              </div>
              <div className="flex flex-col gap-2 shrink-0">
                <button
                  onClick={() => handleEdit(z)}
                  className="inline-flex items-center gap-2 px-3 py-2 rounded-xl bg-white text-gray-800 text-sm font-semibold border border-gray-200"
                >
                  <Edit2 size={16} /> Edit
                </button>
                <button
                  onClick={() => toggleActive(z)}
                  className={`inline-flex items-center gap-2 px-3 py-2 rounded-xl text-sm font-semibold ${
                    z.is_active ? 'bg-amber-50 text-amber-700 border border-amber-200' : 'bg-green-50 text-green-700 border border-green-200'
                  }`}
                >
                  {z.is_active ? 'Deactivate' : 'Activate'}
                </button>
                <button
                  onClick={() => deleteZone(z.id)}
                  className="inline-flex items-center gap-2 px-3 py-2 rounded-xl bg-white text-red-700 text-sm font-semibold border border-red-200"
                >
                  <Trash2 size={16} /> Delete
                </button>
              </div>
            </div>
          </div>
        ))}
      </div>
    </div>
  )
}
