import { useParams, useNavigate } from "react-router-dom";
import { useEffect, useState, useContext } from "react";
import Container from "react-bootstrap/Container";
import Button from "react-bootstrap/Button";
import { AuthContext } from "./AuthContext" 

import "./topicDetail.css";

function TopicDetailPage() {
  const { catId, tpcId } = useParams();
  const navigate = useNavigate();

  const [topic, setTopic] = useState(null);
  const [error, setError] = useState(false);
  const { user, isAdmin } = useContext(AuthContext); 
  console.log(user)
  useEffect(() => {
    if (!catId || !tpcId) {
      setError(true);
      return;
    }

    fetch(`http://localhost:3000/api/content/${catId}/${tpcId}`)
      .then(res => {
        if (!res.ok) throw new Error("Nem található");
        return res.json();
      })
      .then(data => {
        setTopic({
          title: data.title,
          content: data.content,
        });
      })
      .catch(err => {
        console.error(err);
        setError(true);
      });
  }, [catId, tpcId]);

  if (error) {
    return (
      <Container className="my-5 text-center">
        <h2>Ez a tananyag nem található</h2>
        <Button
          className="btn-outline-custom mt-3"
          onClick={() => navigate(-1)}
        >
          ← Vissza
        </Button>
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
    <Container className="my-5">
      
      <div className="history-content">

        <h1>{topic.title}</h1>
        {isAdmin() 
          ? <div> 
              <button>Admin gomb 1</button>
              <button>Admin gomb 2</button>
             </div> 
          : null}

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
