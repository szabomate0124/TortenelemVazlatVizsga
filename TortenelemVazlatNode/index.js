const express = require("express");
const mysql = require("mysql2");
const cors = require("cors");

const app = express();
const PORT = 3000;
app.use(cors());

const connection = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "",
});


//Adatbázis létrehozása
connection.connect((err) => {
  connection.query("CREATE DATABASE IF NOT EXISTS ToriTartalom", (err) => {
    if (err) console.error(err);
    connection.changeUser({ database: "ToriTartalom" }, (err) => {
      if (err) console.error(err);
      createTables();
      insertIntoTables()
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
    if (err) throw  err;
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
      img VARCHAR(255),
      FOREIGN KEY (category_id) REFERENCES category(id)
        ON UPDATE CASCADE
    )
  `, (err) => {
    if (err) throw  err;
  });

  connection.query(`
    CREATE TABLE IF NOT EXISTS \`update\` (
      id INT AUTO_INCREMENT PRIMARY KEY,
      changes TEXT NOT NULL,
      change_time DATETIME DEFAULT CURRENT_TIMESTAMP,
      update_id INT NOT NULL,
      users_id INT NOT NULL,
      FOREIGN KEY (update_id) REFERENCES topics(id)
        ON UPDATE CASCADE,
      FOREIGN KEY (users_id) REFERENCES Users(id)
        ON UPDATE CASCADE
    )
  `, (err) => {
    if (err) throw  err;
  });
}
//Táblázatok feltöltése adattal

function insertIntoTables(){
    // 1. authority
  connection.query(`
    INSERT IGNORE INTO authority (name, \`desc\`) VALUES
      ('admin', 'Teljes hozzáférés, minden művelet'),
      ('user', 'Normál regisztrált felhasználó'),
      ('guest', 'Nem bejelentkezett látogató (olvasás csak)')
    `, err => { 
      if (err) throw err; 
    });

    // 2. Users – javított auth_id-k
  connection.query(`
    INSERT IGNORE INTO Users (username, email, password, auth_id) VALUES
      ('admin_József',    'admin@tori.hu',          'admin123',           1),
      ('kukac42',         'kukac42@gmail.com',      'kukac1234',          2),
      ('tortenetfan',     'tortenetfan99@gmail.hu', 'tortenelemfan',      2),
      ('ujtag_2003',      'ujtag2025@gmail.me',     'titkos2025',         2)
    `, err => { 
      if (err) throw err; 
    });

    // 3. category – javított nevek + vessző nélkül
  connection.query(`
    INSERT IGNORE INTO category (name) VALUES
      ('Egyetemes történelem'),
      ('Magyar történelem'),
      ('Érettségi felkészülés'),
      ('Segédanyagok'),
      ('Források'),
      ('Érdekességek')
    `, err => { 
      if (err) throw err; 
});

    // 5. update
  connection.query(`
    INSERT IGNORE INTO \`update\` (changes, update_id, users_id) VALUES
      ('Hozzáadva térkép és útvonalak', 1, 1),
      ('Javítva helyesírás + évszámok', 1, 1),
      ('Bővítve: gazdaság összeomlása', 2, 1),
      ('Kép csatolva + mondatok javítva', 3, 1)
    `, err => { 
      if (err) throw err; 
});

    // 6. Loginlog
  connection.query(`
    INSERT IGNORE INTO Loginlog (users_id, ip_address, time_stamp) VALUES
      (1, '192.168.1.105',   '2025-12-15 09:12:33'),
      (2, '85.214.132.77',   '2025-12-17 08:30:22'),
      (4, '178.48.12.145',   '2025-12-18 19:05:17'),
      (3, '109.74.200.33',   '2025-12-19 08:12:09')
    `, err => { 
        if (err) throw err;
});
}




app.listen(PORT, () => {
  console.log(`Szerver fut a http://localhost:${PORT} címen`)
})