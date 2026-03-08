import { useState } from 'react'
import { useNavigate } from 'react-router-dom'
import { 
  ArrowLeft, 
  Send,
  Camera,
  Image as ImageIcon
} from 'lucide-react'
import { createQuestion } from '../lib/dataService'
import { useLanguage } from '../lib/languageContext'

export default function AskQuestionPage() {
  const navigate = useNavigate()
  const { language, isRTL } = useLanguage()
  const [title, setTitle] = useState('')
  const [content, setContent] = useState('')
  const [category, setCategory] = useState('General')
  const [isSubmitting, setIsSubmitting] = useState(false)
  const [error, setError] = useState<string | null>(null)

  const categories = [
    'Recommendations',
    'Doctor Reviews',
    'Emergency',
    'General',
    'Insurance',
    'Medications',
    'Symptoms'
  ]

  async function handleSubmit(e: React.FormEvent) {
    e.preventDefault()
    if (!title.trim() || !content.trim()) return

    setIsSubmitting(true)
    setError(null)

    try {
      await createQuestion({
        title: title.trim(),
        content: content.trim(),
        category,
        author_name: 'Anonymous'
      })
      navigate('/community')
    } catch (err) {
      console.error('Failed to post question:', err)
      setError('Failed to post question. Please try again.')
    } finally {
      setIsSubmitting(false)
    }
  }

  return (
    <div className="min-h-screen bg-gray-50">
      {/* Header */}
      <div className="gradient-header px-4 pt-12 pb-6">
        <div className="flex items-center gap-3 mb-4">
          <button 
            onClick={() => navigate('/community')}
            className="p-2 bg-white/10 rounded-lg hover:bg-white/20 transition-colors"
          >
            <ArrowLeft size={20} className="text-white" />
          </button>
          <div>
            <h1 className="text-xl font-bold text-white">Ask a Question</h1>
            <p className="text-white/80 text-sm">Get help from the community</p>
          </div>
        </div>
      </div>

      {/* Form */}
      <form onSubmit={handleSubmit} className="px-4 py-6 space-y-4">
        {error && (
          <div className="bg-red-50 text-red-700 border border-red-200 rounded-xl p-3 text-sm">
            {error}
          </div>
        )}
        {/* Category */}
        <div className="bg-white rounded-xl p-4">
          <label className="block text-sm font-medium text-gray-700 mb-2">
            Category *
          </label>
          <div className="flex flex-wrap gap-2">
            {categories.map(cat => (
              <button
                key={cat}
                type="button"
                onClick={() => setCategory(cat)}
                className={`px-3 py-1.5 rounded-full text-sm font-medium transition-colors ${
                  category === cat
                    ? 'bg-medical-500 text-white'
                    : 'bg-gray-100 text-gray-600 hover:bg-gray-200'
                }`}
              >
                {cat}
              </button>
            ))}
          </div>
        </div>

        {/* Title */}
        <div className="bg-white rounded-xl p-4">
          <label className="block text-sm font-medium text-gray-700 mb-2">
            Question Title *
          </label>
          <input
            type="text"
            required
            value={title}
            onChange={(e) => setTitle(e.target.value)}
            className={`input-field ${isRTL ? 'input-field-rtl' : ''}`}
            placeholder={isRTL ? 'މިސާލަކަށް: މާލޭގައި ކާޑިއޮލޮޖީގައި އެންމެ ރަނގަޅު ހޮސްޕިޓަލް؟' : 'e.g., Best hospital for cardiology in Malé?'}
            lang={language === 'dv' ? 'dv' : 'en'}
            dir={isRTL ? 'rtl' : 'ltr'}
          />
          <p className="text-xs text-gray-500 mt-1">
            {isRTL ? 'ރަނގަޅު ޖަވާބުތައް ހޯދުމަށް މަޢުލޫމާތު ދެއްކުމަށް' : 'Be specific and concise to get better answers'}
          </p>
        </div>

        {/* Content */}
        <div className="bg-white rounded-xl p-4">
          <label className="block text-sm font-medium text-gray-700 mb-2">
            Details *
          </label>
          <textarea
            required
            rows={6}
            value={content}
            onChange={(e) => setContent(e.target.value)}
            className={`input-field resize-none ${isRTL ? 'input-field-rtl' : ''}`}
            placeholder={isRTL ? 'ތަކުރާރު ތަފްސީލުކޮށް ލިޔޭ... ތަކުރާރު، ދިމާވާ ސަރަޙައްދު، ބަޖެޓް ފަދަ މަޢުލޫމާތު ހިމެނުއްވާ.' : 'Describe your question in detail. Include relevant information like symptoms, location preferences, budget, etc.'}
            lang={language === 'dv' ? 'dv' : 'en'}
            dir={isRTL ? 'rtl' : 'ltr'}
            maxLength={1000}
          />
          <p className="text-xs text-gray-500 mt-1">
            {content.length}/1000 characters
          </p>
        </div>

        {/* Attachments */}
        <div className="bg-white rounded-xl p-4">
          <label className="block text-sm font-medium text-gray-700 mb-2">
            Attachments (optional)
          </label>
          <div className="flex gap-3">
            <button
              type="button"
              className="flex-1 border-2 border-dashed border-gray-300 rounded-xl p-4 flex flex-col items-center justify-center gap-2 hover:border-medical-500 transition-colors"
            >
              <Camera size={24} className="text-gray-400" />
              <span className="text-sm text-gray-500">Take Photo</span>
            </button>
            <button
              type="button"
              className="flex-1 border-2 border-dashed border-gray-300 rounded-xl p-4 flex flex-col items-center justify-center gap-2 hover:border-medical-500 transition-colors"
            >
              <ImageIcon size={24} className="text-gray-400" />
              <span className="text-sm text-gray-500">Upload Image</span>
            </button>
          </div>
          <p className="text-xs text-gray-500 mt-2">
            You can attach screenshots, reports, or relevant images
          </p>
        </div>

        {/* Guidelines */}
        <div className="bg-blue-50 rounded-xl p-4">
          <h4 className="font-medium text-blue-800 mb-2">Community Guidelines</h4>
          <ul className="text-sm text-blue-700 space-y-1 list-disc list-inside">
            <li>Be respectful and helpful</li>
            <li>No personal attacks or harassment</li>
            <li>Don't share personal medical information</li>
            <li>This is not a substitute for professional medical advice</li>
          </ul>
        </div>

        {/* Submit */}
        <div className="flex gap-3 pt-4">
          <button
            type="button"
            onClick={() => navigate('/community')}
            className="flex-1 btn-secondary"
          >
            Cancel
          </button>
          <button
            type="submit"
            disabled={isSubmitting || !title.trim() || !content.trim()}
            className="flex-1 btn-primary flex items-center justify-center gap-2 disabled:opacity-50 disabled:cursor-not-allowed"
          >
            {isSubmitting ? (
              <span>Posting...</span>
            ) : (
              <>
                <Send size={18} />
                Post Question
              </>
            )}
          </button>
        </div>
      </form>
    </div>
  )
}
