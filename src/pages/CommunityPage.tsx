import { useState, useEffect } from 'react'
import { useNavigate } from 'react-router-dom'
import { 
  ArrowLeft, 
  Plus, 
  Search, 
  MessageCircle,
  ThumbsUp,
  MessageSquare,
  User,
  Clock,
  ChevronRight
} from 'lucide-react'
import { getQuestions } from '../lib/dataService'

interface Question {
  id: string
  title: string
  content: string
  author: string
  date: string
  category: string
  answers_count: number
  views: number
  likes: number
}

export default function CommunityPage() {
  const navigate = useNavigate()
  const [questions, setQuestions] = useState<Question[]>([])
  const [searchQuery, setSearchQuery] = useState('')
  const [selectedCategory, setSelectedCategory] = useState('All')

  const [loading, setLoading] = useState(true)
  const [error, setError] = useState<string | null>(null)

  useEffect(() => {
    loadQuestions()
  }, [])

  async function loadQuestions() {
    try {
      setLoading(true)
      setError(null)
      const data = await getQuestions()

      const mapped: Question[] = (data || []).map((q: any) => {
        const createdAt = q.created_at ? new Date(q.created_at) : null
        return {
          id: String(q.id),
          title: String(q.title || ''),
          content: String(q.content || ''),
          author: String(q.author_name || q.author || 'Anonymous'),
          date: createdAt ? createdAt.toLocaleDateString() : '',
          category: String(q.category || 'General'),
          answers_count: Number(q.answers_count || 0),
          views: Number(q.views || 0),
          likes: Number(q.likes || 0)
        }
      })

      setQuestions(mapped)
    } catch (err) {
      console.error('Failed to load questions:', err)
      setError('Failed to load questions. Please try again.')
      setQuestions([])
    } finally {
      setLoading(false)
    }
  }

  const categories = ['All', 'Recommendations', 'Doctor Reviews', 'Emergency', 'General', 'Insurance']

  const filteredQuestions = questions.filter(q => {
    const qSearch = searchQuery.trim().toLowerCase()
    const matchesSearch =
      !qSearch ||
      q.title.toLowerCase().includes(qSearch) ||
      q.content.toLowerCase().includes(qSearch) ||
      q.author.toLowerCase().includes(qSearch) ||
      q.category.toLowerCase().includes(qSearch)
    const matchesCategory = selectedCategory === 'All' || q.category === selectedCategory
    return matchesSearch && matchesCategory
  })

  return (
    <div className="min-h-screen bg-gray-50 pb-20">
      {/* Header */}
      <div className="gradient-header px-4 pt-12 pb-6">
        <div className="flex items-center gap-3 mb-4">
          <button 
            onClick={() => navigate('/')}
            className="p-2 bg-white/10 rounded-lg hover:bg-white/20 transition-colors"
          >
            <ArrowLeft size={20} className="text-white" />
          </button>
          <div>
            <h1 className="text-xl font-bold text-white">Community</h1>
            <p className="text-white/80 text-sm">Ask questions, share experiences</p>
          </div>
        </div>

        {/* Search */}
        <div className="relative">
          <Search className="absolute left-4 top-1/2 -translate-y-1/2 text-gray-400" size={20} />
          <input
            type="text"
            placeholder="Search questions..."
            className="w-full pl-12 pr-14 py-3 rounded-xl bg-white text-gray-800 placeholder-gray-400 focus:outline-none"
            value={searchQuery}
            onChange={(e) => setSearchQuery(e.target.value)}
          />
          <button
            type="button"
            onClick={() => setSearchQuery((v) => v.trim())}
            className="absolute right-2 top-1/2 -translate-y-1/2 h-9 w-9 rounded-lg bg-medical-500 hover:bg-medical-600 transition-colors flex items-center justify-center"
            aria-label="Search"
          >
            <Search size={16} className="text-white" />
          </button>
        </div>
      </div>

      {/* Categories */}
      <div className="px-4 py-4">
        <div className="flex gap-2 overflow-x-auto pb-2 scrollbar-hide">
          {categories.map(cat => (
            <button
              key={cat}
              onClick={() => setSelectedCategory(cat)}
              className={`px-4 py-2 rounded-full text-sm font-medium whitespace-nowrap transition-colors ${
                selectedCategory === cat
                  ? 'bg-medical-500 text-white'
                  : 'bg-white text-gray-600 border border-gray-200'
              }`}
            >
              {cat}
            </button>
          ))}
        </div>
      </div>

      {/* Ask Question Button */}
      <div className="px-4 pb-4">
        <button
          onClick={() => navigate('/ask')}
          className="w-full bg-medical-500 text-white py-3 rounded-xl font-medium flex items-center justify-center gap-2 hover:bg-medical-600 transition-colors shadow-lg shadow-medical-500/30"
        >
          <Plus size={20} />
          Ask a Question
        </button>
      </div>

      {/* Questions List */}
      <div className="px-4 space-y-4">
        {loading ? (
          <div className="text-sm text-gray-500">Loading...</div>
        ) : error ? (
          <div className="flex flex-col gap-2">
            <div className="text-sm text-red-600">{error}</div>
            <button onClick={loadQuestions} className="text-sm text-medical-600 font-medium underline">
              Retry
            </button>
          </div>
        ) : (
          filteredQuestions.map((question) => (
            <button
              key={question.id}
              onClick={() => navigate(`/question/${question.id}`)}
              className="w-full bg-white rounded-xl p-4 text-left shadow-sm hover:shadow-md transition-all"
            >
              {/* Category & Author */}
              <div className="flex items-center gap-2 mb-2">
                <span className="text-xs bg-medical-50 text-medical-600 px-2 py-1 rounded-full font-medium">
                  {question.category}
                </span>
                <span className="text-xs text-gray-400">•</span>
                <span className="text-xs text-gray-500 flex items-center gap-1">
                  <User size={12} />
                  {question.author}
                </span>
              </div>

              {/* Title */}
              <h3 className="font-bold text-gray-800 mb-2 line-clamp-2">{question.title}</h3>
              
              {/* Preview */}
              <p className="text-sm text-gray-600 line-clamp-2 mb-3">{question.content}</p>

              {/* Stats */}
              <div className="flex items-center justify-between">
                <div className="flex items-center gap-4 text-sm text-gray-500">
                  <span className="flex items-center gap-1">
                    <MessageSquare size={14} />
                    {question.answers_count} answers
                  </span>
                  <span className="flex items-center gap-1">
                    <ThumbsUp size={14} />
                    {question.likes} likes
                  </span>
                  <span className="flex items-center gap-1">
                    <Clock size={14} />
                    {question.date}
                  </span>
                </div>
                <ChevronRight size={20} className="text-gray-400" />
              </div>
            </button>
          ))
        )}
      </div>

      {/* Empty State */}
      {!loading && !error && filteredQuestions.length === 0 && (
        <div className="px-4 py-12 text-center">
          <MessageCircle size={48} className="text-gray-300 mx-auto mb-4" />
          <p className="text-gray-500">No questions found</p>
          <button
            onClick={() => navigate('/ask')}
            className="mt-4 text-medical-600 font-medium"
          >
            Be the first to ask!
          </button>
        </div>
      )}
    </div>
  )
}
