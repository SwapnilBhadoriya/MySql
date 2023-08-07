const express = require("express");
const ejs = require("ejs");
const mysql = require("mysql");

const app = express();
app.use(express.json());
app.use(express.static("public"));
app.use(express.urlencoded({ extended: false }));
app.set("view engine", "ejs");

const connection = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "",
  database: "join_us_db",
});
app.post("/register", (req, res) => {
  const q = "Insert into users Set ?";

  connection.query(q, req.body, function (err, results, fields) {
    if (err) throw err;
    return res.redirect("/");
  });
});
app.get("/", (req, res) => {
  const q = "Select count(*) as count from users";
  connection.query(q, function (err, results) {
    if (err) throw err;
    const count = results[0].count;
    return res.render("home", { count });
  });
});
app.listen(5000, () => {
  console.log("Server is running at port : ", 5000);
});
