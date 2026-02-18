import Form from "react-bootstrap/Form";
import Button from "react-bootstrap/Button";
import { useNavigate } from "react-router-dom";
import { useState } from "react";
import "./auth.css";

function Login() {
  const navigate = useNavigate();

  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");

  function handleEmailChange(e) {
    setEmail(e.target.value);
  }

  function handlePasswordChange(e) {
    setPassword(e.target.value);
  }

  async function handleSubmit(e) {
    e.preventDefault();

    try {
      const loginData = {
        email: email,
        password: password,
      };

      const response = await fetch("http://localhost:3000/api/login", {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify(loginData),
      });

      const data = await response.json();

      if (data.error) {
        alert(`Hiba: ${data.error}`);
      } else {
        alert("Sikeres bejelentkezés!");
        navigate("/");
      }
    } catch (error) {
      console.error("Hiba történt:", error);
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
              onChange={handleEmailChange}
              required
            />
          </Form.Group>

          <Form.Group className="mb-3">
            <Form.Label>Jelszó</Form.Label>
            <Form.Control
              type="password"
              value={password}
              onChange={handlePasswordChange}
              required
            />
          </Form.Group>

          <Button type="submit" className="auth-btn w-100">
            Belépés
          </Button>
        </Form>

        <div className="auth-footer">
          Nincs fiókod?{" "}
          <span
            onClick={() => navigate("/register")}
            style={{ cursor: "pointer" }}
          >
            Regisztráció
          </span>
        </div>
      </div>
    </div>
  );
}

export default Login;
