//backend/server.js
const express = require("express");
const mysql = require("mysql2/promise");
const cors = require("cors");

const app = express();
app.use(cors());

const dbConfig = {
  host: "mysql",
  user: "root",
  password: "1234",
  database: "visitasdb",
};

app.get("/api/visitas", async (req, res) => {
  try {
    const conn = await mysql.createConnection(dbConfig);
    await conn.execute(`
      CREATE TABLE IF NOT EXISTS contador (
        id INT PRIMARY KEY AUTO_INCREMENT,
        visitas INT
      )
    `);
    const [rows] = await conn.query(
      "SELECT visitas FROM contador ORDER BY id DESC LIMIT 1"
    );
    let visitas = rows.length ? rows[0].visitas + 1 : 1;
    await conn.execute("INSERT INTO contador (visitas) VALUES (?)", [visitas]);
    await conn.end();
    res.json({ visitas });
  } catch (err) {
    console.error("MySQL error:", err);
    res.status(500).send("Error al acceder a MySQL");
  }
});

app.listen(3000, () => {
  console.log("Backend escuchando en el puerto 3000");
});
