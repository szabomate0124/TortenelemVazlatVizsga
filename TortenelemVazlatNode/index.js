const express = require("express");
const mysql = require("mysql2");



const connection = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "",
  //database: "ToriTartalom",
  port: process.env.DB_PORT
});