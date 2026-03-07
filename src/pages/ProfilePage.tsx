export default function ProfilePage() {
  return (
    <div className="min-h-screen bg-gray-50 pb-20">
      <div className="bg-white px-4 pt-12 pb-4 shadow-sm">
        <h1 className="text-xl font-bold text-gray-800">Profile</h1>
      </div>
      <div className="p-4">
        <div className="card p-6 text-center">
          <div className="w-20 h-20 bg-medical-100 rounded-full flex items-center justify-center mx-auto mb-4">
            <span className="text-medical-700 text-2xl font-bold">U</span>
          </div>
          <h2 className="font-bold text-lg text-gray-800">User Profile</h2>
          <p className="text-gray-500 text-sm mt-1">Sign in to access your saved doctors and appointments</p>
          <button className="btn-primary w-full mt-4">Sign In</button>
        </div>
      </div>
    </div>
  )
}
