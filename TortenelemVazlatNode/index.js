const express = require("express");
const mysql = require("mysql2");
const cors = require("cors");
const bcrypt = require("bcrypt");
const jwt = require("jsonwebtoken");


const app = express();
const PORT = 3000;
const SECRET_KEY = "test";
app.use(cors());
app.use(express.json());

const connection = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "",
  database: "ToriTartalom",
  port: process.env.DB_PORT
});




app.get('/api/topicsByCategory/:id', (req, res)=>{
    const id = req.params.id;
    const sql = `SELECT DISTINCT topics.id, topics.title, topics.img from topics WHERE topics.category_id = ${id}`;
    connection.query(sql, (error, results) =>{
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
    const sql = `SELECT  topics.title, topics.content FROM topics WHERE topics.category_id = ${catId} AND topics.id = ${tpcId}`;
    connection.query(sql, [tpcId, catId], (error, results) =>{
        if (error){
            console.error('hiba a lekérdezés során:', error);
            return res.status(500).json({ error: 'Adatbázis hiba'});
        }
        if(results.length === 0){
            return res.status(404).json({ message: 'Nem található ez a category'})
        }

        res.json(results[0]);
    });
});



app.post("/api/register", async (req, res) => {
    const { username, email, password } = req.body;

    if (!username || !email || !password) {
        return res.status(400).json({ error: "Minden mező kitöltése kötelező" });
    }

    try {
        const hashedPassword = await bcrypt.hash(password, 10);

        const sql = "INSERT INTO users (username, email, password) VALUES (?, ?, ?)";
        connection.query(sql, [username, email, hashedPassword], (err, results) => {
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

        const token = jwt.sign({ id: user.id, username: user.username }, SECRET_KEY, { expiresIn: "1h" });
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






app.listen(PORT, () => {
  console.log(`Szerver fut a http://localhost:${PORT} címen`)
})
