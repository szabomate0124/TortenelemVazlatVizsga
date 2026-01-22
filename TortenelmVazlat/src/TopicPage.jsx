import { useParams, useNavigate } from "react-router-dom";
import { useEffect, useState } from "react";
import Container from "react-bootstrap/Container";
import Row from "react-bootstrap/Row";
import Col from "react-bootstrap/Col";
import Card from "react-bootstrap/Card";
import Button from "react-bootstrap/Button";
import "./topicPage.css";

function TopicPage() {
  const { categoryId } = useParams(); 
  const navigate = useNavigate();
  const [topics, setTopics] = useState([]);
  const [error, setError] = useState(false);

  useEffect(() => {
    fetch(`http://localhost:3000/api/topics/category/${categoryId}`)
      .then(res => {
        if (!res.ok) throw new Error("Hiba");
        return res.json();
      })
      .then(data => setTopics(data))
      .catch(() => setError(true));
  }, [categoryId]);

  if (error) {
    return (
      <Container className="my-5 text-center">
        <h2>Hiba történt az adatok betöltésekor</h2>
        <Button onClick={() => navigate("/")}>Vissza</Button>
      </Container>
    );
  }

  return (
    <>
      <div className="topic-header text-center">
        <Container>
          <h1>Témák</h1>
          <p>Válassz egy tananyagot</p>
        </Container>
      </div>

      <Container className="my-5">
        <Row className="g-4">
          {topics.map(topic => (
            <Col md={4} key={topic.id}>
              <Card className="topic-card h-100">
                {topic.img && (
                  <Card.Img
                    variant="top"
                    src={topic.img}
                    alt={topic.title}
                  />
                )}

                <Card.Body className="d-flex flex-column">
                  <Card.Title>{topic.title}</Card.Title>

                  <Button
                    className="mt-auto"
                    onClick={() => navigate(`/topic-detail/${topic.id}`)}
                  >
                    Megnyitás
                  </Button>
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
    </>
  );
}

export default TopicPage;
