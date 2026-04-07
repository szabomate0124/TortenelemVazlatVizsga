import { useEffect, useState } from "react";
import Container from "react-bootstrap/Container";
import Card from "react-bootstrap/Card";
import Row from "react-bootstrap/Row";
import Col from "react-bootstrap/Col";
import Button from "react-bootstrap/Button";
import "./UserEditor.css";

export default function UserEditor() {
  const [users, setUsers] = useState([]);
  const [loading, setLoading] = useState(true);

  const token = localStorage.getItem("token"); // JWT token tárolva a bejelentkezéskor

  const fetchUsers = () => {
    fetch("http://localhost:3000/api/allUsers", {
      headers: { Authorization: `Bearer ${token}` },
    })
      .then((res) => res.json())
      .then((data) => {
        const sorted = data.sort((a, b) =>
          a.username.localeCompare(b.username, undefined, { sensitivity: "base" })
        );
        setUsers(sorted);
        setLoading(false);
      })
      .catch((err) => {
        console.error(err);
        setLoading(false);
      });
  };

  useEffect(() => {
    fetchUsers();
  }, []);

  const toggleAdmin = async (userId, currentRole) => {
    const newRole = currentRole === 1 ? 2 : 1;

    try {
      const res = await fetch(`http://localhost:3000/api/users/${userId}/role`, {
        method: "PUT",
        headers: {
          "Content-Type": "application/json",
          Authorization: `Bearer ${token}`,
        },
        body: JSON.stringify({ auth_id: newRole }),
      });

      if (!res.ok) {
        const err = await res.json();
        throw new Error(err.error || "Hiba történt a jogosultság módosításakor");
      }

      fetchUsers();
    } catch (err) {
      console.error(err);
      alert(err.message);
    }
  };

  const deleteUser = async (userId) => {
    if (!window.confirm("Biztosan törölni szeretnéd a felhasználót?")) return;

    try {
      const res = await fetch(`http://localhost:3000/api/users/${userId}`, {
        method: "DELETE",
        headers: {
          Authorization: `Bearer ${token}`,
        },
      });

      if (!res.ok) {
        const err = await res.json();
        throw new Error(err.error || "Hiba történt a törlés során");
      }

      fetchUsers();
    } catch (err) {
      console.error(err);
      alert(err.message);
    }
  };

  if (loading) return <p>Betöltés...</p>;

  return (
    <Container className="my-5">
      <h2 className="mb-4">Felhasználók</h2>
      <Row xs={1} md={2} className="g-4">
        {users.map((user) => (
          <Col key={user.id}>
            <Card className="user-card shadow-sm">
              <Card.Body>
                <Card.Title>{user.username}</Card.Title>
                <Card.Text>
                  Email: {user.email} <br />
                  Jogosultság: {user.auth_id === 1 ? "Admin" : "Felhasználó"}
                </Card.Text>
                <div className="d-flex gap-2 mt-2">
                  <Button
                    variant={user.auth_id === 1 ? "secondary" : "warning"}
                    onClick={() => toggleAdmin(user.id, user.auth_id)}
                  >
                    {user.auth_id === 1 ? "Admin eltávolítása" : "Admin jog hozzáadása"}
                  </Button>
                  <Button variant="danger" onClick={() => deleteUser(user.id)}>
                    Profil törlése
                  </Button>
                </div>
              </Card.Body>
            </Card>
          </Col>
        ))}
      </Row>
    </Container>
  );
}