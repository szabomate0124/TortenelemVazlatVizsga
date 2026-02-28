
import { createContext, useState, useEffect } from "react";
import { jwtDecode } from "jwt-decode";

export const AuthContext = createContext();

export function AuthProvider({ children }) {
  const [user, setUser] = useState(null);

  // Token ellenőrzés oldalfrissítéskor
  useEffect(() => {
    const token = localStorage.getItem("token");
    if (token) {
      try {
        const decoded = jwtDecode(token);
        setUser(decoded);
      } catch (err) {
        localStorage.removeItem("token");
      }
    }
  }, []);

  // Login funkció
  function login(token) {
    localStorage.setItem("token", token);
    const decoded = jwtDecode(token);
    setUser(decoded);
  }

  // Logout funkció
  function logout() {
    localStorage.removeItem("token");
    setUser(null);
  }

  //Admin vizsgáló
  function isAdmin(){
    if(user != null && user.auth_id == 1){
      return true
    }

    else{
      return false
    }
  }


  return (
    <AuthContext.Provider value={{ user, login, logout, isAdmin }}>
      {children}
    </AuthContext.Provider>
  );
}
