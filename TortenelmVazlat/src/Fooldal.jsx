import Button from "react-bootstrap/Button";
import Form from "react-bootstrap/Form";
import Nav from "react-bootstrap/Nav";
import Navbar from "react-bootstrap/Navbar";
import Container from "react-bootstrap/Container";
import Row from "react-bootstrap/Row";
import Col from "react-bootstrap/Col";
import Card from "react-bootstrap/Card";
import { useNavigate } from "react-router-dom";
import 'bootstrap-icons/font/bootstrap-icons.css';

import card1 from "./assets/card1.jpg";
import card2 from "./assets/card2.jpg";
import card3 from "./assets/card3.jpg";
import card4 from "./assets/card4.jpg";
import card5 from "./assets/card5.jpg";
import card6 from "./assets/card6.jpg";

function Fooldal() {
  const navigate = useNavigate();

  const categoryMap = {
    egyetemes: 1,
    magyar: 2,
    erettsegi: 3,
    segedanyagok: 4,
    forrasok: 5,
    erdekessegek: 6,
  };

  const cards = [
    {
      title: "Egyetemes történelem",
      image: card1,
      slug: "egyetemes",
    },
    {
      title: "Magyar történelem",
      image: card2,
      slug: "magyar",
    },
    {
      title: "Érettségi felkészülés",
      image: card3,
      slug: "erettsegi",
    },
    {
      title: "Segédanyagok",
      image: card4,
      slug: "segedanyagok",
    },
    {
      title: "Források",
      image: card5,
      slug: "forrasok",
    },
    {
      title: "Érdekességek",
      image: card6,
      slug: "erdekessegek",
    },
  ];

  return (
    <>
      <Navbar expand="lg" className="navbar-background py-3" variant="dark">
        <Container>
          <Navbar.Brand
            className="navbar-brand-custom"
            style={{ cursor: "pointer" }}
            onClick={() => navigate("/")}
          >
            Törivázlat
          </Navbar.Brand>

          <Navbar.Toggle aria-controls="main-navbar" />
          <Navbar.Collapse id="main-navbar">
            <Nav className="mx-auto navbar-links">
              <Nav.Link onClick={() => navigate("/")}>Kezdőlap</Nav.Link>
              <Nav.Link onClick={() => navigate(`/tema/${categoryMap.egyetemes}`)}>
                Egyetemes történelem
              </Nav.Link>
              <Nav.Link onClick={() => navigate(`/tema/${categoryMap.magyar}`)}>
                Magyar történelem
              </Nav.Link>
              <Nav.Link onClick={() => navigate(`/tema/${categoryMap.segedanyagok}`)}>
                Segédanyagok
              </Nav.Link>
              <Nav.Link onClick={() => navigate(`/tema/${categoryMap.erettsegi}`)}>
                Érettségi
              </Nav.Link>
            </Nav>

            <div className="d-flex gap-2">
              <Button
                className="btn-outline-custom"
                onClick={() => navigate("/register")}
              >
                Regisztráció
              </Button>

              <Button
                className="btn-filled-custom"
                onClick={() => navigate("/login")}
              >
                Bejelentkezés
              </Button>
            </div>
          </Navbar.Collapse>
        </Container>
      </Navbar>

      <div className="slogen-box">
        <div className="slogen-overlay text-center">
          <div>
            <h2>Történelem vázlatok</h2>
            <p className="slogentext">
              Tanuláshoz – felkészüléshez – források – filmajánlók
            </p>

            <Form className="search-box">
              <Form.Control placeholder="Keresés..." />
              <Button className="btn-filled-custom">Keresés</Button>
            </Form>
          </div>
        </div>
      </div>

      <Container className="my-5">
        <Row className="g-4">
          {cards.map((c, i) => (
            <Col md={4} key={i}>
              <Card
                className="content-card"
                onClick={() => navigate(`/tema/${categoryMap[c.slug]}`)}
                style={{ cursor: "pointer" }}
              >
                <Card.Img src={c.image} />
                <Card.Body>
                  <Card.Title>{c.title}</Card.Title>
                </Card.Body>
              </Card>
            </Col>
          ))}
        </Row>
      </Container>

      <footer className="site-footer pt-5">
        <Container>
          <Row className="mb-4">
            <Col md={4} className="mb-3">
              <h5>Rólunk</h5>
              <p className="text-light-50">
                Törivázlat – tanuláshoz, felkészüléshez és érdekességekhez. 
                Professzionális tartalom diákoknak és történelemrajongóknak.
              </p>
            </Col>

            <Col md={4} className="mb-3">
              <h5>Gyors linkek</h5>
              <ul className="list-unstyled">
                <li>
                  <i className="bi bi-book me-2"></i>
                  <span
                    className="footer-link"
                    style={{ cursor: "pointer" }}
                    onClick={() => navigate(`/tema/${categoryMap.egyetemes}`)}
                  >
                    Egyetemes történelem
                  </span>
                </li>
                <li>
                  <i className="bi bi-book-half me-2"></i>
                  <span
                    className="footer-link"
                    style={{ cursor: "pointer" }}
                    onClick={() => navigate(`/tema/${categoryMap.magyar}`)}
                  >
                    Magyar történelem
                  </span>
                </li>
                <li>
                  <i className="bi bi-pencil-square me-2"></i>
                  <span
                    className="footer-link"
                    style={{ cursor: "pointer" }}
                    onClick={() => navigate(`/tema/${categoryMap.segedanyagok}`)}
                  >
                    Segédanyagok
                  </span>
                </li>
                <li>
                  <i className="bi bi-journal-check me-2"></i>
                  <span
                    className="footer-link"
                    style={{ cursor: "pointer" }}
                    onClick={() => navigate(`/tema/${categoryMap.erettsegi}`)}
                  >
                    Érettségi
                  </span>
                </li>
              </ul>
            </Col>

            <Col md={4} className="mb-3">
              <h5>Kövess minket</h5>
              <div className="d-flex gap-3 mt-2">
                <a href="#" className="footer-icon"><i className="bi bi-facebook"></i></a>
                <a href="#" className="footer-icon"><i className="bi bi-instagram"></i></a>
              </div>
            </Col>
          </Row>

          <hr className="border-secondary" />

          <Row>
            <Col className="text-center">
              <small className="text-light-50">
                © {new Date().getFullYear()} Törivázlat – Holczman József, Zsupos Dominik, Szabó Máté – Minden jog fenntartva.
              </small>
            </Col>
          </Row>
        </Container>
      </footer>
    </>
  );
}

export default Fooldal;
