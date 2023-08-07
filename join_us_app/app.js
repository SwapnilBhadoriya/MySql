const { faker } = require("@faker-js/faker");
const mysql = require("mysql");

const connection = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "Sw@pn1l31",
  database: "join_us_db",
});

const data = [];
for (let i = 0; i < 500; i++) {
  data.push([faker.internet.email(), faker.date.past()]);
}
const q = "INSERT INTO users (email,created_at) VALUES ?";
connection.query(q, [data], function (error, results, fields) {
  if (error) throw error;
  console.log(results);
});

connection.end();
