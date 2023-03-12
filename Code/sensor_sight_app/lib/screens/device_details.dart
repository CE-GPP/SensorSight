import 'package:flutter/material.dart';
import 'package:sensor_sight_app/screens/device_list.dart';
import 'package:sensor_sight_app/widgets/app_info.dart';

class DeviceDetails extends StatelessWidget {
  final Camera camera;

  const DeviceDetails({Key? key, required this.camera}) : super(key: key);

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
                  padding: const EdgeInsets.all(15),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png'),
                    radius: 65,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 75,
              child: Card(
                color: Colors.blueGrey[50],
                child: Center(
                  child: Text(
                    camera.name,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            Container(
                height: 350,
                child: Card(
                  color: Colors.blueGrey[50],
                  child: Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Device: ${camera.name}',
                            style: optionStyle,
                          ),
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
                        ]),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
