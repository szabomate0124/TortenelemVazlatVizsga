const express = require("express");
const mysql = require("mysql2");

const app = express();
const PORT = 3000;


const connection = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "",
  //database: "ToriTartalom",
  port: process.env.DB_PORT
});

//Adatbázis létrehozása
connection.connect((err) => {
  connection.query("CREATE DATABASE IF NOT EXISTS ToriTartalom", (err) => {
    if (err) console.error(err);
    connection.changeUser({ database: "ToriTartalom" }, (err) => {
      if (err) console.error(err);
      createTables();
    });
  });
});


//Adatbázis táblák létrehozása
function createTables() {
  connection.query(`
    CREATE TABLE IF NOT EXISTS authority (
      id INT AUTO_INCREMENT PRIMARY KEY,
      name VARCHAR(255) NOT NULL,
      \`desc\` VARCHAR(255)
    )
  `, (err) => {
    if (err) throw  console.log(err);
  });

  connection.query(`
    CREATE TABLE IF NOT EXISTS Users (
      id INT AUTO_INCREMENT PRIMARY KEY,
      username VARCHAR(255) NOT NULL,
      email VARCHAR(255) NOT NULL UNIQUE,
      password VARCHAR(255) NOT NULL,
      auth_id INT,
      FOREIGN KEY (auth_id) REFERENCES authority(id)
        ON UPDATE CASCADE
    )
  `, (err) => {
    if (err) throw  err;
  });

  connection.query(`
    CREATE TABLE IF NOT EXISTS Loginlog (
      id INT AUTO_INCREMENT PRIMARY KEY,
      users_id INT NOT NULL,
      ip_address VARCHAR(45) NOT NULL,
      time_stamp DATETIME DEFAULT CURRENT_TIMESTAMP,
      FOREIGN KEY (users_id) REFERENCES Users(id)
        ON UPDATE CASCADE
    )
  `, (err) => {
    if (err) throw  err;
  });

  connection.query(`
    CREATE TABLE IF NOT EXISTS category (
      id INT AUTO_INCREMENT PRIMARY KEY,
      name VARCHAR(255) NOT NULL UNIQUE
    )
  `, (err) => {
    if (err) throw  err;
  });

  connection.query(`
    CREATE TABLE IF NOT EXISTS topics (
      id INT AUTO_INCREMENT PRIMARY KEY,
      title VARCHAR(255) NOT NULL,
      category_id INT NOT NULL,
      content TEXT NOT NULL,
      img VARCHAR(255) NULL, 
      FOREIGN KEY (category_id) REFERENCES category(id)
        ON UPDATE CASCADE
    )
  `, (err) => {
    if (err) throw  err;
  });

  connection.query(`
    CREATE TABLE IF NOT EXISTS topic_images (
    id INT AUTO_INCREMENT PRIMARY KEY,
    topic_id INT NOT NULL,
    image_path VARCHAR(255) NOT NULL,
    image_name VARCHAR(255),
    FOREIGN KEY (topic_id)
        REFERENCES topics(id)
    )`
  , (err) => {
    if (err) throw  console.log(err);
  });

  connection.query(`
    CREATE TABLE IF NOT EXISTS \`update\` (
      id INT AUTO_INCREMENT PRIMARY KEY,
      changes TEXT NOT NULL,
      change_time DATETIME DEFAULT CURRENT_TIMESTAMP,
      topics_id INT NOT NULL,
      users_id INT NOT NULL,
      FOREIGN KEY (topics_id) REFERENCES topics(id)
        ON UPDATE CASCADE,
      FOREIGN KEY (users_id) REFERENCES Users(id)
        ON UPDATE CASCADE
    )
  `, (err) => {
    if (err) throw  err;
  });
}








