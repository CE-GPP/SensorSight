import 'package:flutter/material.dart';

import 'package:sensor_sight_app/geolocate_test.dart';
import 'package:sensor_sight_app/screens/device_list.dart';
//import 'package:sensor_sight_app/screens/map_view.dart';
import 'package:sensor_sight_app/widgets/app_info.dart';

import 'map_view_updated.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    // Index 0: Home
    MapPage(),
    // Index 1: Device List
    DeviceList(),
    // Index 2: AR Mode
    GeoPage(),
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
                padding: const EdgeInsetsDirectional.fromSTEB(48, 0, 0, 0),
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
        body: Container(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
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
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          selectedItemColor: Colors.white,
        ),
      ),
    );
  }
}
