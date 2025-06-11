//backend/server.js
// Importa los módulos necesarios
const express = require("express");
const mysql = require("mysql");
const app = express();
const cors = require("cors");

// Middleware para permitir solicitudes de otros dominios
app.use(cors());
app.use(express.json());

// Variables de entorno para conectar a la base de datos
const db = mysql.createConnection({
  host: process.env.DB_HOST,
  user: process.env.DB_USER,
  password: process.env.DB_PASSWORD,
  port: process.env.DB_PORT,
  database: process.env.DB_NAME,
});

// Ruta para responder con mensaje simple
app.get("/", (req, res) => {
  res.send("API del backend financiero");
});

// Ruta para obtener datos de prueba
app.get("/usuarios", (req, res) => {
  db.query("SELECT * FROM usuarios", (err, results) => {
    if (err) return res.status(500).send(err);
    res.json(results);
  });
});

// Levanta el servidor en el puerto 3000
app.listen(3000, () => {
  console.log("Servidor backend corriendo en puerto 3000");
});
