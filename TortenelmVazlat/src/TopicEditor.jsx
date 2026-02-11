import { useState } from "react";
import { Editor } from "@tinymce/tinymce-react";
import Button from "react-bootstrap/Button";
import Container from "react-bootstrap/Container";

function TopicEditor() {
  const [content, setContent] = useState("");

  const handleSave = () => {
    console.log(content);
    // Post kérés majd ide kell
  };

  return (
    <Container className="my-5">
      <h2 style={{ color: "var(--primary-dark)" }}>
        Téma szerkesztése
      </h2>

      <Editor
        apiKey="no-api-key"
        value={content}
        onEditorChange={(newValue) => setContent(newValue)}
        init={{
          height: 500,
          menubar: false,
          plugins: [
            "lists", "link", "image", "table", "code"
          ],
          toolbar:
            "undo redo | blocks | bold italic underline | " +
            "alignleft aligncenter alignright | " +
            "bullist numlist | table | code",
          content_style:
            "body { font-family: Georgia, serif; font-size:18px }"
        }}
      />

      <Button
        className="btn-filled-custom mt-3"
        onClick={handleSave}
      >
        Mentés
      </Button>
    </Container>
  );
}

export default TopicEditor;
