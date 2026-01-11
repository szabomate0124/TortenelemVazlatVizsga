import Button from "react-bootstrap/Button";
import Form from "react-bootstrap/Form";
import Nav from "react-bootstrap/Nav";
import Navbar from "react-bootstrap/Navbar";
import Container from "react-bootstrap/Container";
import Row from "react-bootstrap/Row";
import Col from "react-bootstrap/Col";
import Card from "react-bootstrap/Card";

function Fooldal() {
  return (
    <>
 
      <Navbar expand="lg" className="navbar-background" variant="dark">
        <Container fluid>
          <Navbar.Brand href="#">Törivázlat</Navbar.Brand>
          <Navbar.Toggle aria-controls="navbarScroll" />
          <Navbar.Collapse id="navbarScroll">
            <Nav className="me-auto my-2 my-lg-0" navbarScroll>
              <Nav.Link href="#">Kezdőlap</Nav.Link>
              <Nav.Link href="#">Tartalom</Nav.Link>
              <Nav.Link href="#">Egyetemes történelem</Nav.Link>
              <Nav.Link href="#">Magyar történelem</Nav.Link>
              <Nav.Link href="#">Segédanyagok</Nav.Link>
              <Nav.Link href="#">Érettségi</Nav.Link>
            </Nav>
            <Form className="d-flex">
              <Button className="me-2" variant="info">
                Regisztráció
              </Button>
              <Button variant="success">Bejelentkezés</Button>
            </Form>
          </Navbar.Collapse>
        </Container>
      </Navbar>

      <Container className="slogen-box" fluid>
        <Row className="w-100">
          <Col className="text-center d-flex flex-column align-items-center">
            <h2 className="text-light fw-bold mb-3">
              Történelem vázlatok
            </h2>

            <p className="text-light mb-4 slogentext">
              Tanuláshoz – felkészüléshez – források – érdekességek – filmajánlók
            </p>

            <Form className="search-box">
              <Form.Control
                type="search"
                placeholder="Keress történelmi témákra..."
                aria-label="Search"
              />
              <Button variant="info">Keresés</Button>
            </Form>
          </Col>
        </Row>
      </Container>


      <Container className="my-5">
        <Row className="g-4">
          <Col md={4}>
            <Card className="content-card">
              <Card.Img variant="top" src="/assets/card1.jpg" />
              <Card.Body>
                <Card.Title>Egyetemes történelem</Card.Title>
              </Card.Body>
            </Card>
          </Col>

          <Col md={4}>
            <Card className="content-card">
              <Card.Img variant="top" src="/assets/card2.jpg" />
              <Card.Body>
                <Card.Title>Magyar történelem vázlatok</Card.Title>
              </Card.Body>
            </Card>
          </Col>

          <Col md={4}>
            <Card className="content-card">
              <Card.Img variant="top" src="/assets/card3.jpg" />
              <Card.Body>
                <Card.Title>Érettségi felkészülés</Card.Title>
              </Card.Body>
            </Card>
          </Col>

          <Col md={4}>
            <Card className="content-card">
              <Card.Img variant="top" src="/assets/card4.jpg" />
              <Card.Body>
                <Card.Title>Segédanyagok tanuláshoz</Card.Title>
              </Card.Body>
            </Card>
          </Col>

          <Col md={4}>
            <Card className="content-card">
              <Card.Img variant="top" src="/assets/card5.jpg" />
              <Card.Body>
                <Card.Title>Történelmi források</Card.Title>
              </Card.Body>
            </Card>
          </Col>

          <Col md={4}>
            <Card className="content-card">
              <Card.Img variant="top" src="/assets/card6.jpg" />
              <Card.Body>
                <Card.Title>Folyóiratok, érdekességek</Card.Title>
              </Card.Body>
            </Card>
          </Col>
        </Row>
      </Container>
    </>
  );
}

export default Fooldal;
