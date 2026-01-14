import Form from "react-bootstrap/Form";
import Button from "react-bootstrap/Button";
import { useNavigate } from "react-router-dom";
import { useState } from "react";
import "./auth.css";

function Login() {
  const navigate = useNavigate();

  return (
    <div className="auth-page">
      <div className="auth-card">
        <h2 className="auth-title">Bejelentkezés</h2>

        <Form>
          <Form.Group className="mb-3">
            <Form.Label>Email</Form.Label>
            <Form.Control />
          </Form.Group>

          <Form.Group className="mb-3">
            <Form.Label>Jelszó</Form.Label>
            <Form.Control type="password" />
          </Form.Group>

          <Button className="auth-btn w-100" onClick={() => navigate("/")}>
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
