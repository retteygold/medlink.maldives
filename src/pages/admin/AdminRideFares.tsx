import { useEffect, useMemo, useState } from 'react'
import { useNavigate } from 'react-router-dom'
import { ArrowLeft, Plus, DollarSign, Trash2, Edit2, Save, X, CheckCircle2, ArrowRightLeft } from 'lucide-react'
import { supabase } from '../../lib/supabase'
import type { RideVehicleType } from '../../types'

const vehicleTypes: RideVehicleType[] = ['bike', 'car', 'van', 'pickup']

interface Zone {
  id: string
  name: string
  slug: string
  is_active: boolean
}

interface FareRule {
  id: string
  origin_zone_id: string
  destination_zone_id: string
  vehicle_type: RideVehicleType
  fare: number
  is_active: boolean
  notes?: string | null
  created_at: string
  updated_at: string
}

export default function AdminRideFares() {
  const navigate = useNavigate()
  const [zones, setZones] = useState<Zone[]>([])
  const [rules, setRules] = useState<FareRule[]>([])
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState<string | null>(null)
  const [showForm, setShowForm] = useState(false)
  const [editingRule, setEditingRule] = useState<FareRule | null>(null)
  const [formData, setFormData] = useState({
    origin_zone_id: '',
    destination_zone_id: '',
    vehicle_type: 'car' as RideVehicleType,
    fare: 0,
    is_active: true,
    notes: ''
  })

  useEffect(() => {
    load()
  }, [])

  async function load() {
    setLoading(true)
    try {
      setError(null)
      const [zonesRes, rulesRes] = await Promise.all([
        supabase.from('ride_zones').select('id, name, slug, is_active').order('sort_order', { ascending: true }).order('name', { ascending: true }),
        supabase.from('ride_fare_rules').select('*').order('created_at', { ascending: false })
      ])
      if (zonesRes.error) throw zonesRes.error
      if (rulesRes.error) throw rulesRes.error
      setZones(zonesRes.data || [])
      setRules(rulesRes.data || [])
    } catch (err: any) {
      setError(err?.message || 'Failed to load data')
    } finally {
      setLoading(false)
    }
  }

  const zoneNameById = useMemo(() => {
    const map = new Map<string, string>()
    for (const z of zones) map.set(z.id, z.name)
    return map
  }, [zones])

  function handleEdit(rule: FareRule) {
    setEditingRule(rule)
    setFormData({
      origin_zone_id: rule.origin_zone_id,
      destination_zone_id: rule.destination_zone_id,
      vehicle_type: rule.vehicle_type,
      fare: rule.fare,
      is_active: rule.is_active,
      notes: rule.notes || ''
    })
    setShowForm(true)
  }

  async function handleSubmit(e: React.FormEvent) {
    e.preventDefault()
    try {
      if (editingRule) {
        const { error } = await supabase
          .from('ride_fare_rules')
          .update({
            origin_zone_id: formData.origin_zone_id,
            destination_zone_id: formData.destination_zone_id,
            vehicle_type: formData.vehicle_type,
            fare: formData.fare,
            is_active: formData.is_active,
            notes: formData.notes || null
          })
          .eq('id', editingRule.id)
        if (error) throw error
      } else {
        const { error } = await supabase.from('ride_fare_rules').insert({
          origin_zone_id: formData.origin_zone_id,
          destination_zone_id: formData.destination_zone_id,
          vehicle_type: formData.vehicle_type,
          fare: formData.fare,
          is_active: formData.is_active,
          notes: formData.notes || null
        })
        if (error) throw error
      }
      setShowForm(false)
      setEditingRule(null)
      resetForm()
      await load()
    } catch (err: any) {
      setError(err?.message || 'Failed to save fare rule')
    }
  }

  async function deleteRule(id: string) {
    try {
      const ok = window.confirm('Delete this fare rule?')
      if (!ok) return
      const { error } = await supabase.from('ride_fare_rules').delete().eq('id', id)
      if (error) throw error
      await load()
    } catch (err: any) {
      setError(err?.message || 'Failed to delete fare rule')
    }
  }

  async function toggleActive(rule: FareRule) {
    try {
      const { error } = await supabase
        .from('ride_fare_rules')
        .update({ is_active: !rule.is_active })
        .eq('id', rule.id)
      if (error) throw error
      await load()
    } catch (err: any) {
      setError(err?.message || 'Failed to update fare rule')
    }
  }

  function resetForm() {
    setFormData({ origin_zone_id: '', destination_zone_id: '', vehicle_type: 'car', fare: 0, is_active: true, notes: '' })
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
            <h1 className="text-xl font-bold">Ride Fares</h1>
            <p className="text-white/80 text-sm">Manage zone-to-zone pricing</p>
          </div>
        </div>
      </div>

      <div className="px-4 py-5 space-y-3">
        {error ? <div className="text-sm text-red-600">{error}</div> : null}

        <div className="flex items-center justify-between">
          <div className="text-sm text-gray-600">Total rules: {rules.length}</div>
          <button
            onClick={() => {
              setEditingRule(null)
              resetForm()
              setShowForm(true)
            }}
            className="inline-flex items-center gap-2 px-3 py-2 rounded-xl bg-medical-600 text-white text-sm font-semibold"
          >
            <Plus size={16} /> Add Fare Rule
          </button>
        </div>

        {showForm && (
          <div className="bg-white rounded-xl p-4 shadow-sm border border-gray-100">
            <form onSubmit={handleSubmit} className="space-y-3">
              <div className="grid grid-cols-2 gap-3">
                <div>
                  <label className="block text-sm font-medium text-gray-700 mb-1">Origin Zone</label>
                  <select
                    value={formData.origin_zone_id}
                    onChange={(e) => setFormData({ ...formData, origin_zone_id: e.target.value })}
                    className="w-full px-3 py-2 rounded-xl border border-gray-200 text-sm"
                    required
                  >
                    <option value="">Select origin</option>
                    {zones.map((z) => (
                      <option key={z.id} value={z.id}>{z.name}</option>
                    ))}
                  </select>
                </div>
                <div>
                  <label className="block text-sm font-medium text-gray-700 mb-1">Destination Zone</label>
                  <select
                    value={formData.destination_zone_id}
                    onChange={(e) => setFormData({ ...formData, destination_zone_id: e.target.value })}
                    className="w-full px-3 py-2 rounded-xl border border-gray-200 text-sm"
                    required
                  >
                    <option value="">Select destination</option>
                    {zones.map((z) => (
                      <option key={z.id} value={z.id}>{z.name}</option>
                    ))}
                  </select>
                </div>
              </div>
              <div className="grid grid-cols-2 gap-3">
                <div>
                  <label className="block text-sm font-medium text-gray-700 mb-1">Vehicle Type</label>
                  <select
                    value={formData.vehicle_type}
                    onChange={(e) => setFormData({ ...formData, vehicle_type: e.target.value as RideVehicleType })}
                    className="w-full px-3 py-2 rounded-xl border border-gray-200 text-sm"
                  >
                    {vehicleTypes.map((v) => (
                      <option key={v} value={v}>{v.toUpperCase()}</option>
                    ))}
                  </select>
                </div>
                <div>
                  <label className="block text-sm font-medium text-gray-700 mb-1">Fare (MVR)</label>
                  <input
                    type="number"
                    step="0.01"
                    min="0"
                    value={formData.fare}
                    onChange={(e) => setFormData({ ...formData, fare: Number(e.target.value) })}
                    className="w-full px-3 py-2 rounded-xl border border-gray-200 text-sm"
                    required
                  />
                </div>
              </div>
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-1">Notes</label>
                <input
                  type="text"
                  value={formData.notes}
                  onChange={(e) => setFormData({ ...formData, notes: e.target.value })}
                  className="w-full px-3 py-2 rounded-xl border border-gray-200 text-sm"
                  placeholder="Optional internal notes"
                />
              </div>
              <div>
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
              <div className="flex gap-2 pt-2">
                <button
                  type="submit"
                  className="flex-1 inline-flex items-center justify-center gap-2 px-3 py-2 rounded-xl bg-medical-600 text-white text-sm font-semibold"
                >
                  <Save size={16} /> {editingRule ? 'Update' : 'Create'}
                </button>
                <button
                  type="button"
                  onClick={() => {
                    setShowForm(false)
                    setEditingRule(null)
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

        {!loading && rules.length === 0 ? (
          <div className="text-sm text-gray-500">No fare rules found. Add the first rule above.</div>
        ) : null}

        {rules.map((r) => (
          <div key={r.id} className="bg-white rounded-xl p-4 shadow-sm border border-gray-100">
            <div className="flex items-start justify-between gap-3">
              <div className="flex items-start gap-3 min-w-0">
                <div className="w-10 h-10 rounded-xl bg-medical-50 flex items-center justify-center shrink-0">
                  <DollarSign size={18} className="text-medical-600" />
                </div>
                <div className="min-w-0">
                  <div className="flex items-center gap-2 flex-wrap">
                    <span className="font-bold text-gray-900">{zoneNameById.get(r.origin_zone_id) || 'Unknown'}</span>
                    <ArrowRightLeft size={14} className="text-gray-400" />
                    <span className="font-bold text-gray-900">{zoneNameById.get(r.destination_zone_id) || 'Unknown'}</span>
                    {r.is_active ? (
                      <span className="inline-flex items-center gap-1 text-xs bg-green-50 text-green-700 px-2 py-0.5 rounded-full">
                        <CheckCircle2 size={12} /> Active
                      </span>
                    ) : (
                      <span className="inline-flex items-center gap-1 text-xs bg-gray-100 text-gray-600 px-2 py-0.5 rounded-full">
                        Inactive
                      </span>
                    )}
                  </div>
                  <div className="text-sm text-gray-700">
                    Vehicle: <span className="font-semibold">{r.vehicle_type.toUpperCase()}</span>
                  </div>
                  <div className="text-sm text-gray-700">
                    Fare: <span className="font-semibold">MVR {Number(r.fare).toFixed(2)}</span>
                  </div>
                  {r.notes ? <div className="text-xs text-gray-500 mt-1">{r.notes}</div> : null}
                </div>
              </div>
              <div className="flex flex-col gap-2 shrink-0">
                <button
                  onClick={() => handleEdit(r)}
                  className="inline-flex items-center gap-2 px-3 py-2 rounded-xl bg-white text-gray-800 text-sm font-semibold border border-gray-200"
                >
                  <Edit2 size={16} /> Edit
                </button>
                <button
                  onClick={() => toggleActive(r)}
                  className={`inline-flex items-center gap-2 px-3 py-2 rounded-xl text-sm font-semibold ${
                    r.is_active ? 'bg-amber-50 text-amber-700 border border-amber-200' : 'bg-green-50 text-green-700 border border-green-200'
                  }`}
                >
                  {r.is_active ? 'Deactivate' : 'Activate'}
                </button>
                <button
                  onClick={() => deleteRule(r.id)}
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
