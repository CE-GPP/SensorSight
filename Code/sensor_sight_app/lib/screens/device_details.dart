import 'package:flutter/material.dart';
import 'package:sensor_sight_app/widgets/app_info.dart';
import 'package:sensor_sight_app/widgets/camera_json.dart';
import 'package:url_launcher/url_launcher.dart';

class DeviceDetails extends StatelessWidget {
  final Camera camera;

  const DeviceDetails({Key? key, required this.camera}) : super(key: key);

  static const TextStyle optionStyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    wordSpacing: 8,
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(48, 0, 0, 0),
                child: Image.asset(
                  'assets/images/ar_icon.png',
                  height: 35,
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10.0),
                child: const Text('SensorSight',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
              )
            ],
          ),
          backgroundColor: Colors.blueGrey[400],
          actions: [
            IconButton(
              icon: const Icon(
                Icons.info_rounded,
              ),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return const AppInfo();
                    });
              },
            )
          ],
        ),
        body: ListView(
          padding: const EdgeInsets.all(8),
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 25, 0, 15),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://sensorsight-api.yaman-ka.com/images/${camera.imageLink}'),
                    radius: 80,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
              child: SizedBox(
                height: 75,
                child: Card(
                  color: Colors.blueGrey[50],
                  child: Center(
                    child: Text(
                      camera.name,
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 350,
              child: Card(
                color: Colors.blueGrey[50],
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Manufacturer: ${camera.manufacturer}',
                        style: optionStyle,
                      ),
                      Text(
                        'Series: ${camera.series}',
                        style: optionStyle,
                      ),
                      Text(
                        'Resolution: ${camera.resolution}',
                        style: optionStyle,
                      ),
                      Text(
                        'Coordinates: ${camera.lon}, ${camera.lat}',
                        style: optionStyle,
                      ),
                      ElevatedButton(
                        onPressed: () => launch(camera.feedLink),
                        child: const Padding(
                          padding: EdgeInsets.fromLTRB(8, 10, 8, 10),
                          child: Text(
                            'Feed Link',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
