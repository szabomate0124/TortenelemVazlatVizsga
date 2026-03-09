import { useParams, useNavigate } from "react-router-dom";
import { useEffect, useState, useContext } from "react";
import Container from "react-bootstrap/Container";
import Row from "react-bootstrap/Row";
import Col from "react-bootstrap/Col";
import Card from "react-bootstrap/Card";
import "./topicPage.css";
import { AuthContext } from "./AuthContext";

import img4 from "./assets/4.jpg";
import img5 from "./assets/5.jpg";
import img6 from "./assets/6.jpg";
import et from "./assets/et.jpg";
import mt from "./assets/mt.jpg";

function TopicPage() {
  const { categoryId } = useParams();
  const navigate = useNavigate();
  const { isAdmin } = useContext(AuthContext);

  const [topics, setTopics] = useState([]);
  const [error, setError] = useState(false);

  const headerImages = {
    1: et,
    2: mt,
    3: img4,
    4: img5,
    5: img6,
  };

  const headerTitles = {
    1: "Egyetemes történelem",
    2: "Magyar történelem",
    3: "Érettségi felkészülés",
    4: "Segédanyagok",
    5: "Források",
  };

  useEffect(() => {
    fetch(`http://localhost:3000/api/topicsByCategory/${categoryId}`)
      .then(res => {
        if (!res.ok) throw new Error("Hiba");
        return res.json();
      })
      .then(data => setTopics(data || []))
      .catch(err => {
        console.error(err);
        setError(true);
      });
  }, [categoryId]);

  if (error) {
    return (
      <Container className="my-5 text-center">
        <h2>Nem sikerült betölteni a témákat</h2>
        <button className="open-button" onClick={() => navigate("/")}>
          Vissza
        </button>
      </Container>
    );
  }

  return (
    <>
      <div
        className="topic-header text-center portfolio-header"
        style={{
          backgroundImage: `url(${headerImages[categoryId] || img4})`,
        }}
      >
        <div className="header-overlay">
          <h1>{headerTitles[categoryId] || "Témák"}</h1>
          <p>Válassz egy tananyagot</p>
        </div>
      </div>

      <Container className="my-5 text-center">
        {/* --- Új téma létrehozása gomb adminoknak --- */}
        {isAdmin() && (
          <div className="create-topic-wrapper mb-4">
            <button
              className="create-topic-button"
              onClick={() => navigate(`/createTopic/${categoryId}`)}
            >
              +
            </button>
            <div className="mt-2">Új téma létrehozása</div>
          </div>
        )}

        <Row className="g-4">
          {topics.map((topic, index) => {
            const topicId = topic.id ?? index + 1;
            return (
              <Col md={4} sm={6} xs={12} key={topicId}>
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
                      onClick={() =>
                        navigate(`/topic/${categoryId}/${topicId}`)
                      }
                    >
                      Megnyitás
                    </button>
                  </Card.Body>
                </Card>
              </Col>
            );
          })}
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