import { Link } from "react-router-dom";
import Container from "react-bootstrap/Container";
import Card from "react-bootstrap/Card";
import Row from "react-bootstrap/Row";
import Col from "react-bootstrap/Col";
import "./AdminDashboard.css"; 

export default function AdminDashboard() {
  return (
    <Container className="my-5 admin-dashboard">
      <h1 className="mb-4 dashboard-title">Admin Szerkesztő</h1>

      <Row xs={1} md={2} className="g-4">
        <Col>
          <Card className="admin-card shadow-sm">
            <Card.Body className="d-flex flex-column justify-content-between">
              <div>
                <Card.Title className="card-title">Felhasználók</Card.Title>
                <Card.Text className="card-text">
                  Felhasználók kezelése és jogosultságok
                </Card.Text>
              </div>
              <Link to="/userEditor" className="btn-filled-custom text-center mt-3">
                Megnyitás
              </Link>
            </Card.Body>
          </Card>
        </Col>

        <Col>
          <Card className="admin-card shadow-sm">
            <Card.Body className="d-flex flex-column justify-content-between">
              <div>
                <Card.Title className="card-title">Témák</Card.Title>
                <Card.Text className="card-text">
                  Témák hozzáadása, szerkesztése, törlése
                </Card.Text>
              </div>
              <Link to="/allTopic" className="btn-filled-custom text-center mt-3">
                Megnyitás
              </Link>
            </Card.Body>
          </Card>
        </Col>
      </Row>
    </Container>
  );
}