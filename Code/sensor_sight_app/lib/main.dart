import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import './screens/device_list.dart';
import './screens/map_view.dart';

void main() => runApp(const MyApp());

//STATELESS WIDGET
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String _title = 'SensorSight App';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
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

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  static const List<Widget> _widgetOptions = <Widget>[
    // Index 0: Home
    MapView(),
    // Index 1: Device List
    DeviceListBuilder(),
    // Index 2: AR Mode
    Text(
      'Index 2: AR Mode',
      style: optionStyle,
    ),
    // Index 3: Live Feeds
    Text(
      'Index 3: Live Feeds',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('SensorSight'),
          backgroundColor: Colors.blueGrey[400],
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
              label: 'AR Mode',
              icon: Icon(
                Icons.vrpano_rounded,
              ),
            ),
            BottomNavigationBarItem(
              label: 'Live Feeds',
              icon: Icon(
                Icons.movie_rounded,
              ),
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          selectedItemColor: Colors.white,
        ),
      ),
    );
  }
}
