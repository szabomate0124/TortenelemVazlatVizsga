import { useParams, useNavigate } from "react-router-dom";
import { useEffect, useState } from "react";
import Container from "react-bootstrap/Container";
import Button from "react-bootstrap/Button";
import "./topicDetail.css";

function TopicDetailPage() {
  const { id } = useParams();
  const navigate = useNavigate();

  const [content, setContent] = useState(null);
  const [error, setError] = useState(false);

  useEffect(() => {
    fetch(`http://localhost:3000/api/content/${id}`)
      .then(res => {
        if (!res.ok) throw new Error("Nem található");
        return res.json();
      })
      .then(data => {
        setContent(data[0].content);
      })
      .catch(err => {
        console.error(err);
        setError(true);
      });
  }, [id]);

  if (error) {
    return (
      <Container className="my-5 text-center">
        <h2>Ez a tananyag nem található</h2>
        <Button onClick={() => navigate(-1)}>Vissza</Button>
      </Container>
    );
  }

  if (!content) {
    return (
      <Container className="my-5 text-center">
        <h2>Betöltés...</h2>
      </Container>
    );
  }

  return (
    <Container className="my-5">
      <div dangerouslySetInnerHTML={{ __html: content }} />

      <div className="text-center mt-5">
        <Button onClick={() => navigate(-1)}>← Vissza</Button>
      </div>
    </Container>
  );
}

export default TopicDetailPage;
