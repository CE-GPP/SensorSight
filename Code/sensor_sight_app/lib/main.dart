import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import './screens/device_list.dart';

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
  late GoogleMapController mapController;
  final LatLng _center = const LatLng(51.509865, -0.118092);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  Set<Polygon> _polygon = HashSet<Polygon>();

  // created list of locations to display polygon
  List<LatLng> cameraRange1 = [
    LatLng(51.52303429074671, -0.15491336535643718),
    LatLng(51.53275609139346, -0.16632884692382),
    LatLng(51.535642529145015, -0.15079349230956218),
  ];

  List<LatLng> cameraRange2 = [
    LatLng(51.5526204206707, -0.14075130175780437),
    LatLng(51.553264181448384, -0.13259738635253093),
    LatLng(51.54696961131429, -0.13491481494139812),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _polygon.add(Polygon(
      // given polygonId
      polygonId: const PolygonId('1'),
      // initialize the list of points to display polygon
      points: cameraRange1,
      // given color to polygon
      fillColor: Color.fromARGB(255, 245, 192, 17).withOpacity(0.3),
      // given border color to polygon
      strokeColor: Color.fromARGB(255, 255, 251, 0),
      geodesic: true,
      // given width of border
      strokeWidth: 4,
    ));

    _polygon.add(Polygon(
      // given polygonId
      polygonId: const PolygonId('2'),
      // initialize the list of points to display polygon
      points: cameraRange2,
      // given color to polygon
      fillColor: Color.fromARGB(255, 212, 121, 17).withOpacity(0.3),
      // given border color to polygon
      strokeColor: Color.fromARGB(255, 253, 6, 6),
      geodesic: true,
      // given width of border
      strokeWidth: 4,
    ));
  }

  int _selectedIndex = 0;

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  static const List<Widget> _widgetOptions = <Widget>[
    // Index 0
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    // Index 1
    DeviceCard(),
    // Index 2
    Text(
      'Index 2: AR Mode',
      style: optionStyle,
    ),
    // Index 3
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
        body: Center(
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
