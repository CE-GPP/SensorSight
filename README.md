# SensorSight

![Title Image](/Docs/SensorSight_TitleImage.png)

## Abstract 
This project focused on designing and implementing a mobile application that helps Local Boroughs/Local Planning Authorities and private land-owners in London to visualise CCTV camera coverages in a specific area. Coverage visulisation helps in determining security risks and blind spots using Augmented Reality technology.
The application was mainly built using Flutter and Kotlin with AR functionality, and NodeJS was selected to for the API with MySQL database as the storage. 
The application has been tested in the Olympic Park throughout several experiments and returned with preliminary results and valued lessons learnt.

## Application 

### Overview 
The application is mainly composed of 2 applications and an API (Figure 1). The API is responsible for storing camera coordinates and information, then to send them over HTTP to the Flutter app. Flutter application visualises camera data and vision field on a 2D map, in addition giving the possibility to the user to browse the full list of cameras available. Flutter app sends the selected camera’s spatial coordinates to Kotlin app to be visualised via Augmented Reality. Both applications use GPS to determine user’s location, but the Kotlin application is capable of incorporating it with live camera feed in ARCore to visualise camera fields in 3D space.

![Title Image](/Docs/overview-diagram.jpg)

### System Architecture

Figure 2 shows a more detailed version of application components. The API is mainly composed of two parts; an Express.Js (Express.Js, 2023) application and an MySQL database instance (Mysql, 2023). Those two parts connect to each other to form the API.
The API, in turn, responds to user requests via HTTP RESTful connection. The Flutter app is able to parse the incoming JSON data and display it to the user accordingly. 

![Title Image](/Docs/Application-infrastructure-1.jpg)

The entire API is hosted on a private server and served using Docker containerisation. Figure 3 shows the designed server infrastructure. Docker Compose (Docker Compose, 2023) was used to combine MySQL and Node.Js instances into one container. Then, a Reverse Proxy (Nginx, 2023) is used to tunnel the requests in and out the server. Lastly, Cloudflare (Cloudlfare, 2023) was used to add a second layer of protection and performance adjustment.

### ![Title Image](/Docs/Application-infrastructure-2.jpg)Backend API 

Figure 4 zooms in to uncover the inner components of the Express.Js application. Cameras Controller is responsible for communicating with MySQL database and query the data according to user’s needs. The Router organises the communication in separate endpoints applying the RESTful JSON API principles (JSON:API, 2023). Swagger library (Swagger, 2023) is used to document the API which helps developers during the development phase. 

![Title Image](/Docs/Application-infrastructure-3.jpg)



MySQL database is designed to include only one table with 15 columns describing cameras' details. Because the visualisation is made in 3D space, coordinates had to be defined using a tuple of longitude, latitude, and altitude. As figure 5 exhibits, camera_coordinates and column_base_coordinates define camera coordinates and its column. vision_field_1,vision_field_2, vision_field_3, and vision_field_4 define the vision field for each camera. 

JSON was used to store the previous tuples in MySQL database as shown in figure 7.

![Title Image](/Docs/Camera-spatial-field.png)

![Title Image](/Docs/mysqlDB.png)

### Flutter app 

The base mobile application was designed in Flutter to allow maximum flexibility with future deployment to other platforms. In Figma, wireframes were laid out to explore what screens and functionalities were imperative for a viable minimum product (Figure 8). This solution was intended to be used in a B2B context, with target end users being technicians, surveyors, and private property owners, so attention was placed on function over form.

Figure 8.

The app's primary screen displays a 2D satellite view of the user’s location and surrounding area, with dynamically loading coordinate markers pinpointing camera/CCTV locations (Figure 9). Additional information about the camera is available when the marker is tapped, including the device name and ID. A toggle displaying the camera’s field of view (FOV) was built using JSON data from vision_field_1 and vision_field_2. However, additional work was needed in visualising the correct falloff distance, so it was removed from the app's final version. 

An information icon was also made available on the home screen (Figure 10) to provide a brief product description with core app functionalities to assist with the onboarding of technicians or other end users. This screen could be utilised in the future to provide additional help or troubleshooting features and include a user profile that is linked to the company’s authorization credentials.

Figure 9.              				Figure 10.

The next tab provided from the home screen displayed a dynamically generated list of devices generated from JSON data in the MySQL database (Figure 11).  An avatar photo was included to allow for easier identification if there were multiple devices existing at the same coordinates. 

When a camera card is tapped, it generates a profile page listing important information such as manufacturer, series number, and resolution (Figure 12). A feed link is provided to view current conditions coming from that device, but for the sake of the MVP, placeholder TFL feeds were substituted (Figure 13). 


Figure 11.			Figure 12.			Figure 13.

### Kotlin app 

Google has recently introduced the Geo Spatial API, a new feature inside ARCore library. It was possible to run ARCore on Flutter even though it was not officially supported, but since the GeoSpatial API is quite new, all the existing ports published by community enthusiasts did not support it. As a result, the team had to use Kotlin to design an auxiliary application to visualise cameras’ vision fields. Due to the short time, the team used Google’s example (google-ar/codelab-geospatial, 2023) as a starting point to design the intended application. Figure 14 shows the application being tested in the QEOP.

Figure 14.

The architecture of the application can be seen in Figure 15. The main work is being done in two main Kotlin files; HelloGeoView.kt which calculates GPS accuracy and displays it on screen, HelloGeoRenderer.kt which is responsible for frame-by-frame rendering of the AR scene, and lastly MapView.kt which shows the 2D map component to the user and handles map click events. 
HelloGeoActivity.kt is the entry-point file for the whole application, which manages the lifecycle of used components, in addition to permission handling.

Figure 15.

The other package shown on Figure 16 is mainly composed of lower-end helper files written in Java to render the AR functionality.

Figure 16.

In those files, one important highlight is Texture.java which was modified to show the transparent camera vision field in the AR scene (Figure 17)

Figure 17.

Figure 18 contains the main code of loading the 3D object representing the vision field to be rendered in live AR scene.

Figure 18.

The Kotlin app has another functionality developed by the team to get camera measurement using live interactions in AR mode. This means the user is able to move the anchor on X,Y,Z axis to correctly position it on a desired camera, then the user can get longitude, latitude, altitude for that camera to be inserted into the database. Figure 19 shows the developed functionality; top-left buttons to move on Z axis, and the red circle on the map to move on X,Y axis. 
GPS accuracy is always displayed at the end of the screen, this is important because users should be aware when the GPS accuracy is low which may cause some drifts in the AR anchor.

Figure 19.

The layout of the Kotlin application was designed using XML language, using nested components as seen in Figure 20. 

Figure 20.

