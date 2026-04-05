import { useEffect, useState, useContext } from "react";
import { useNavigate } from "react-router-dom";
import Container from "react-bootstrap/Container";
import Row from "react-bootstrap/Row";
import Col from "react-bootstrap/Col";
import Card from "react-bootstrap/Card";
import "./topicPage.css";
import { AuthContext } from "./AuthContext";

export default function AllTopic() {
  const [topics, setTopics] = useState([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(false);
  const navigate = useNavigate();
  const { isAdmin } = useContext(AuthContext);

  useEffect(() => {
    fetch("http://localhost:3000/api/allCategory")
      .then((res) => {
        if (!res.ok) throw new Error();
        return res.json();
      })
      .then((data) => {
        // ABC sorrendbe rendezés
        const sorted = data.sort((a, b) =>
          a.title.localeCompare(b.title, undefined, { sensitivity: "base" })
        );
        setTopics(sorted);
        setLoading(false);
      })
      .catch(() => {
        setError(true);
        setLoading(false);
      });
  }, []);

  if (loading) return <p>Betöltés...</p>;
  if (error) return <p>Hiba történt</p>;

  return (
    <Container className="my-5 text-center">
      <h2>Összes Téma</h2>

      {isAdmin() && (
        <div className="create-topic-wrapper mb-4">
          <button
            className="create-topic-button"
            onClick={() => navigate("/createTopic/0")}
          >
            +
          </button>
          <div className="mt-2">Új téma létrehozása</div>
        </div>
      )}

      <Row className="g-4">
        {topics.map((topic) => (
          <Col md={4} sm={6} xs={12} key={topic.id}>
            <Card className="topic-card h-100">
              {topic.img && (
                <Card.Img
                  variant="top"
                  src={`http://localhost:3000/Torivazlatkepek/${topic.img}`}
                  alt={topic.title}
                />
              )}

              <Card.Body className="d-flex flex-column">
                <Card.Title>{topic.title || "Névtelen téma"}</Card.Title>
                <p className="card-text">{topic.description || ""}</p>

                <button
                  className="open-button mt-auto"
                  onClick={() => navigate(`/topic/${topic.category_id}/${topic.id}`)}
                >
                  Megnyitás
                </button>
              </Card.Body>
            </Card>
          </Col>
        ))}
      </Row>

      <div className="text-center mt-5">
        <span className="back-button" onClick={() => navigate("/")}>
          ← Vissza
        </span>
      </div>
    </Container>
  );
}