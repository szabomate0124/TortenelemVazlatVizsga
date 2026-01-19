import { useParams, useNavigate } from "react-router-dom";
import Container from "react-bootstrap/Container";
import Image from "react-bootstrap/Image";
import Button from "react-bootstrap/Button";
import "./topicDetail.css"; // győződj meg róla, hogy a fájl pontosan így van elnevezve

// Topics adatok, képek a public/assets mappából
const topics = {
  oskor: {
    title: "Az őskor",
    sections: [
      { type: "heading", text: "A világ keletkezése" },
      {
        type: "list",
        items: [
          "Az emberiség legősibb kérdése",
          "Mitológiai magyarázatok",
          "Vallásos magyarázatok",
          "Filozófiai elméletek",
          "Tudományos elméletek (ősrobbanás, evolúció)",
        ],
      },
      { type: "image", src: "/assets/card1.jpg", caption: "Az ősrobbanás elmélete" },
      { type: "heading", text: "Az emberré válás" },
      {
        type: "paragraph",
        text: "Az ember az állatvilágból alakult ki hosszú biológiai fejlődés során.",
      },
      {
        type: "list",
        items: ["gondolkodás", "eszközhasználat", "beszéd", "tűz használata"],
      },
    ],
  },
  okoriKelet: {
    title: "Az ókori Kelet",
    sections: [
      { type: "heading", text: "Folyó menti civilizációk" },
      {
        type: "list",
        items: [
          "Mezopotámia – Tigris és Eufrátesz",
          "Egyiptom – Nílus",
          "Indus-völgy",
          "Kína – Huang-ho",
        ],
      },
      { type: "image", src: "/assets/card2.jpg", caption: "Ókori folyóvölgyek" },
    ],
  },
  honfoglalas: {
    title: "A magyar honfoglalás",
    sections: [
      { type: "paragraph", text: "A magyar törzsek a 9. század végén érkeztek a Kárpát-medencébe." },
      { type: "image", src: "/assets/card4.jpg", caption: "A honfoglalás útvonala" },
    ],
  },
};

function TopicDetailPage() {
  const { id } = useParams();
  const navigate = useNavigate();
  const topic = topics[id];

  // Ha nincs ilyen topic
  if (!topic) {
    return (
      <Container className="my-5 text-center">
        <h2>Ez a tananyag nem található</h2>
        <Button className="btn-filled-custom mt-3" onClick={() => navigate("/")}>
          Vissza a főoldalra
        </Button>
      </Container>
    );
  }

  return (
    <>
      {/* Header */}
      <div className="topic-detail-header">
        <Container className="text-center">
          <h1>{topic.title}</h1>
        </Container>
      </div>

      {/* Tartalom */}
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
                  <Image src={section.src} fluid rounded alt={section.caption} />
                  <small>{section.caption}</small>
                </div>
              );
            default:
              return null;
          }
        })}

        {/* Vissza gomb */}
        <div className="text-center mt-5">
          <Button className="btn-outline-custom" onClick={() => navigate(-1)}>
            ← Vissza
          </Button>
        </div>
      </Container>
    </>
  );
}

export default TopicDetailPage;
