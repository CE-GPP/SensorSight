import mysql from "mysql";

export default class camerasController {
  constructor() {
  }

 async getAll(req, res) {
    try{
      var con = mysql.createConnection({
        host: "host",
        user: "",
        password: "",
        database: ""
      });

      con.connect(function(err) {
        if (err) throw err;
        con.query("SELECT * FROM cameras", function (err, result, fields) {
          if (err) throw err;
          console.log(result);
          res.send(result);
        });
      });
      

    } catch (err) {
      console.log(err);
      res.sendStatus(500);
    }
  }
}