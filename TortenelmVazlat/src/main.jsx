import 'bootstrap/dist/css/bootstrap.min.css'
import { StrictMode } from 'react'
import { createRoot } from 'react-dom/client'
import { BrowserRouter, Routes, Route } from 'react-router-dom'

import './index.css'

import Fooldal from './Fooldal'
import Login from './Login'
import Register from './Register'
import TopicPage from './TopicPage'

createRoot(document.getElementById('root')).render(
  <StrictMode>
    <BrowserRouter>
      <Routes>
        <Route path="/" element={<Fooldal />} />
        <Route path="/login" element={<Login />} />
        <Route path="/register" element={<Register />} />
        <Route path="/tema/:slug" element={<TopicPage />} />
      </Routes>
    </BrowserRouter>
  </StrictMode>
)
