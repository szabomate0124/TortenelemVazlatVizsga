import Button from "react-bootstrap/Button";
import Form from "react-bootstrap/Form";
import Nav from "react-bootstrap/Nav";
import Navbar from "react-bootstrap/Navbar";
import NavDropdown from "react-bootstrap/NavDropdown";
import Container from "react-bootstrap/Container";
import Row from "react-bootstrap/Row";
import Col from "react-bootstrap/Col";

function Fooldal() {
  return (
    <>
      <Navbar expand="lg" className="navbar-background" variant="dark">
        <Container fluid>
          <Navbar.Brand href="#">Történelem Vázlat</Navbar.Brand>
          <Navbar.Toggle aria-controls="navbarScroll" />
          <Navbar.Collapse id="navbarScroll">
            <Nav
              className="me-auto my-2 my-lg-0"
              style={{ maxHeight: "100px" }}
              navbarScroll
            >
              <Nav.Link href="#action1">Kezdőlap</Nav.Link>
              <Nav.Link href="#action2">Tartalom</Nav.Link>
              <Nav.Link href="#">Egyetemes történelem</Nav.Link>
              <Nav.Link href="#">Magyar történelem</Nav.Link>
              <Nav.Link href="#">Segédsanyagok</Nav.Link>
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
        <Row>
          <Col className="text-center">
          <h3 className="text-light">Törivázlat</h3>
          <p className="text-light">Történelem vázlatok - érettségi információk - segédanyagok a felkészüléshez, tanuláshoz - források, adatbázisok, folyóiratok, érdekességek és filmajánlások</p>
          </Col>

        </Row>
      </Container>
    </>
  );
}

export default Fooldal;
