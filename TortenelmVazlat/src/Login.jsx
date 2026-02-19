import Form from "react-bootstrap/Form";
import Button from "react-bootstrap/Button";
import { useNavigate } from "react-router-dom";
import { useState, useContext } from "react";
import { AuthContext } from "./AuthContext"; 
import "./auth.css";

function Login() {
  const navigate = useNavigate();
  const { login } = useContext(AuthContext); 

  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");

  async function handleSubmit(e) {
    e.preventDefault();

    try {
      const response = await fetch("http://localhost:3000/api/login", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ email, password }),
      });

      const data = await response.json();

      if (data.error) {
        alert(`Hiba: ${data.error}`);
      } else {
        login(data.token); 
        navigate("/");
      }
    } catch (error) {
      alert("Szerverhiba történt!");
    }
  }

  return (
    <div className="auth-page">
      <div className="auth-card">
        <h2 className="auth-title">Bejelentkezés</h2>

        <Form onSubmit={handleSubmit}>
          <Form.Group className="mb-3">
            <Form.Label>Email</Form.Label>
            <Form.Control
              type="email"
              value={email}
              onChange={(e) => setEmail(e.target.value)}
              required
            />
          </Form.Group>

          <Form.Group className="mb-3">
            <Form.Label>Jelszó</Form.Label>
            <Form.Control
              type="password"
              value={password}
              onChange={(e) => setPassword(e.target.value)}
              required
            />
          </Form.Group>

          <Button type="submit" className="auth-btn w-100">
            Belépés
          </Button>
        </Form>

        <div className="auth-footer">
          Nincs fiókod?{" "}
          <span onClick={() => navigate("/register")} style={{ cursor: "pointer" }}>
            Regisztráció
          </span>
        </div>
      </div>
    </div>
  );
}

export default Login;
