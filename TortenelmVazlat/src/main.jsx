import 'bootstrap/dist/css/bootstrap.min.css'
import { StrictMode } from 'react'
import { createRoot } from 'react-dom/client'
import { BrowserRouter, Routes, Route } from 'react-router-dom'

import './index.css'

import Layout from './Layout'
import Fooldal from './Fooldal'
import Login from './Login'
import Register from './Register'
import TopicPage from './TopicPage'
import TopicDetailPage from "./TopicDetailPage"
import TopicEditor from './TopicEditor'
import AdminRoute from './AdminRoute'

import { AuthProvider } from "./AuthContext"
import SearchResults from './SearchResults'

createRoot(document.getElementById('root')).render(
  <StrictMode>
    <AuthProvider> 
      <BrowserRouter>
        <Routes>

          <Route path="/login" element={<Login />} />
          <Route path="/register" element={<Register />} />

          <Route element={<Layout />}>

            <Route path="/" element={<Fooldal />} />
            <Route path="/tema/:categoryId" element={<TopicPage />} />
            <Route path="/topic/:catId/:tpcId" element={<TopicDetailPage />} />
            <Route path="/searchResults/:keywords" element={<SearchResults />} />

            <Route 
              path="/topicEditor/:catId/:tpcId"
              element={
                <AdminRoute>
                  <TopicEditor />
                </AdminRoute>
              }
            />

          </Route>

        </Routes>
      </BrowserRouter>
    </AuthProvider>
  </StrictMode>
)