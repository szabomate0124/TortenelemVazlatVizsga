import 'bootstrap/dist/css/bootstrap.min.css' 
import { StrictMode } from 'react'
import { createRoot } from 'react-dom/client'
import './index.css'
import Fooldal from  './Fooldal'


createRoot(document.getElementById('root')).render(
  <StrictMode>
    <Fooldal />

  </StrictMode>,
)
