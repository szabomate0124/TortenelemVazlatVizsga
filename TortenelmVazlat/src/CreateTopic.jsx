import { useState } from "react";
import { Editor } from "@tinymce/tinymce-react";
import { useParams } from "react-router-dom";

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

  }


  const handleSubmit = async () => {
    const token = localStorage.getItem("token");

    const adatok = {

      title: title,
      category_id: catId ,
      content: content,
      img: image

    }

    console.log(adatok)

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
        onChange={(e) => convertToBase64(e.target.files[0])}
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
