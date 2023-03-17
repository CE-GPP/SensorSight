import mysql from "mysql";

export default class camerasController {
  constructor() {
  }

      var con = mysql.createConnection({
        host: "host",
        user: "",
        password: "",
        database: ""
  async getAll(req, res) {
    try {
      });

      connection.connect();
      
      connection.query("SELECT * FROM cameras", function (err, result, fields) {
        if (err) {
          console.log(err);
          res.sendStatus(500);
        }
        console.log(result);
        
        for (var i = 0; i < result.length; i++) {
          result[i].camera_coordinates = JSON.parse(result[i].camera_coordinates);
          result[i].column_base_coordinates = JSON.parse(result[i].column_base_coordinates);
          result[i].vision_field_1 = JSON.parse(result[i].vision_field_1);
          result[i].vision_field_2 = JSON.parse(result[i].vision_field_2);
          result[i].vision_field_3 = JSON.parse(result[i].vision_field_3);
          result[i].vision_field_4 = JSON.parse(result[i].vision_field_4);
        }

        res.send(result);
      });

      connection.end();

    } catch (err) {
      console.log(err);
      res.sendStatus(500);
    }
  }
}