import Button from "react-bootstrap/Button";
import Form from "react-bootstrap/Form";
import Nav from "react-bootstrap/Nav";
import Navbar from "react-bootstrap/Navbar";
import Container from "react-bootstrap/Container";
import Row from "react-bootstrap/Row";
import Col from "react-bootstrap/Col";
import Card from "react-bootstrap/Card";
import { useNavigate } from "react-router-dom";

import card1 from "./assets/card1.jpg";
import card2 from "./assets/card2.jpg";
import card3 from "./assets/card3.jpg";
import card4 from "./assets/card4.jpg";
import card5 from "./assets/card5.jpg";
import card6 from "./assets/card6.jpg";

function Fooldal() {
  const navigate = useNavigate();

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
              <Nav.Link onClick={() => navigate("/tema/egyetemes")}>
                Egyetemes történelem
              </Nav.Link>
              <Nav.Link onClick={() => navigate("/tema/magyar")}>
                Magyar történelem
              </Nav.Link>
              <Nav.Link onClick={() => navigate("/tema/segedanyagok")}>
                Segédanyagok
              </Nav.Link>
              <Nav.Link onClick={() => navigate("/tema/erettsegi")}>
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
                onClick={() => navigate(`/tema/${c.slug}`)}
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

      <footer className="site-footer">
        © {new Date().getFullYear()} Törivázlat – Holczman József, Zsupos Dominik,
        Szabó Máté – Minden jog fenntartva.
      </footer>
    </>
  );
}

export default Fooldal;
