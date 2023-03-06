import express from "express";
import camerasController from "../controllers/camerasController.js";

const router = express.Router();

const camController = new camerasController();

router.get('/api/cameras', (req, res) => {
  camController.getAll(req, res);
  // #swagger.tags = ['Cameras'] //inform which group it belongs to
  // #swagger.description = 'Get all cameras'

  /* #swagger.responses[200] = { 
        schema: { $ref: "#/definitions/Camera" },
        description: 'returns a list of all cameras'
        } */
});
export default router;
