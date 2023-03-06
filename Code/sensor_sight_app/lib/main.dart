import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sensor_sight_app/geolocate_test.dart';
import 'package:ar_flutter_plugin/ar_flutter_plugin.dart';
import 'package:sensor_sight_app/widgets/ar_core_debug.dart';

import 'widgets/device_list.dart';
import 'widgets/map_view.dart';
import 'widgets/device_info.dart';

void main() => runApp(const MyApp());

//STATELESS WIDGET
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String _title = 'SensorSight App';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      debugShowCheckedModeBanner: false,
      home: MyStatefulWidget(),
    );
  }
}

//STATEFUL WIDGET
class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidget();
}

//PRIVATE STATEFUL WIDGET
class _MyStatefulWidget extends State<MyStatefulWidget> {
  int _selectedIndex = 0;

  static const TextStyle optionStyle = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
  );

  static const List<Widget> _widgetOptions = <Widget>[
    // Index 0: Home
    MapView(),
    // Index 1: Device List
    DeviceListBuilder(),
    // Index 2: Device Info
    DeviceInfo(),
    // Index 3: Geolocate Test
    GeoPage(),
    // Index 4: Live Feeds
    // Text(
    //   'Index 5: Live Feeds',
    //   style: optionStyle,
    // ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

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
                              child: const Text('Learn More'),
                            )
                          ]);
                    });
              },
            )
          ],
        ),
        body: Container(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),

        // body: GoogleMap(
        //   onMapCreated: _onMapCreated,
        //   initialCameraPosition: CameraPosition(
        //     target: _center,
        //     zoom: 11.0,
        //   ),
        //   polygons: _polygon,
        // ),

        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.blueGrey[400],
          items: const [
            BottomNavigationBarItem(
              label: 'Home',
              icon: Icon(
                Icons.house_rounded,
              ),
            ),
            BottomNavigationBarItem(
              label: 'Device List',
              icon: Icon(
                Icons.list_rounded,
              ),
            ),
            BottomNavigationBarItem(
              label: 'Device Info',
              icon: Icon(
                Icons.device_hub_rounded,
              ),
            ),
            BottomNavigationBarItem(
              label: 'AR Mode',
              icon: Icon(
                Icons.vrpano_rounded,
              ),
            ),
            // BottomNavigationBarItem(
            //   label: 'Live Feeds',
            //   icon: Icon(
            //     Icons.camera_rounded,
            //   ),
            // ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          selectedItemColor: Colors.white,
        ),
      ),
    );
  }
}
