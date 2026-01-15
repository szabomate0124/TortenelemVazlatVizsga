import { useParams, useNavigate } from "react-router-dom";
import Container from "react-bootstrap/Container";
import Row from "react-bootstrap/Row";
import Col from "react-bootstrap/Col";
import Card from "react-bootstrap/Card";
import Button from "react-bootstrap/Button";
import "./topicPage.css";

/**
 * MOCK ADATOK
 * Később ezt a Node API fogja visszaadni
 */
const topicData = {
  egyetemes: {
    title: "Egyetemes történelem",
    description:
      "Az ókortól a modern korig: fontos események, korszakok és összefüggések érthetően.",
    items: [
      {
        title: "Az őskor",
        text: "Ősember, civilizációk, kultúrák kialakulása.",
        image: "/src/assets/card1.jpg",
      },
      {
        title: "Az ókori Kelet",
        text: "Mezopotámia, Egyiptom, India és Kína kialakulása.",
        image: "/src/assets/card2.jpg",
      },
      {
        title: "A globalizáció kiteljesedése és következményei",
        text: "A 20. század második felének és a 21. század elejének főbb eseményei.",
        image: "/src/assets/card3.jpg",
      },
    ],
  },

  magyar: {
    title: "Magyar történelem",
    description:
      "A honfoglalástól napjainkig – a magyar történelem legfontosabb korszakai.",
    items: [
      {
        title: "A magyar nép őstörténete",
        text: "A magyar törzsek letelepedése a Kárpát-medencében.",
        image: "/src/assets/card4.jpg",
      },
      {
        title: "A magyar államalapítás kora",
        text: "Államalapítás és keresztény királyság.",
        image: "/src/assets/card5.jpg",
      },
      {
        title: "Magyarország története 1990 után",
        text: "A rendszerváltás és a modern Magyarország.",
        image: "/src/assets/card6.jpg",
      },
    ],
  },

  erettsegi: {
    title: "Érettségi felkészülés",
    description:
      "Kidolgozott tételek, összefoglalók és tanulási segédletek az érettségihez.",
    items: [
      {
        title: "Tételvázlatok",
        text: "Közép- és emelt szintű kidolgozott tételek.",
        image: "/src/assets/card3.jpg",
      },
      {
        title: "Idővonalak",
        text: "Fontos események kronológiai sorrendben.",
        image: "/src/assets/card1.jpg",
      },
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
      {/* FEJLÉC */}
      <div className="topic-header text-center">
        <Container>
          <h1>{topic.title}</h1>
          <p>{topic.description}</p>
        </Container>
      </div>

      {/* TARTALOM */}
      <Container>
        <Row className="g-4">
          {topic.items.map((item, index) => (
            <Col md={4} key={index}>
              <Card className="topic-card">
                <Card.Img variant="top" src={item.image} />
                <Card.Body>
                  <Card.Title>{item.title}</Card.Title>
                  <Card.Text>{item.text}</Card.Text>
                  <Button className="btn-outline-custom">
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
