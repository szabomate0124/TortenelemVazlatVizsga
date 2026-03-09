import { useState } from "react";
import { Editor } from "@tinymce/tinymce-react";
import { useParams } from "react-router-dom";

function CreateTopic() {
  const { catId } = useParams();

  const [title, setTitle] = useState("");
  const [content, setContent] = useState("");
  const [image, setImage] = useState(null);

  const handleSubmit = async () => {
    const token = localStorage.getItem("token");

    const formData = new FormData();

    formData.append("title", title);
    formData.append("content", content);
    formData.append("category_id", catId);
    formData.append("img", image);

    const res = await fetch("http://localhost:3000/api/insert", {
      method: "POST",
      headers: {
        Authorization: `Bearer ${token}`,
      },
      body: formData,
    });

    const data = await res.json();

    alert(data.message);
  };

  return (
    <div className="container mt-5">
      <h2>Új téma létrehozása</h2>

      <input
        className="form-control mb-3"
        placeholder="Téma címe"
        value={title}
        onChange={(e) => setTitle(e.target.value)}
      />

      <input
        type="file"
        className="form-control mb-3"
        onChange={(e) => setImage(e.target.files[0])}
      />

      <Editor
        apiKey="umbatoq91wae4ignquxjlhkaxl11r4e4t5bhrkwkdhkspqmn"
        value={content}
        onEditorChange={(newValue) => setContent(newValue)}
        init={{
          height: 500,
          menubar: false,
        }}
      />

      <button className="btn btn-primary mt-3" onClick={handleSubmit}>
        Mentés
      </button>
    </div>
  );
}

export default CreateTopic;
