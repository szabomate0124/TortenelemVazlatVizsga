import Button from "react-bootstrap/Button";
import Form from "react-bootstrap/Form";
import Nav from "react-bootstrap/Nav";
import Navbar from "react-bootstrap/Navbar";
import Container from "react-bootstrap/Container";
import Row from "react-bootstrap/Row";
import Col from "react-bootstrap/Col";
import Card from "react-bootstrap/Card";

import card1 from "./assets/card1.jpg";
import card2 from "./assets/card2.jpg";
import card3 from "./assets/card3.jpg";
import card4 from "./assets/card4.jpg";
import card5 from "./assets/card5.jpg";
import card6 from "./assets/card6.jpg";

function Fooldal() {
  const cards = [
    {
      title: "Egyetemes történelem",
      image: card1,
    },
    {
      title: "Magyar történelem vázlatok",
      image: card2,
    },
    {
      title: "Érettségi felkészülés",
      image: card3,
    },
    {
      title: "Segédanyagok tanuláshoz",
      image: card4,
    },
    {
      title: "Történelmi források",
      image: card5,
    },
    {
      title: "Folyóiratok, érdekességek",
      image: card6,
    },
  ];

  return (
    <>
      <Navbar expand="lg" className="navbar-background py-3" variant="dark">
        <Container>
          <Navbar.Brand href="#" className="navbar-brand-custom">
            Törivázlat
          </Navbar.Brand>

          <Navbar.Toggle aria-controls="navbarScroll" />
          <Navbar.Collapse id="navbarScroll">
            <Nav className="mx-auto navbar-links" navbarScroll>
              <Nav.Link href="#">Kezdőlap</Nav.Link>
              <Nav.Link href="#">Tartalom</Nav.Link>
              <Nav.Link href="#">Egyetemes történelem</Nav.Link>
              <Nav.Link href="#">Magyar történelem</Nav.Link>
              <Nav.Link href="#">Segédanyagok</Nav.Link>
              <Nav.Link href="#">Érettségi</Nav.Link>
            </Nav>

            <Form className="d-flex gap-2">
              <Button className="btn-outline-custom">Regisztráció</Button>
              <Button className="btn-filled-custom">Bejelentkezés</Button>
            </Form>
          </Navbar.Collapse>
        </Container>
      </Navbar>

      <Container fluid className="slogen-box">
        <div className="slogen-overlay">
          <Row className="w-100">
            <Col className="text-center d-flex flex-column align-items-center">
              <h2 className="fw-bold mb-3">Történelem vázlatok</h2>

              <p className="slogentext mb-4">
                Tanuláshoz – felkészüléshez – források – érdekességek –
                filmajánlók
              </p>

              <Form className="search-box">
                <Form.Control
                  type="search"
                  placeholder="Keress történelmi témákra..."
                />
                <Button className="btn-filled-custom">Keresés</Button>
              </Form>
            </Col>
          </Row>
        </div>
      </Container>

      <Container className="my-5">
        <Row className="g-4">
          {cards.map((card, index) => (
            <Col md={4} key={index}>
              <Card className="content-card h-100">
                <Card.Img variant="top" src={card.image} alt={card.title} />
                <Card.Body>
                  <Card.Title>{card.title}</Card.Title>
                </Card.Body>
              </Card>
            </Col>
          ))}
        </Row>
      </Container>
    </>
  );
}

export default Fooldal;
