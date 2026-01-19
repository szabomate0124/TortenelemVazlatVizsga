import { useParams, useNavigate } from "react-router-dom";
import Container from "react-bootstrap/Container";
import Row from "react-bootstrap/Row";
import Col from "react-bootstrap/Col";
import Card from "react-bootstrap/Card";
import Button from "react-bootstrap/Button";
import "./topicPage.css";

import card1 from "./assets/card1.jpg";
import card2 from "./assets/card2.jpg";
import card4 from "./assets/card4.jpg";

const topicData = {
  egyetemes: {
    title: "Egyetemes történelem",
    description: "Az ókortól a modern korig: fontos események, korszakok és összefüggések érthetően.",
    items: [
      { id: "oskor", title: "Az őskor", text: "Ősember, civilizációk, kultúrák kialakulása.", image: card1 },
      { id: "okoriKelet", title: "Az ókori Kelet", text: "Mezopotámia, Egyiptom, India és Kína.", image: card2 },
    ],
  },
  magyar: {
    title: "Magyar történelem",
    description: "A honfoglalástól napjainkig – a magyar történelem fő korszakai.",
    items: [
      { id: "honfoglalas", title: "A magyar honfoglalás", text: "A magyar törzsek letelepedése.", image: card4 },
    ],
  },
};

function TopicPage() {
  const { slug } = useParams();
  const navigate = useNavigate();

  const topic = topicData[slug];

  if (!topic) {
    return (
      <Container className="my-5 text-center">
        <h2>Ez a téma nem található</h2>
        <Button className="btn-filled-custom mt-3" onClick={() => navigate("/")}>
          Vissza a főoldalra
        </Button>
      </Container>
    );
  }

  return (
    <>
      <div className="topic-header text-center">
        <Container>
          <h1>{topic.title}</h1>
          <p>{topic.description}</p>
        </Container>
      </div>

      <Container className="my-5">
        <Row className="g-4">
          {topic.items.map((item) => (
            <Col md={4} key={item.id}>
              <Card className="topic-card h-100">
                <Card.Img variant="top" src={item.image} alt={item.title} />
                <Card.Body className="d-flex flex-column">
                  <Card.Title>{item.title}</Card.Title>
                  <Card.Text>{item.text}</Card.Text>

                  <Button
                    className="btn-outline-custom mt-auto"
                    onClick={() => navigate(`/topic-detail/${item.id}`)}
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
            ← Vissza a főoldalra
          </span>
        </div>
      </Container>
    </>
  );
}

export default TopicPage;
