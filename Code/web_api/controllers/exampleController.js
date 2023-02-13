import exampleService from "../services/exampleService.js";

export default class exampleController {
  constructor() {
  }

 async getExample(req, res) {
    try{
      res.send(exampleService.getExample());
    } catch (err) {
      console.log(err);
      res.sendStatus(500);
    }
  }
}