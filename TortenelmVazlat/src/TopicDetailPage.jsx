import { useParams, useNavigate } from "react-router-dom";
import { useEffect, useState } from "react";
import Container from "react-bootstrap/Container";
import Button from "react-bootstrap/Button";

import "./topicDetail.css";

function TopicDetailPage() {
  const { id } = useParams();
  const navigate = useNavigate();

  const [topic, setTopic] = useState(null);
  const [error, setError] = useState(false);

  useEffect(() => {
    if (!id || id === "undefined" || id === "0") {
      setError(true);
      return;
    }

    fetch(`http://localhost:3000/api/content/${id}`)
      .then(res => {
        if (!res.ok) throw new Error("Nem található");
        return res.json();
      })
      .then(data => {
        const item = data[0];

        if (!item) {
          setError(true);
          return;
        }

        // Ez a backended szerinti struktúra
        setTopic({
          title: item.title || "Téma",
          description: item.description || "Tananyag részletek",
          content: item.content || "",
          img: item.img || null
        });
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

  if (!topic) {
    return (
      <Container className="my-5 text-center">
        <h2>Betöltés...</h2>
      </Container>
    );
  }

  return (
    <>
      {/* HEADER */}
      <div className="topic-detail-header">
        <h1>{topic.title}</h1>
        <p>{topic.description}</p>
      </div>

      {/* CONTENT */}
      <div className="topic-detail-content">
        {topic.img && (
          <div className="image-section">
            <img src={topic.img} alt={topic.title} />
            <small>Forrás: {topic.title}</small>
          </div>
        )}

        <div
          className="content-section"
          dangerouslySetInnerHTML={{ __html: topic.content }}
        />
      </div>

      <div className="topic-detail-content topic-footer">
        <Button onClick={() => navigate(-1)}>← Vissza</Button>
      </div>
    </>
  );
}

export default TopicDetailPage;
