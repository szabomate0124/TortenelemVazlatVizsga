const express = require("express");
const mysql = require("mysql2");
const cors = require("cors");
const bcrypt = require("bcrypt");
const jwt = require("jsonwebtoken");
const { randomUUID } = require("crypto");
const fs = require("fs");
const path = require("path");
const multer = require('multer');

const app = express();
const PORT = 3000;
const SECRET_KEY = "test";

app.use(cors());
app.use(express.json({ limit: "10mb" }));
app.use(express.urlencoded({ limit: "10mb", extended: true }));
app.use("/Torivazlatkepek", express.static("../Torivazlatkepek"));

const connection = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "",
  database: "ToriTartalom",
  port: process.env.DB_PORT
});

const storage = multer.diskStorage({
    destination: function (req, file, cb) {
        cb(null, '../Torivazlatkepek/');
    },
    filename: function (req, file, cb) {
        const uniqueSuffix = Date.now() + '-' + Math.round(Math.random() * 1E9);
        cb(null, uniqueSuffix + path.extname(file.originalname));
    }
});


const upload = multer({
    storage: storage,
    limits: { fileSize: 5 * 1024 * 1024 },
    fileFilter: (req, file, cb) => {
        if (file.mimetype.startsWith('image/')) {
            cb(null, true);
        } else {
            cb(new Error('Csak képfájlok engedélyezettek!'));
        }
    }
});

app.get("/api/allUsers", (req,res) =>{ connection.query("SELECT * FROM users", (err, results) => { if (err) { console.error(err); return res.status(500).json({ error: "Adatbázis hiba" }); } res.json(results); }); } )
    
app.get("/api/allCategory", (req, res) =>{ connection.query("SELECT * FROM topics", (err, results)=>{ return res.status(200).json(results) }) })


app.get('/api/topicsByCategory/:id', (req, res)=>{
    const id = req.params.id;

    const sql = `SELECT id, title, img FROM topics WHERE category_id = ?`;

    connection.query(sql, [id], (error, results) =>{
        if (error){
            console.error('hiba a lekérdezés során:', error);
            return res.status(500).json({ error: 'Adatbázis hiba'});
        }

        if(results.length === 0){
            return res.status(404).json({ message: 'Nem található ez a category'})
        }

        res.json(results);
    });
});

app.get('/api/content/:catId/:tpcId', (req, res)=>{
    const {tpcId, catId} = req.params;

    const sql = `
      SELECT title, content FROM topics WHERE category_id = ? AND id = ? `;

    connection.query(sql, [catId, tpcId], (error, results) =>{
        if (error){
            console.error('hiba a lekérdezés során:', error);
            return res.status(500).json({ error: 'Adatbázis hiba'});
        }

        if(results.length === 0){
            return res.status(404).json({ message: 'Nem található ez a téma'})
        }

        res.json(results[0]);
    });
});

app.get("/api/search", (req, res) => {

  const query = req.query.q || "";

  const sql = ` SELECT id, title, img, category_id FROM topics WHERE title LIKE ? `;

  connection.query(sql, [`%${query}%`], (err, results) => {

    if (err) {
      console.error(err);
      return res.status(500).json({ error: "Adatbázis hiba" });
    }

    res.json(results);

  });

});

app.post('/upload', upload.single('file'), (req, res) => {
    if (!req.file) {
        return res.status(400).json({ error: 'Nincs fájl kiválasztva' });
    }

    const fileUrl = `http://localhost:${PORT}/Torivazlatkepek/${req.file.filename}`;
    res.json({ location: fileUrl });
});

app.post('/api/insert', (req, res) => {

    const base64Image = req.body.img;
    let fileName = null;

    if (base64Image) {
        const base64Data = base64Image.replace(/^data:image\/\w+;base64,/, "");
        fileName = randomUUID() + ".png";
        const savePath = path.join(__dirname, "../Torivazlatkepek", fileName);
        fs.writeFileSync(savePath, Buffer.from(base64Data, "base64"));
    }

    const { title, category_id, content } = req.body;

    const sqlInsert = `
      INSERT INTO topics (title, category_id, content, img) VALUES (?, ?, ?, ?) `;

    connection.query(
      sqlInsert,
      [title, category_id, content, fileName],
      (err) => {
        if (err) {
            console.log(err);
            return res.status(500).send({message: "Hiba a mentés során!"});
        }
        res.send({message: "Sikeres mentés"});
      }
    );
});

