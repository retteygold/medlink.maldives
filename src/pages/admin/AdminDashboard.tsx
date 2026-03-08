import { useState, useEffect } from 'react'
import { useNavigate } from 'react-router-dom'
import { 
  Building2, 
  Users, 
  Star, 
  LogOut, 
  Plus,
  ChevronRight,
  Activity,
  MessageCircle
} from 'lucide-react'
import { getDatabaseStats } from '../../lib/dataService'
import { supabase } from '../../lib/supabase'

export default function AdminDashboard() {
  const navigate = useNavigate()
  const [stats, setStats] = useState({
    hospitals: 0,
    doctors: 0,
    specialties: 0
  })

  useEffect(() => {
    loadStats()
  }, [])

  async function loadStats() {
    const data = await getDatabaseStats()
    setStats({
      hospitals: data.total_facilities,
      doctors: data.total_doctors,
      specialties: data.total_specialties
    })
  }

  const menuItems = [
    {
      title: 'Hospitals',
      description: 'Add, edit, or remove hospitals',
      icon: Building2,
      count: stats.hospitals,
      path: '/admin/hospitals',
      color: 'bg-blue-500'
    },
    {
      title: 'Doctors',
      description: 'Manage doctors and their details',
      icon: Users,
      count: stats.doctors,
      path: '/admin/doctors',
      color: 'bg-green-500'
    },
    {
      title: 'Community',
      description: 'Hide questions and answers',
      icon: MessageCircle,
      count: 0,
      path: '/admin/community',
      color: 'bg-indigo-500'
    },
    {
      title: 'Reviews & Comments',
      description: 'Manage customer reviews',
      icon: Star,
      count: 0,
      path: '/admin/reviews',
      color: 'bg-yellow-500'
    },
    {
      title: 'Medicine Help',
      description: 'Manage medicine requests',
      icon: MessageCircle,
      count: 0,
      path: '/admin/medicine-help',
      color: 'bg-pink-500'
    }
  ]

  async function handleLogout() {
    await supabase.auth.signOut()
    navigate('/admin/login')
  }

  return (
    <div className="min-h-screen bg-gray-50">
      {/* Header */}
      <div className="bg-medical-600 text-white px-4 pt-12 pb-6">
        <div className="flex justify-between items-center mb-4">
          <div className="flex items-center gap-3">
            <img src="/images/logo.png" alt="MedLink" className="w-10 h-10 rounded-xl" />
            <div>
              <h1 className="text-xl font-bold">Admin Dashboard</h1>
              <p className="text-white/80 text-sm">Manage your healthcare data</p>
            </div>
          </div>
          <button 
            onClick={handleLogout}
            className="p-2 bg-white/10 rounded-lg hover:bg-white/20 transition-colors"
          >
            <LogOut size={20} />
          </button>
        </div>

        {/* Quick Stats */}
        <div className="grid grid-cols-3 gap-3 mt-4">
          <div className="bg-white/10 rounded-xl p-3">
            <Building2 size={20} className="text-white/80 mb-1" />
            <p className="text-2xl font-bold">{stats.hospitals}</p>
            <p className="text-xs text-white/70">Hospitals</p>
          </div>
          <div className="bg-white/10 rounded-xl p-3">
            <Users size={20} className="text-white/80 mb-1" />
            <p className="text-2xl font-bold">{stats.doctors}</p>
            <p className="text-xs text-white/70">Doctors</p>
          </div>
          <div className="bg-white/10 rounded-xl p-3">
            <Activity size={20} className="text-white/80 mb-1" />
            <p className="text-2xl font-bold">{stats.specialties}</p>
            <p className="text-xs text-white/70">Specialties</p>
          </div>
        </div>
      </div>

      {/* Menu Items */}
      <div className="px-4 py-6 space-y-4">
        {menuItems.map((item) => (
          <button
            key={item.title}
            onClick={() => navigate(item.path)}
            className="w-full bg-white rounded-xl p-4 shadow-sm hover:shadow-md transition-all flex items-center gap-4"
          >
            <div className={`${item.color} text-white p-3 rounded-xl`}>
              <item.icon size={24} />
            </div>
            <div className="flex-1 text-left">
              <h3 className="font-bold text-gray-800">{item.title}</h3>
              <p className="text-sm text-gray-500">{item.description}</p>
            </div>
            <div className="text-right">
              <span className="text-lg font-bold text-medical-600">{item.count}</span>
              <ChevronRight size={20} className="text-gray-400" />
            </div>
          </button>
        ))}
      </div>

      {/* Quick Actions */}
      <div className="px-4 pb-6">
        <h2 className="text-lg font-bold text-gray-800 mb-3">Quick Actions</h2>
        <div className="grid grid-cols-2 gap-3">
          <button
            onClick={() => navigate('/admin/hospitals')}
            className="bg-medical-500 text-white p-4 rounded-xl flex items-center gap-2 hover:bg-medical-600 transition-colors"
          >
            <Plus size={20} />
            <span className="font-medium">Add Hospital</span>
          </button>
          <button
            onClick={() => navigate('/admin/doctors')}
            className="bg-green-500 text-white p-4 rounded-xl flex items-center gap-2 hover:bg-green-600 transition-colors"
          >
            <Plus size={20} />
            <span className="font-medium">Add Doctor</span>
          </button>
        </div>
      </div>
    </div>
  )
}
