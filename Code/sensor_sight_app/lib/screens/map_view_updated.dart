import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  late GoogleMapController mapController;

  final Set<Marker> _markers = {};
  final Set<Polygon> _polygons = {};

  @override
  void initState() {
    super.initState();

    _markers.addAll(_getMarkers());
    _polygons.addAll(getPolygons());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        mapType: MapType.satellite,
        myLocationEnabled: true,
        initialCameraPosition: const CameraPosition(
          target: LatLng(51.539881330539366, -0.010170620253578566),
          zoom: 16.7,
        ),
        markers: _markers,
        polygons: _polygons,
      ),
    );
  }
}

List<Marker> _getMarkers() {
  return [
    Marker(
      markerId: MarkerId("OPS-1"),
      position: LatLng(51.5403, -0.008771),
      infoWindow: InfoWindow(
        title: "OPS-1",
        snippet: 'Details',
        onTap: () {},
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(
        BitmapDescriptor.hueOrange,
      ),
    ),
    Marker(
      markerId: MarkerId("OPS-2"),
      position: LatLng(51.539, -0.010579),
      infoWindow: InfoWindow(
        title: "OPS-2",
        snippet: 'Details',
        onTap: () {},
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(
        BitmapDescriptor.hueOrange,
      ),
    ),
    Marker(
      markerId: MarkerId("OPS-3"),
      position: LatLng(51.5391, -0.010675),
      infoWindow: InfoWindow(
        title: "OPS-3",
        snippet: 'Details',
        onTap: () {},
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(
        BitmapDescriptor.hueOrange,
      ),
    ),
    Marker(
      markerId: MarkerId("OPS-4"),
      position: LatLng(51.5395, -0.011017),
      infoWindow: InfoWindow(
        title: "OPS-4",
        snippet: 'Details',
        onTap: () {},
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(
        BitmapDescriptor.hueOrange,
      ),
    ),
    Marker(
      markerId: MarkerId("OPS-5"),
      position: LatLng(51.54, -0.011442),
      infoWindow: InfoWindow(
        title: "OPS-5",
        snippet: 'Details',
        onTap: () {},
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(
        BitmapDescriptor.hueOrange,
      ),
    ),
    Marker(
      markerId: MarkerId("OPS-6"),
      position: LatLng(51.54, -0.011442),
      infoWindow: InfoWindow(
        title: "OPS-6",
        snippet: 'Details',
        onTap: () {},
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(
        BitmapDescriptor.hueOrange,
      ),
    ),
    Marker(
      markerId: MarkerId("OPS-7"),
      position: LatLng(51.5405, -0.011923),
      infoWindow: InfoWindow(
        title: "OPS-7",
        snippet: 'Details',
        onTap: () {},
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(
        BitmapDescriptor.hueOrange,
      ),
    ),
    Marker(
      markerId: MarkerId("OPS-8"),
      position: LatLng(51.5404, -0.011605),
      infoWindow: InfoWindow(
        title: "OPS-8",
        snippet: 'Details',
        onTap: () {},
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(
        BitmapDescriptor.hueOrange,
      ),
    ),
    Marker(
      markerId: MarkerId("OPS-9"),
      position: LatLng(51.5395, -0.010677),
      infoWindow: InfoWindow(
        title: "OPS-9",
        snippet: 'Details',
        onTap: () {},
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(
        BitmapDescriptor.hueOrange,
      ),
    ),
    Marker(
      markerId: MarkerId("OPS-10"),
      position: LatLng(51.5393, -0.009992),
      infoWindow: InfoWindow(
        title: "OPS-10",
        snippet: 'Details',
        onTap: () {},
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(
        BitmapDescriptor.hueOrange,
      ),
    ),
    Marker(
      markerId: MarkerId("OPS-11"),
      position: LatLng(51.5392, -0.009596),
      infoWindow: InfoWindow(
        title: "OPS-11",
        snippet: 'Details',
        onTap: () {},
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(
        BitmapDescriptor.hueOrange,
      ),
    ),
    Marker(
      markerId: MarkerId("OPS-12"),
      position: LatLng(51.5395, -0.009176),
      infoWindow: InfoWindow(
        title: "OPS-12",
        snippet: 'Details',
        onTap: () {},
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(
        BitmapDescriptor.hueOrange,
      ),
    ),
    Marker(
      markerId: MarkerId("OPS-13"),
      position: LatLng(51.54, -0.009318),
      infoWindow: InfoWindow(
        title: "OPS-13",
        snippet: 'Details',
        onTap: () {},
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(
        BitmapDescriptor.hueOrange,
      ),
    ),
    Marker(
      markerId: MarkerId("OPS-14"),
      position: LatLng(51.5406, -0.009695),
      infoWindow: InfoWindow(
        title: "OPS-14",
        snippet: 'Details',
        onTap: () {},
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(
        BitmapDescriptor.hueOrange,
      ),
    ),
    Marker(
      markerId: MarkerId("OPS-15"),
      position: LatLng(51.5403, -0.008771),
      infoWindow: InfoWindow(
        title: "OPS-15",
        snippet: 'Details',
        onTap: () {},
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(
        BitmapDescriptor.hueOrange,
      ),
    ),
    Marker(
      markerId: MarkerId("OPS-16"),
      position: LatLng(51.5403, -0.008771),
      infoWindow: InfoWindow(
        title: "OPS-16",
        snippet: 'Details',
        onTap: () {},
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(
        BitmapDescriptor.hueOrange,
      ),
    ),
  ];
}

List<Polygon> getPolygons() {
  List<LatLng> cameraRange1 = [
    LatLng(51.5403, -0.008771),
    LatLng(51.5493, 0.008721),
    LatLng(51.5493, -0.008729),
  ];

  List<LatLng> cameraRange2 = [
    LatLng(51.5403, -0.008771),
    LatLng(51.5493, 0.008721),
    LatLng(51.5493, -0.008729),
  ];

  List<Polygon> polygons = [
    Polygon(
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
    ),
    Polygon(
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
    ),
  ];
  return polygons;
}
