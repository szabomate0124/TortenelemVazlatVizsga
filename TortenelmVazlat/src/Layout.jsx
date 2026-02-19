import { Outlet, useNavigate } from "react-router-dom";
import { useContext } from "react"; 
import { AuthContext } from "./AuthContext"; 
import Button from "react-bootstrap/Button";
import Nav from "react-bootstrap/Nav";
import Navbar from "react-bootstrap/Navbar";
import Container from "react-bootstrap/Container";
import "./Layout.css"; 

function Layout() {
  const navigate = useNavigate();
  const { user, logout } = useContext(AuthContext); 

  const categoryMap = {
    egyetemes: 1,
    magyar: 2,
    erettsegi: 3,
    segedanyagok: 4,
  };

  return (
    <>
      <Navbar expand="lg" className="navbar-background py-3" variant="dark">
        <Container>
          <Navbar.Brand
            className="navbar-brand-custom clickable"
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

            <div className="d-flex gap-2 align-items-center">
              {user ? (
                <>
                  <div className="user-profile-container">
                    <span className="username-display">{user.username}</span>
                    <div className="profile-popup">
                      <p><strong>Felhasználónév:</strong> {user.username}</p>
                      <p><strong>Email:</strong> {user.email}</p>
                    </div>
                  </div>

                  <Button
                    className="btn-outline-custom"
                    onClick={() => {
                      logout();
                      navigate("/");
                    }}
                  >
                    Kijelentkezés
                  </Button>
                </>
              ) : (
                <>
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
                </>
              )}
            </div>
          </Navbar.Collapse>
        </Container>
      </Navbar>

      <Outlet />
    </>
  );
}

export default Layout;
