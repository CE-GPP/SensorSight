import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  late GoogleMapController mapController;

  List<Marker> markers = [
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

  @override
  void initState() {
    super.initState();
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
        markers: Set<Marker>.from(markers),
      ),
    );
  }
}
