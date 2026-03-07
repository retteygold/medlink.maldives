import { useState, useEffect } from 'react'
import { useNavigate, useParams } from 'react-router-dom'
import { 
  ArrowLeft, 
  Send,
  ThumbsUp,
  User,
  Clock,
  MessageSquare,
  Share2,
  Flag,
  MoreVertical
} from 'lucide-react'

interface Answer {
  id: string
  content: string
  author: string
  author_type: 'patient' | 'doctor' | 'admin'
  date: string
  likes: number
  is_accepted: boolean
}

interface Question {
  id: string
  title: string
  content: string
  author: string
  date: string
  category: string
  views: number
  likes: number
  answers: Answer[]
}

export default function QuestionDetailPage() {
  const navigate = useNavigate()
  const { id } = useParams()
  const [question, setQuestion] = useState<Question | null>(null)
  const [newAnswer, setNewAnswer] = useState('')
  const [isSubmitting, setIsSubmitting] = useState(false)
  const [liked, setLiked] = useState(false)

  // Mock question data
  const mockQuestion: Question = {
    id: id || '1',
    title: 'Best hospital for cardiology in Malé?',
    content: 'Looking for recommendations for a good cardiologist. My father has been experiencing chest pain and shortness of breath. We visited a local clinic but they recommended seeing a specialist. Has anyone had a good experience with a cardiologist at IGMH or ADK? What about the waiting times and costs? Any advice would be greatly appreciated!',
    author: 'Ahmed Naseem',
    date: '2 hours ago',
    category: 'Recommendations',
    views: 124,
    likes: 12,
    answers: [
      {
        id: '1',
        content: 'I highly recommend Dr. Ibrahim at IGMH. He diagnosed my father\'s heart condition accurately and the treatment was excellent. The waiting time was about 30 minutes but worth it. Consultation fee was around MVR 300.',
        author: 'Mohamed Ali',
        author_type: 'patient',
        date: '1 hour ago',
        likes: 8,
        is_accepted: true
      },
      {
        id: '2',
        content: 'ADK Hospital also has a good cardiology department. Dr. Fathimath is very experienced. You can book appointments online which saves waiting time.',
        author: 'Fatima Hassan',
        author_type: 'patient',
        date: '45 minutes ago',
        likes: 5,
        is_accepted: false
      },
      {
        id: '3',
        content: 'For chest pain and breathing difficulties, please seek immediate medical attention if symptoms worsen. Both IGMH and ADK have 24/7 emergency services. If you\'re experiencing severe chest pain, call 102 for ambulance.',
        author: 'Dr. Ahmed (Cardiologist)',
        author_type: 'doctor',
        date: '30 minutes ago',
        likes: 15,
        is_accepted: false
      }
    ]
  }

  useEffect(() => {
    // TODO: Load question from database
    setQuestion(mockQuestion)
  }, [id])

  function handleSubmitAnswer(e: React.FormEvent) {
    e.preventDefault()
    if (!newAnswer.trim()) return

    setIsSubmitting(true)
    
    // Simulate API call
    setTimeout(() => {
      const answer: Answer = {
        id: Date.now().toString(),
        content: newAnswer,
        author: 'You',
        author_type: 'patient',
        date: 'Just now',
        likes: 0,
        is_accepted: false
      }
      
      setQuestion(prev => prev ? {
        ...prev,
        answers: [...prev.answers, answer]
      } : null)
      
      setNewAnswer('')
      setIsSubmitting(false)
    }, 500)
  }

  function handleLike() {
    setLiked(!liked)
    setQuestion(prev => prev ? {
      ...prev,
      likes: liked ? prev.likes - 1 : prev.likes + 1
    } : null)
  }

  if (!question) {
    return (
      <div className="min-h-screen bg-gray-50 flex items-center justify-center">
        <p className="text-gray-500">Loading...</p>
      </div>
    )
  }

  return (
    <div className="min-h-screen bg-gray-50 pb-24">
      {/* Header */}
      <div className="gradient-header px-4 pt-12 pb-6">
        <div className="flex items-center gap-3 mb-4">
          <button 
            onClick={() => navigate('/community')}
            className="p-2 bg-white/10 rounded-lg hover:bg-white/20 transition-colors"
          >
            <ArrowLeft size={20} className="text-white" />
          </button>
          <h1 className="text-lg font-bold text-white line-clamp-1">Question</h1>
        </div>
      </div>

      {/* Question */}
      <div className="px-4 py-4">
        <div className="bg-white rounded-xl p-4 shadow-sm">
          {/* Category & Author */}
          <div className="flex items-center gap-2 mb-3">
            <span className="text-xs bg-medical-50 text-medical-600 px-2 py-1 rounded-full font-medium">
              {question.category}
            </span>
            <span className="text-xs text-gray-400">•</span>
            <span className="text-xs text-gray-500 flex items-center gap-1">
              <User size={10} />
              {question.author}
            </span>
            <span className="text-xs text-gray-400">•</span>
            <span className="text-xs text-gray-500 flex items-center gap-1">
              <Clock size={10} />
              {question.date}
            </span>
          </div>

          {/* Title */}
          <h2 className="text-lg font-bold text-gray-800 mb-3">{question.title}</h2>
          
          {/* Content */}
          <p className="text-gray-600 mb-4">{question.content}</p>

          {/* Stats & Actions */}
          <div className="flex items-center justify-between pt-4 border-t">
            <div className="flex items-center gap-4">
              <button 
                onClick={handleLike}
                className={`flex items-center gap-1 text-sm ${liked ? 'text-medical-600' : 'text-gray-500'}`}
              >
                <ThumbsUp size={16} className={liked ? 'fill-current' : ''} />
                {question.likes} likes
              </button>
              <span className="flex items-center gap-1 text-sm text-gray-500">
                <MessageSquare size={16} />
                {question.answers.length} answers
              </span>
              <span className="text-sm text-gray-500">
                {question.views} views
              </span>
            </div>
            <div className="flex items-center gap-2">
              <button className="p-2 hover:bg-gray-100 rounded-lg">
                <Share2 size={18} className="text-gray-500" />
              </button>
              <button className="p-2 hover:bg-gray-100 rounded-lg">
                <MoreVertical size={18} className="text-gray-500" />
              </button>
            </div>
          </div>
        </div>
      </div>

      {/* Answers */}
      <div className="px-4 space-y-4">
        <h3 className="font-bold text-gray-800 flex items-center gap-2">
          Answers 
          <span className="bg-gray-100 text-gray-600 px-2 py-0.5 rounded-full text-sm">
            {question.answers.length}
          </span>
        </h3>

        {question.answers.map((answer) => (
          <div 
            key={answer.id} 
            className={`bg-white rounded-xl p-4 shadow-sm ${answer.is_accepted ? 'border-2 border-green-500' : ''}`}
          >
            {/* Author */}
            <div className="flex items-center gap-3 mb-3">
              <div className={`w-10 h-10 rounded-full flex items-center justify-center ${
                answer.author_type === 'doctor' 
                  ? 'bg-medical-100 text-medical-600' 
                  : 'bg-gray-100 text-gray-600'
              }`}>
                <User size={20} />
              </div>
              <div>
                <h4 className="font-medium text-gray-800">{answer.author}</h4>
                <div className="flex items-center gap-2 text-xs text-gray-500">
                  {answer.author_type === 'doctor' && (
                    <span className="bg-medical-50 text-medical-600 px-1.5 py-0.5 rounded">
                      Verified Doctor
                    </span>
                  )}
                  <span>{answer.date}</span>
                </div>
              </div>
              {answer.is_accepted && (
                <span className="ml-auto bg-green-50 text-green-600 px-2 py-1 rounded-full text-xs font-medium">
                  ✓ Accepted
                </span>
              )}
            </div>

            {/* Content */}
            <p className="text-gray-600 mb-3">{answer.content}</p>

            {/* Actions */}
            <div className="flex items-center gap-4 pt-3 border-t">
              <button className="flex items-center gap-1 text-sm text-gray-500 hover:text-medical-600">
                <ThumbsUp size={14} />
                {answer.likes} helpful
              </button>
              <button className="flex items-center gap-1 text-sm text-gray-500 hover:text-red-600">
                <Flag size={14} />
                Report
              </button>
            </div>
          </div>
        ))}
      </div>

      {/* Answer Input */}
      <div className="fixed bottom-0 left-0 right-0 bg-white border-t border-gray-200 p-4 safe-bottom max-w-md mx-auto">
        <form onSubmit={handleSubmitAnswer} className="flex gap-2">
          <input
            type="text"
            value={newAnswer}
            onChange={(e) => setNewAnswer(e.target.value)}
            placeholder="Write your answer..."
            className="flex-1 input-field py-3"
          />
          <button
            type="submit"
            disabled={isSubmitting || !newAnswer.trim()}
            className="bg-medical-500 text-white p-3 rounded-xl hover:bg-medical-600 transition-colors disabled:opacity-50"
          >
            <Send size={20} />
          </button>
        </form>
      </div>
    </div>
  )
}
