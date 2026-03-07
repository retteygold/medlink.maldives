import { Heart, Mail, Phone, ExternalLink } from 'lucide-react'

export function Footer() {
  return (
    <footer className="bg-gradient-to-br from-gray-900 via-gray-800 to-medical-900 text-white py-8 px-4 rounded-t-3xl mt-4">
      {/* Logo & Tagline */}
      <div className="text-center mb-6">
        <div className="flex items-center justify-center gap-2 mb-2">
          <img src="/images/logo.png" alt="MedLink" className="w-8 h-8 rounded-lg" />
          <span className="text-xl font-bold">MedLink Maldives</span>
        </div>
        <p className="text-gray-300 text-sm">Connecting you to healthcare since 2019</p>
      </div>

      {/* Quick Links */}
      <div className="flex justify-center gap-6 mb-6 text-sm">
        <a href="/" className="text-gray-300 hover:text-white transition-colors">Home</a>
        <a href="/doctors" className="text-gray-300 hover:text-white transition-colors">Doctors</a>
        <a href="/hospitals" className="text-gray-300 hover:text-white transition-colors">Hospitals</a>
        <a href="/community" className="text-gray-300 hover:text-white transition-colors">Community</a>
      </div>

      {/* Contact Info */}
      <div className="flex flex-col items-center gap-2 mb-6 text-sm text-gray-400">
        <div className="flex items-center gap-2">
          <Mail size={14} />
          <span>support@medlink.mv</span>
        </div>
        <div className="flex items-center gap-2">
          <Phone size={14} />
          <span>Emergency: 102</span>
        </div>
      </div>

      {/* Divider */}
      <div className="border-t border-gray-700 my-4"></div>

      {/* Powered By */}
      <div className="flex flex-col items-center gap-2">
        <div className="flex items-center gap-2 text-sm">
          <span className="text-gray-400">Powered by</span>
          <a 
            href="https://rettswebdev.com" 
            target="_blank" 
            rel="noopener noreferrer"
            className="font-semibold text-medical-400 hover:text-medical-300 transition-colors flex items-center gap-1"
          >
            Retts Web Dev
            <ExternalLink size={12} />
          </a>
        </div>
        
        <div className="flex items-center gap-1 text-xs text-gray-500">
          <span>Made with</span>
          <Heart size={12} className="text-red-500 fill-red-500" />
          <span>in Maldives</span>
        </div>
        
        <p className="text-xs text-gray-600 mt-2">
          © 2019 - {new Date().getFullYear()} MedLink Maldives. All rights reserved.
        </p>
      </div>
    </footer>
  )
}
