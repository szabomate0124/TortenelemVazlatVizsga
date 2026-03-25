import { useState } from "react";
import { Editor } from "@tinymce/tinymce-react";
import { useParams } from "react-router-dom";
import Container from "react-bootstrap/Container";
import Button from "react-bootstrap/Button";
import "./createTopic.css";

function CreateTopic() {
  const { catId } = useParams();

  const [title, setTitle] = useState("");
  const [content, setContent] = useState("");
  const [image, setImage] = useState("");

  const convertToBase64 = async (file) => {
    const fileReader = new FileReader();
    fileReader.readAsDataURL(file);

    fileReader.onload = () => {
      setImage(fileReader.result);
    };

    fileReader.onerror = (error) => {
      alert(error);
    };
  };

  const handleSubmit = async () => {
    const token = localStorage.getItem("token");

    const adatok = {
      title: title,
      category_id: catId,
      content: content,
      img: image
    };

    const res = await fetch("http://localhost:3000/api/insert", {
      method: "POST",
      headers: {
        Authorization: `Bearer ${token}`,
        "Content-Type": "application/json"
      },
      body: JSON.stringify(adatok),
    });

    const data = await res.json();
    alert(data.message);
  };

  return (
    <Container className="my-5 create-topic-container">
      <div className="create-topic-box">

        <h2 className="create-title">Új téma létrehozása</h2>

        <input
          className="form-control mb-3 create-input"
          placeholder="Téma címe"
          value={title}
          onChange={(e) => setTitle(e.target.value)}
        />

        <input
          type="file"
          className="form-control mb-3 create-file"
          onChange={(e) => convertToBase64(e.target.files[0])}
        />

        <div className="create-editor-wrapper">
          <Editor
            apiKey="umbatoq91wae4ignquxjlhkaxl11r4e4t5bhrkwkdhkspqmn"
            value={content}
            onEditorChange={(newValue) => setContent(newValue)}
            init={{
              height: 500,
              menubar: false,
            }}
          />
        </div>

        <div className="create-actions">
          <Button
            className="btn-filled-custom"
            onClick={handleSubmit}
          >
            Mentés
          </Button>
        </div>

      </div>
    </Container>
  );
}

export default CreateTopic;