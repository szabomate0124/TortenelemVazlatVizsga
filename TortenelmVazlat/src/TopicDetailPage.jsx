import { useParams, useNavigate } from "react-router-dom";
import { useEffect, useState, useContext } from "react";
import Container from "react-bootstrap/Container";
import Button from "react-bootstrap/Button";
import Spinner from "react-bootstrap/Spinner";
import { AuthContext } from "./AuthContext";

import "./topicDetail.css";

function TopicDetailPage() {
  const { catId, tpcId } = useParams();
  const navigate = useNavigate();
  const { isAdmin } = useContext(AuthContext);

  const [topic, setTopic] = useState(null);
  const [error, setError] = useState(false);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    if (!catId || !tpcId) {
      setError(true);
      setLoading(false);
      return;
    }

    setLoading(true);

    fetch(`http://localhost:3000/api/content/${catId}/${tpcId}`)
      .then(res => {
        if (!res.ok) throw new Error();
        return res.json();
      })
      .then(data => {
        setTopic(data);
        setLoading(false);
      })
      .catch(() => {
        setError(true);
        setLoading(false);
      });

  }, [catId, tpcId]);

  if (loading) {
    return (
      <Container className="my-5 text-center">
        <Spinner animation="border" />
        <p>Betöltés...</p>
      </Container>
    );
  }

  if (error) {
    return (
      <Container className="my-5 text-center">
        <h2>Ez a tananyag nem található</h2>
        <Button onClick={() => navigate(-1)}>
          ← Vissza
        </Button>
      </Container>
    );
  }

  return (
    <Container className="my-5">
      <div className="history-content">

        <h1>{topic.title}</h1>

        {isAdmin() && (
          <Button
            className="btn-filled-custom mb-4"
            onClick={() => navigate(`/topicEditor/${catId}/${tpcId}`)}
          >
            Téma szerkesztése
          </Button>
        )}

        <div
          dangerouslySetInnerHTML={{ __html: topic.content }}
        />

        <div style={{ marginTop: "40px", textAlign: "center" }}>
          <Button
            className="btn-filled-custom"
            onClick={() => navigate(-1)}
          >
            ← Vissza a témákhoz
          </Button>
        </div>

      </div>
    </Container>
  );
}

export default TopicDetailPage;