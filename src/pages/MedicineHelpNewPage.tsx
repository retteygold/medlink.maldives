import { useState } from 'react'
import { useNavigate } from 'react-router-dom'
import { ChevronLeft, Upload, X, Save } from 'lucide-react'
import { createMedicineRequest, uploadMedicineRequestImage } from '../lib/dataService'

export default function MedicineHelpNewPage() {
  const navigate = useNavigate()
  const [saving, setSaving] = useState(false)
  const [error, setError] = useState<string | null>(null)

  const [title, setTitle] = useState('')
  const [medicineName, setMedicineName] = useState('')
  const [dosage, setDosage] = useState('')
  const [quantity, setQuantity] = useState('')
  const [neededBy, setNeededBy] = useState('')
  const [locationType, setLocationType] = useState('')
  const [atoll, setAtoll] = useState('')
  const [notes, setNotes] = useState('')

  const [prescriptionFile, setPrescriptionFile] = useState<File | null>(null)
  const [previousMedicineFile, setPreviousMedicineFile] = useState<File | null>(null)

  async function onSubmit(e: React.FormEvent) {
    e.preventDefault()
    setSaving(true)
    setError(null)

    try {
      const prescriptionPath = prescriptionFile ? await uploadMedicineRequestImage(prescriptionFile) : null
      const previousPath = previousMedicineFile ? await uploadMedicineRequestImage(previousMedicineFile) : null

      const created = await createMedicineRequest({
        title,
        medicine_name: medicineName,
        dosage,
        quantity: quantity ? Number(quantity) : null,
        needed_by: neededBy || null,
        location_type: locationType || null,
        atoll: atoll || null,
        notes,
        prescription_image_path: prescriptionPath,
        previous_medicine_image_path: previousPath
      })

      if (!created?.id) throw new Error('Failed to create request')
      navigate(`/medicine-help/${created.id}`, { replace: true })
    } catch (err: any) {
      setError(typeof err?.message === 'string' ? err.message : 'Failed to create request')
    } finally {
      setSaving(false)
    }
  }

  return (
    <div className="min-h-screen bg-gray-50 pb-20">
      <div className="bg-white px-4 pt-12 pb-4 shadow-sm">
        <div className="flex items-center gap-3">
          <button type="button" onClick={() => navigate(-1)} className="p-2 -ml-2">
            <ChevronLeft size={22} className="text-gray-600" />
          </button>
          <h1 className="text-xl font-bold text-gray-800">New Request</h1>
        </div>
        <p className="text-sm text-gray-500 mt-2">Please hide personal information in the prescription before uploading.</p>
      </div>

      <form onSubmit={onSubmit} className="p-4 space-y-4">
        {error && (
          <div className="bg-red-50 border border-red-200 text-red-700 rounded-xl p-3 text-sm">{error}</div>
        )}

        <div className="card p-4 space-y-3">
          <div>
            <label className="block text-sm font-medium text-gray-700 mb-1">Title</label>
            <input className="input-field" value={title} onChange={(e) => setTitle(e.target.value)} placeholder="e.g. Need insulin pen" />
          </div>

          <div>
            <label className="block text-sm font-medium text-gray-700 mb-1">Medicine name</label>
            <input className="input-field" value={medicineName} onChange={(e) => setMedicineName(e.target.value)} placeholder="e.g. Lantus" />
          </div>

          <div>
            <label className="block text-sm font-medium text-gray-700 mb-1">Dosage</label>
            <input className="input-field" value={dosage} onChange={(e) => setDosage(e.target.value)} placeholder="e.g. 100 IU/ml" />
          </div>

          <div className="grid grid-cols-2 gap-3">
            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1">Quantity</label>
              <input className="input-field" value={quantity} onChange={(e) => setQuantity(e.target.value)} placeholder="e.g. 2" inputMode="numeric" />
            </div>
            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1">Needed by</label>
              <input type="date" className="input-field" value={neededBy} onChange={(e) => setNeededBy(e.target.value)} />
            </div>
          </div>

          <div className="grid grid-cols-2 gap-3">
            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1">Location</label>
              <input className="input-field" value={locationType} onChange={(e) => setLocationType(e.target.value)} placeholder="Male / Hulhumale" />
            </div>
            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1">Atoll</label>
              <input className="input-field" value={atoll} onChange={(e) => setAtoll(e.target.value)} placeholder="Optional" />
            </div>
          </div>

          <div>
            <label className="block text-sm font-medium text-gray-700 mb-1">Notes</label>
            <textarea className="input-field" rows={3} value={notes} onChange={(e) => setNotes(e.target.value)} placeholder="Any extra info..." />
          </div>
        </div>

        <div className="card p-4 space-y-3">
          <label className="block text-sm font-medium text-gray-700">Prescription image</label>
          {prescriptionFile ? (
            <div className="flex items-center justify-between bg-gray-50 rounded-xl p-3">
              <div className="text-sm text-gray-700 truncate">{prescriptionFile.name}</div>
              <button type="button" onClick={() => setPrescriptionFile(null)} className="p-2">
                <X size={18} className="text-gray-500" />
              </button>
            </div>
          ) : (
            <label className="w-full border-2 border-dashed border-gray-300 rounded-xl p-4 flex items-center justify-center gap-2 cursor-pointer hover:border-medical-500">
              <Upload size={18} className="text-gray-400" />
              <span className="text-sm text-gray-600">Upload prescription</span>
              <input type="file" accept="image/*" className="hidden" onChange={(e) => setPrescriptionFile(e.target.files?.[0] || null)} />
            </label>
          )}

          <label className="block text-sm font-medium text-gray-700 mt-2">Previous medicine photo (optional)</label>
          {previousMedicineFile ? (
            <div className="flex items-center justify-between bg-gray-50 rounded-xl p-3">
              <div className="text-sm text-gray-700 truncate">{previousMedicineFile.name}</div>
              <button type="button" onClick={() => setPreviousMedicineFile(null)} className="p-2">
                <X size={18} className="text-gray-500" />
              </button>
            </div>
          ) : (
            <label className="w-full border-2 border-dashed border-gray-300 rounded-xl p-4 flex items-center justify-center gap-2 cursor-pointer hover:border-medical-500">
              <Upload size={18} className="text-gray-400" />
              <span className="text-sm text-gray-600">Upload medicine photo</span>
              <input type="file" accept="image/*" className="hidden" onChange={(e) => setPreviousMedicineFile(e.target.files?.[0] || null)} />
            </label>
          )}
        </div>

        <button type="submit" disabled={saving} className="btn-primary w-full flex items-center justify-center gap-2 disabled:opacity-50">
          <Save size={18} />
          {saving ? 'Posting...' : 'Post request'}
        </button>
      </form>
    </div>
  )
}
