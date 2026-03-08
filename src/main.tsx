import React from 'react'
import ReactDOM from 'react-dom/client'
import { BrowserRouter } from 'react-router-dom'
import App from './App'
import { LanguageProvider } from './lib/languageContext'
import { RTLWrapper } from './components/RTLWrapper'
import './index.css'

ReactDOM.createRoot(document.getElementById('root')!).render(
  <React.StrictMode>
    <BrowserRouter>
      <LanguageProvider>
        <RTLWrapper>
          <App />
        </RTLWrapper>
      </LanguageProvider>
    </BrowserRouter>
  </React.StrictMode>,
)
