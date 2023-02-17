import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late GoogleMapController mapController;

  int _currentIndex = 0;
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
      polygonId: PolygonId('1'),
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
      polygonId: PolygonId('2'),
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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('SensorSight'),
          backgroundColor: Colors.blueGrey[700],
        ),
        body: GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 11.0,
          ),
          polygons: _polygon,
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          backgroundColor: Colors.blueGrey[700],
          onTap: (value) {
            // Respond to item press.
            setState(() => _currentIndex = value);
          },
          items: const [
            BottomNavigationBarItem(
              label: 'Device List',
              icon: Icon(
                Icons.list_rounded,
                color: Colors.white,
                size: 35,
              ),
              activeIcon: Icon(
                Icons.list_rounded,
                color: Colors.blueAccent,
                size: 35,
              ),
            ),
            BottomNavigationBarItem(
              label: 'AR Mode',
              icon: Icon(
                Icons.vrpano_rounded,
                color: Colors.white,
                size: 35,
              ),
              activeIcon: Icon(
                Icons.vrpano_rounded,
                color: Colors.blueAccent,
                size: 35,
              ),
            ),
            BottomNavigationBarItem(
              label: 'Live Feeds',
              icon: Icon(
                Icons.movie_rounded,
                color: Colors.white,
                size: 35,
              ),
              activeIcon: Icon(
                Icons.movie_rounded,
                color: Colors.blueAccent,
                size: 35,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
