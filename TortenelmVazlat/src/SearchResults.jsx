import { useState, useEffect } from "react";
import { useParams, useNavigate } from "react-router-dom";

import Container from "react-bootstrap/Container";
import Row from "react-bootstrap/Row";
import Col from "react-bootstrap/Col";
import Card from "react-bootstrap/Card";

import "./searchResults.css";

export default function SearchResults() {

  const { keywords } = useParams();
  const navigate = useNavigate();

  const [results, setResults] = useState([]);
  const [error, setError] = useState(false);

  useEffect(() => {
    fetch("http://localhost:3000/api/search?q=" + keywords)
      .then((response) => {
        if (!response.ok) throw new Error("Hiba");
        return response.json();
      })
      .then((data) => {
        setResults(data);
      })
      .catch((err) => {
        console.error(err);
        setError(true);
      });
  }, [keywords]);

  if (error) {
    return (
      <Container className="my-5 search-error">
        <h2>Hiba történt a keresés során</h2>
      </Container>
    );
  }

  return (
    <Container className="my-5 search-container">

      <h2 className="search-title">
        Keresési találatok: <span>{keywords}</span>
      </h2>

      {results.length === 0 && (
        <p className="no-results">Nincs találat.</p>
      )}

      <Row className="g-4">

        {results.map((talalat) => (

          <Col md={4} sm={6} xs={12} key={talalat.id}>

            <Card
              className="topic-card h-100"
              onClick={() =>
                navigate(`/topic/${talalat.category_id}/${talalat.id}`)
              }
            >

              {talalat.img && (
                <Card.Img
                  variant="top"
                  src={`http://localhost:3000/Torivazlatkepek/${talalat.img}`}
                />
              )}

              <Card.Body>

                <Card.Title>{talalat.title}</Card.Title>

                <button
                  className="open-button"
                  onClick={(e) => {
                    e.stopPropagation();
                    navigate(`/topic/${talalat.category_id}/${talalat.id}`);
                  }}
                >
                  Megnyitás
                </button>

              </Card.Body>

            </Card>

          </Col>

        ))}

      </Row>

    </Container>
  );
}