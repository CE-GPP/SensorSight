
import swaggerAutogen from "swagger-autogen";

const outputFile = './docs/swagger.json'
const endpointsFiles = ['./routers/routes.js']

const doc = {
    info: {
        "version": "1.0.0",
        "title": "SensorSight Application API",
        description: "Documentation automatically generated by the <b>swagger-autogen</b> module."
    },
    host: "localhost:4000",
    basePath: "/",
    schemes: ['http', 'https'],
    consumes: ['application/json'],
    produces: ['application/json'],// tells swagger the type of output content
    tags: [//a given goal, groups of endpoints
        {
            "name": "Cameras"
        }
    ],
    definitions: {
        Camera: {
          "360": true,
          "id": 1,
          "name": "OPS-1",
          "lon": 51.5386,
          "lat": -0.010005,
          "elevation": 5,
          "manufacturer": "Hikvision",
          "series": "iDS-2CD7A46G0-IZHS(Y)(R)",
          "resolution": "4MP",
          "feed_link": "link",
          "image_link": "link"}
    }}
            
    


swaggerAutogen(outputFile, endpointsFiles, doc);

