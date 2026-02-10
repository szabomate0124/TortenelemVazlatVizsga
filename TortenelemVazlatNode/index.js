const express = require("express");
const mysql = require("mysql2");
const cors = require("cors");
const bcrypt = require("bcrypt");
const jwt = require("jsonwebtoken");


const app = express();
const PORT = 3000;
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
    const sql = `SELECT DISTINCT topics.title, topics.img from topics WHERE topics.category_id = ${id}`;
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



app.listen(PORT, () => {
  console.log(`Szerver fut a http://localhost:${PORT} címen`)
})