app.post("/api/register", async (req, res) => {
    const { username, email, password } = req.body;

    if (!username || !email || !password) {
        return res.status(400).json({ error: "Minden mező kitöltése kötelező" });
    }

    try {
        const hashedPassword = await bcrypt.hash(password, 10);

        const sql = "INSERT INTO users (username, email, password, auth_id) VALUES (?, ?, ?, 2)";
        connection.query(sql, [username, email, hashedPassword], (err) => {
            if (err) {
                console.error("Adatbázis hiba:", err);
                return res.status(500).json({ error: "Adatbázis hiba" });
            }
            res.json({ message: "Sikeres regisztráció" });
        });
    } catch (error) {
        console.error(error);
        res.status(500).json({ error: "Szerver hiba" });
    }
});

app.post("/api/login", (req, res) => {
    const { email, password } = req.body;

    if (!email || !password) {
        return res.status(400).json({ error: "Email és jelszó kötelező" });
    }

    const sql = "SELECT * FROM users WHERE email = ?";
    connection.query(sql, [email], async (err, results) => {
        if (err) {
            console.error("Adatbázis hiba:", err);
            return res.status(500).json({ error: "Adatbázis hiba" });
        }

        if (results.length === 0) {
            return res.status(401).json({ error: "Helytelen email vagy jelszó" });
        }

        const user = results[0];
        const match = await bcrypt.compare(password, user.password);

        if (!match) {
            return res.status(401).json({ error: "Helytelen email vagy jelszó" });
        }

        const token = jwt.sign(
          { id: user.id, username: user.username, email: user.email, auth_id: user.auth_id },
          SECRET_KEY,
          { expiresIn: "1h" }
        );

        res.json({ message: "Sikeres bejelentkezés", token });
    });
});

const authenticateToken = (req, res, next) => {
    const authHeader = req.headers["authorization"];
    const token = authHeader && authHeader.split(" ")[1];

    if (!token) return res.status(401).json({ error: "Token hiányzik" });

    jwt.verify(token, SECRET_KEY, (err, user) => {
        if (err) return res.status(403).json({ error: "Érvénytelen token" });
        req.user = user;
        next();
    });
};

app.put("/api/topics/:catId/:tpcId", authenticateToken, (req, res) => {
  const { catId, tpcId } = req.params;
  const { title, content } = req.body;

  if (req.user.auth_id !== 1) {
    return res.status(403).json({ error: "Nincs jogosultság" });
  }

  const sql = ` UPDATE topics SET title = ?, content = ? WHERE id = ? AND category_id = ?`;

  connection.query(sql, [title, content, tpcId, catId], (err, results) => {
    if (err) {
      console.error(err);
      return res.status(500).json({ error: "Adatbázis hiba" });
    }

    if (results.affectedRows === 0) {
      return res.status(404).json({ error: "Nem található a téma" });
    }

    res.json({ message: "Sikeres módosítás" });
  });
});

//téma törlése
app.delete("/api/topics/:catId/:tpcId", authenticateToken, (req, res) => {
  const { catId, tpcId } = req.params;

  if (req.user.auth_id !== 1) {
    return res.status(403).json({ error: "Nincs jogosultság" });
  }

  const sql = `DELETE FROM topics WHERE topics.id = ? AND topics.category_id = ?`;

  connection.query(sql, [tpcId, catId], (err, results) => {
    if (err) {
      console.error(err);
      return res.status(500).json({ error: "Adatbázis hiba" });
    }

    if (results.affectedRows === 0) {
      return res.status(404).json({ error: "Nem található a téma" });
    }

    res.json({ message: "Sikeres törlés" });
  });
});


app.put("/api/users/:id/role", authenticateToken, (req, res) => {
  const userId = req.params.id;
  const { auth_id } = req.body;

  if (req.user.auth_id !== 1) {
    return res.status(403).json({ error: "Nincs jogosultság" });
  }

  const sql = "UPDATE users SET auth_id = ? WHERE id = ?";
  connection.query(sql, [auth_id, userId], (err, results) => {
    if (err) {
      console.error(err);
      return res.status(500).json({ error: "Adatbázis hiba" });
    }

    if (results.affectedRows === 0) {
      return res.status(404).json({ error: "Nem található a felhasználó" });
    }

    res.json({ message: "Jogosultság módosítva" });
  });
});


app.delete("/api/users/:id", authenticateToken, (req, res) => {
  const userId = req.params.id;

  if (req.user.auth_id !== 1) {
    return res.status(403).json({ error: "Nincs jogosultság" });
  }

  const sql = "DELETE FROM users WHERE id = ?";
  connection.query(sql, [userId], (err, results) => {
    if (err) {
      console.error(err);
      return res.status(500).json({ error: "Adatbázis hiba" });
    }

    if (results.affectedRows === 0) {
      return res.status(404).json({ error: "Nem található a felhasználó" });
    }

    res.json({ message: "Felhasználó törölve" });
  });
});



app.listen(PORT, () => {
  console.log(`Szerver fut a http://localhost:${PORT} címen`)
})