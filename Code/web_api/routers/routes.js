import express from "express";
import exampleController from "../controllers/exampleController.js";

const router = express.Router();

const exController = new exampleController();

router.get('/test/', (req, res) => {
  exController.findRoute(req, res);
});
export default router;
