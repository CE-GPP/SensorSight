import express from "express";
import swaggerUi from "swagger-ui-express";
import cors from "cors";
import dotenv from "dotenv";
import baseRouter from "./routers/routes.js";

dotenv.config();

const app = express();
import swaggerDocument from "./docs/swagger.json" assert { type: "json" };

app.use(cors());
app.use(express.json());
app.use((req, res, next) => {
  res.setHeader("Access-Control-Allow-Methods", "POST,GET,OPTIONS");
  if (req.method === "OPTIONS") return res.sendStatus(200);
  next();
});

app.use("/api-docs", swaggerUi.serve, swaggerUi.setup(swaggerDocument));
app.use("/", baseRouter);

const port = process.env.PORT || 4000;
app.listen(port, () => console.log("Server is running on port: " + port));
