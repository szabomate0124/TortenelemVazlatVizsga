import Form from "react-bootstrap/Form";
import Button from "react-bootstrap/Button";
import { useNavigate } from "react-router-dom";
import { useState } from "react";
import "./auth.css";

function Register() {
  const navigate = useNavigate();
  const [userName, setUserName] = useState("");
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const [confirmPassword, setConfirmPassword] = useState("");

  function handleSubmit(e) {
    e.preventDefault();
    if (!userName || !email || !password || !confirmPassword) {
      alert("Kérlek töltsd ki az összes mezőt!");
      return;
    }
    if (password !== confirmPassword) {
      alert("A jelszavak nem egyeznek!");
      return;
    }
    
    const registrationData ={

      username: userName,
      email: email,
      password: password

    };

    const options = {
      method: "POST",
      body: JSON.stringify(registrationData),
      headers:{
        "Content-Type": "application/json"
      }
    }

    fetch("http://localhost:3000/api/register", options)
    .then(res => res.json())
    .then(data => {
      if(data.error){
        alert(`Hiba: ${data.error}`);
      } else {
        alert("Sikeres regisztráció!");
        navigate("/login");
      }

    })
  }

  return (

    <div className="auth-page">
      <div className="auth-card">
        <h2 className="auth-title">Regisztráció</h2>
        <Form onSubmit={handleSubmit}>
          <Form.Group className="mb-3">
            <Form.Label>Felhasználónév</Form.Label>
            <Form.Control
              type="text"
              value={userName}
              onChange={(e) => setUserName(e.target.value)}
            />
          </Form.Group>
          <Form.Group className="mb-3">
            <Form.Label>Email</Form.Label>
            <Form.Control
              type="email"
              value={email}
              onChange={(e) => setEmail(e.target.value)}
            />
          </Form.Group>

          <Form.Group className="mb-3">
            <Form.Label>Jelszó</Form.Label>
            <Form.Control
              type="password"
              value={password}
              onChange={(e) => setPassword(e.target.value)}
            />
          </Form.Group>

          <Form.Group className="mb-3">
            <Form.Label>Jelszó megerősítése</Form.Label>
            <Form.Control
              type="password"
              value={confirmPassword}
              onChange={(e) => setConfirmPassword(e.target.value)}
            />
          </Form.Group>

          <Button type="submit" className="auth-btn w-100">
            Fiók létrehozása
          </Button>
        </Form>

        <div className="auth-footer">
          Már van fiókod?{" "}
          <span
            onClick={() => navigate("/login")}
            style={{ cursor: "pointer" }}
          >
            Bejelentkezés
          </span>
        </div>
      </div>
    </div>
  );
}

export default Register;
