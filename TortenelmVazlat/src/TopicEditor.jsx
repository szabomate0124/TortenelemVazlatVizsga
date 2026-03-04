import { useEffect, useState } from "react";
import { useParams, useNavigate } from "react-router-dom";
import { Editor } from "@tinymce/tinymce-react";
import Container from "react-bootstrap/Container";
import Button from "react-bootstrap/Button";
import Spinner from "react-bootstrap/Spinner";

function TopicEditor() {
  const { catId, tpcId } = useParams();
  const navigate = useNavigate();

  const [title, setTitle] = useState("");
  const [content, setContent] = useState("");
  const [loading, setLoading] = useState(true);
  const [saving, setSaving] = useState(false);

  useEffect(() => {
    fetch(`http://localhost:3000/api/content/${catId}/${tpcId}`)
      .then(res => {
        if (!res.ok) throw new Error();
        return res.json();
      })
      .then(data => {
        setTitle(data.title);
        setContent(data.content);
        setLoading(false);
      })
      .catch(() => {
        navigate("/");
      });

  }, [catId, tpcId]);

  const handleSave = async () => {
    try {
      setSaving(true);

      const token = localStorage.getItem("token");

      const response = await fetch(
        `http://localhost:3000/api/topics/${catId}/${tpcId}`,
        {
          method: "PUT",
          headers: {
            "Content-Type": "application/json",
            Authorization: `Bearer ${token}`
          },
          body: JSON.stringify({
            title,
            content
          })
        }
      );

      const data = await response.json();

      if (!response.ok) {
        alert(data.error);
        setSaving(false);
        return;
      }

      alert("Sikeres mentés!");
      navigate(`/topic/${catId}/${tpcId}`);

    } catch (error) {
      console.error(error);
      alert("Hiba történt mentés közben");
      setSaving(false);
    }
  };

  if (loading) {
    return (
      <Container className="my-5 text-center">
        <Spinner animation="border" />
        <p>Betöltés...</p>
      </Container>
    );
  }

  return (
    <Container className="my-5">
      <h2>Téma szerkesztése</h2>

      <input
        type="text"
        className="form-control mb-3"
        value={title}
        onChange={(e) => setTitle(e.target.value)}
        placeholder="Téma címe"
      />

      <Editor
        apiKey="umbatoq91wae4ignquxjlhkaxl11r4e4t5bhrkwkdhkspqmn"
        value={content}
        onEditorChange={(newValue) => setContent(newValue)}
        init={{
          height: 500,
          menubar: false,
          plugins: ["lists", "link", "image", "table", "code"],
          toolbar:
            "undo redo | bold italic underline | alignleft aligncenter alignright | bullist numlist | table | code"
        }}
      />

      <Button
        className="btn-filled-custom mt-3"
        onClick={handleSave}
        disabled={saving}
      >
        {saving ? "Mentés..." : "Mentés"}
      </Button>
    </Container>
  );
}

export default TopicEditor;