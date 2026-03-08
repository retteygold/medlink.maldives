import { useEffect, useState } from 'react'
import { useNavigate } from 'react-router-dom'
import { ArrowLeft, EyeOff, Eye, RefreshCw } from 'lucide-react'
import { supabase } from '../../lib/supabase'

type QuestionRow = {
  id: string
  title: string
  content: string
  category: string | null
  author_name: string | null
  created_at: string
  is_active: boolean
}

type AnswerRow = {
  id: string
  question_id: string
  content: string
  author_name: string | null
  created_at: string
  is_active: boolean
}

export default function AdminCommunity() {
  const navigate = useNavigate()
  const [questions, setQuestions] = useState<QuestionRow[]>([])
  const [selectedQuestionId, setSelectedQuestionId] = useState<string | null>(null)
  const [answers, setAnswers] = useState<AnswerRow[]>([])
  const [loading, setLoading] = useState(true)
  const [loadingAnswers, setLoadingAnswers] = useState(false)
  const [error, setError] = useState<string | null>(null)

  useEffect(() => {
    loadQuestions()
  }, [])

  useEffect(() => {
    if (!selectedQuestionId) {
      setAnswers([])
      return
    }
    loadAnswers(selectedQuestionId)
  }, [selectedQuestionId])

  async function loadQuestions() {
    try {
      setLoading(true)
      setError(null)
      const { data, error: qError } = await supabase
        .from('questions')
        .select('id,title,content,category,author_name,created_at,is_active')
        .order('created_at', { ascending: false })

      if (qError) throw qError
      setQuestions((data || []) as QuestionRow[])

      if (!selectedQuestionId && (data || []).length > 0) {
        setSelectedQuestionId(String((data as any[])[0].id))
      }
    } catch (e: any) {
      console.error(e)
      setError(e?.message || 'Failed to load questions')
      setQuestions([])
    } finally {
      setLoading(false)
    }
  }

  async function loadAnswers(questionId: string) {
    try {
      setLoadingAnswers(true)
      const { data, error: aError } = await supabase
        .from('answers')
        .select('id,question_id,content,author_name,created_at,is_active')
        .eq('question_id', questionId)
        .order('created_at', { ascending: false })

      if (aError) throw aError
      setAnswers((data || []) as AnswerRow[])
    } catch (e) {
      console.error(e)
      setAnswers([])
    } finally {
      setLoadingAnswers(false)
    }
  }

  async function setQuestionActive(questionId: string, isActive: boolean) {
    const { error: uError } = await supabase.from('questions').update({ is_active: isActive }).eq('id', questionId)
    if (uError) {
      setError(uError.message)
      return
    }
    await loadQuestions()
  }

  async function setAnswerActive(answerId: string, isActive: boolean) {
    const { error: uError } = await supabase.from('answers').update({ is_active: isActive }).eq('id', answerId)
    if (uError) {
      setError(uError.message)
      return
    }
    if (selectedQuestionId) {
      await loadAnswers(selectedQuestionId)
    }
  }

  return (
    <div className="min-h-screen bg-gray-50">
      <div className="bg-white px-4 pt-12 pb-4 shadow-sm">
        <div className="flex items-center justify-between">
          <button
            onClick={() => navigate('/admin')}
            className="p-2 rounded-lg hover:bg-gray-100"
          >
            <ArrowLeft size={20} className="text-gray-700" />
          </button>
          <h1 className="text-lg font-bold text-gray-800">Community Moderation</h1>
          <button
            onClick={loadQuestions}
            className="p-2 rounded-lg hover:bg-gray-100"
            aria-label="Refresh"
          >
            <RefreshCw size={18} className="text-gray-700" />
          </button>
        </div>

        {error && (
          <div className="mt-3 bg-red-50 border border-red-200 text-red-700 rounded-xl p-3 text-sm">
            {error}
          </div>
        )}
      </div>

      <div className="px-4 py-4">
        {loading ? (
          <div className="text-sm text-gray-500">Loading...</div>
        ) : (
          <div className="grid grid-cols-1 gap-4">
            <div className="bg-white rounded-xl shadow-sm overflow-hidden">
              <div className="px-4 py-3 border-b flex items-center justify-between">
                <div className="font-bold text-gray-800">Questions</div>
                <div className="text-xs text-gray-500">{questions.length}</div>
              </div>
              <div className="max-h-[380px] overflow-auto">
                {questions.map((q) => (
                  <button
                    key={q.id}
                    onClick={() => setSelectedQuestionId(q.id)}
                    className={`w-full text-left px-4 py-3 border-b hover:bg-gray-50 ${selectedQuestionId === q.id ? 'bg-medical-50' : ''}`}
                  >
                    <div className="flex items-start justify-between gap-3">
                      <div className="min-w-0">
                        <div className="font-medium text-gray-800 truncate">{q.title}</div>
                        <div className="text-xs text-gray-500 truncate">
                          {(q.author_name || 'Anonymous') + ' • ' + (q.category || 'General')}
                        </div>
                      </div>
                      <div className="shrink-0">
                        {q.is_active ? (
                          <span className="text-xs bg-green-50 text-green-700 px-2 py-1 rounded-full">Active</span>
                        ) : (
                          <span className="text-xs bg-gray-100 text-gray-600 px-2 py-1 rounded-full">Hidden</span>
                        )}
                      </div>
                    </div>
                  </button>
                ))}
                {questions.length === 0 && (
                  <div className="px-4 py-6 text-sm text-gray-500">No questions.</div>
                )}
              </div>
            </div>

            <div className="bg-white rounded-xl shadow-sm overflow-hidden">
              <div className="px-4 py-3 border-b flex items-center justify-between">
                <div className="font-bold text-gray-800">Details</div>
                <button
                  type="button"
                  onClick={() => selectedQuestionId && loadAnswers(selectedQuestionId)}
                  className="text-xs text-medical-600 font-medium flex items-center gap-1"
                >
                  <RefreshCw size={14} />
                  Refresh
                </button>
              </div>

              {!selectedQuestionId ? (
                <div className="px-4 py-6 text-sm text-gray-500">Select a question to manage.</div>
              ) : (
                <div className="px-4 py-4 space-y-3">
                  {(() => {
                    const q = questions.find((x) => x.id === selectedQuestionId)
                    if (!q) return null
                    return (
                      <div className="rounded-xl border border-gray-200 p-3">
                        <div className="font-bold text-gray-800">{q.title}</div>
                        <div className="text-sm text-gray-600 mt-1">{q.content}</div>
                        <div className="text-xs text-gray-500 mt-2">
                          {(q.author_name || 'Anonymous') + ' • ' + (q.category || 'General')}
                        </div>
                        <div className="mt-3 flex gap-2">
                          {q.is_active ? (
                            <button
                              onClick={() => setQuestionActive(q.id, false)}
                              className="flex-1 bg-gray-900 text-white py-2 rounded-xl text-sm font-medium flex items-center justify-center gap-2"
                            >
                              <EyeOff size={16} />
                              Hide
                            </button>
                          ) : (
                            <button
                              onClick={() => setQuestionActive(q.id, true)}
                              className="flex-1 bg-medical-500 text-white py-2 rounded-xl text-sm font-medium flex items-center justify-center gap-2"
                            >
                              <Eye size={16} />
                              Unhide
                            </button>
                          )}
                        </div>
                      </div>
                    )
                  })()}

                  <div className="rounded-xl border border-gray-200 overflow-hidden">
                    <div className="px-3 py-2 border-b text-sm font-bold text-gray-800">Answers</div>
                    {loadingAnswers ? (
                      <div className="px-3 py-4 text-sm text-gray-500">Loading...</div>
                    ) : answers.length === 0 ? (
                      <div className="px-3 py-4 text-sm text-gray-500">No answers.</div>
                    ) : (
                      <div className="divide-y">
                        {answers.map((a) => (
                          <div key={a.id} className="px-3 py-3">
                            <div className="text-sm text-gray-800">{a.content}</div>
                            <div className="text-xs text-gray-500 mt-1">{a.author_name || 'Anonymous'}</div>
                            <div className="mt-2">
                              {a.is_active ? (
                                <button
                                  onClick={() => setAnswerActive(a.id, false)}
                                  className="text-xs bg-gray-900 text-white px-3 py-1.5 rounded-lg inline-flex items-center gap-1"
                                >
                                  <EyeOff size={14} />
                                  Hide
                                </button>
                              ) : (
                                <button
                                  onClick={() => setAnswerActive(a.id, true)}
                                  className="text-xs bg-medical-500 text-white px-3 py-1.5 rounded-lg inline-flex items-center gap-1"
                                >
                                  <Eye size={14} />
                                  Unhide
                                </button>
                              )}
                            </div>
                          </div>
                        ))}
                      </div>
                    )}
                  </div>
                </div>
              )}
            </div>
          </div>
        )}
      </div>
    </div>
  )
}
