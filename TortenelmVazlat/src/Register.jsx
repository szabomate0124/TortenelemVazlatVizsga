import Form from "react-bootstrap/Form";
import Button from "react-bootstrap/Button";
import { useNavigate } from "react-router-dom";
import "./auth.css";

function Register() {
  const navigate = useNavigate();

  return (
    <div className="auth-page">
      <div className="auth-card">
        <h2 className="auth-title">Regisztráció</h2>

        <Form>
          <Form.Group className="mb-3">
            <Form.Label>Email</Form.Label>
            <Form.Control />
          </Form.Group>

          <Form.Group className="mb-3">
            <Form.Label>Jelszó</Form.Label>
            <Form.Control type="password" />
          </Form.Group>

          <Form.Group className="mb-3">
            <Form.Label>Jelszó megerősítése</Form.Label>
            <Form.Control type="password" />
          </Form.Group>

          <Button className="auth-btn w-100" onClick={() => navigate("/login")}>
            Fiók létrehozása
          </Button>
        </Form>

        <div className="auth-footer">
          Már van fiókod?{" "}
          <span onClick={() => navigate("/login")} style={{ cursor: "pointer" }}>
            Bejelentkezés
          </span>
        </div>
      </div>
    </div>
  );
}

export default Register;
