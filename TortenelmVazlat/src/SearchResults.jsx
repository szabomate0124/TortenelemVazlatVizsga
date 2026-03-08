import { useState, useEffect } from "react";
import { useParams, useNavigate } from "react-router-dom";

import Container from "react-bootstrap/Container";
import Row from "react-bootstrap/Row";
import Col from "react-bootstrap/Col";
import Card from "react-bootstrap/Card";

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
      <Container className="my-5 text-center">
        <h2>Hiba történt a keresés során</h2>
      </Container>
    );
  }

  return (
    <Container className="my-5">

      <h2 className="mb-4">
        Keresési találatok: <b>{keywords}</b>
      </h2>

      {results.length === 0 && (
        <p>Nincs találat.</p>
      )}

      <Row className="g-4">

        {results.map((talalat) => (

          <Col md={4} sm={6} xs={12} key={talalat.id}>

            <Card className="topic-card h-100">

              {talalat.img && (
                <Card.Img
                  variant="top"
                  src={`http://localhost:3000/Torivazlatkepek/${talalat.img}`}
                />
              )}

              <Card.Body className="d-flex flex-column">

                <Card.Title>{talalat.title}</Card.Title>

                <button
                  className="open-button mt-auto"
                  onClick={() => navigate(`/topic/1/${talalat.id}`)}
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