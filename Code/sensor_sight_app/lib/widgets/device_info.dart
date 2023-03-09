import 'package:flutter/material.dart';
import 'package:sensor_sight_app/widgets/device_list_updated.dart';

class DeviceInfo extends StatelessWidget {
  final Camera camera;

  const DeviceInfo({Key? key, required this.camera}) : super(key: key);

  static const TextStyle optionStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
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
                      return AlertDialog(
                          title: const Text('About the App'), // change title
                          content: const Text(
                              'This app is a demo app for SensorSight.'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text('Close'),
                            )
                          ]);
                    });
              },
            )
          ],
        ),
        body: ListView(
          padding: const EdgeInsets.all(8),
          children: <Widget>[
            Row(
              children: [
                Container(
                  height: 100,
                  width: 100,
                  child: Card(
                    color: Colors.blueGrey[100],
                  ),
                ),
                Container(
                  height: 100,
                  width: 195,
                  child: Card(
                    color: Colors.blueGrey[200],
                  ),
                ),
                Container(
                  height: 100,
                  width: 100,
                  child: Card(
                    color: Colors.blueGrey[300],
                  ),
                ),
              ],
            ),
            Container(
              height: 75,
              child: Card(
                color: Colors.blueGrey[50],
                child: const Center(
                  child: Text(
                    'Device [index]',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            Container(
                height: 350,
                //color: Colors.green[500],
                child: Card(
                  color: Colors.blueGrey[50],
                  //elevation: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Device: [Device]',
                          style: optionStyle,
                        ),
                        Text(
                          'Manufacturer: [Manufacturer]',
                          style: optionStyle,
                        ),
                        Text(
                          'Series: [Series]',
                          style: optionStyle,
                        ),
                        Text(
                          'Resolution: [Resolution]',
                          style: optionStyle,
                        ),
                        Text(
                          'Panoramic: [Panoramic]',
                          style: optionStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                        ),
                      ],
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
