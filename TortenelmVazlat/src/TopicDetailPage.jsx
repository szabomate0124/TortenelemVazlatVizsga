import { useParams, useNavigate } from "react-router-dom";
import { useEffect, useState } from "react";
import Container from "react-bootstrap/Container";
import Image from "react-bootstrap/Image";
import Button from "react-bootstrap/Button";
import "./topicDetail.css";

function TopicDetailPage() {
  const { id } = useParams();
  const navigate = useNavigate();

  const [topic, setTopic] = useState(null);
  const [error, setError] = useState(false);

  useEffect(() => {
    fetch(`http://localhost:3000/api/topics/${id}`)
      .then(res => {
        if (!res.ok) throw new Error("Nem található");
        return res.json();
      })
      .then(data => setTopic(data))
      .catch(() => setError(true));
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
      <div className="topic-detail-header text-center">
        <Container>
          <h1>{topic.title}</h1>
        </Container>
      </div>

      <Container className="topic-detail-content">
        {topic.sections.map((section, index) => {
          switch (section.type) {
            case "heading":
              return <h2 key={index}>{section.text}</h2>;

            case "paragraph":
              return <p key={index}>{section.text}</p>;

            case "list":
              return (
                <ul key={index}>
                  {section.items.map((item, i) => (
                    <li key={i}>{item}</li>
                  ))}
                </ul>
              );

            case "image":
              return (
                <div className="image-section" key={index}>
                  <Image
                    src={section.src}
                    alt={section.caption}
                    fluid
                    rounded
                  />
                  <small>{section.caption}</small>
                </div>
              );

            default:
              return null;
          }
        })}

        <div className="text-center mt-5">
          <Button onClick={() => navigate(-1)}>← Vissza</Button>
        </div>
      </Container>
    </>
  );
}

export default TopicDetailPage;
