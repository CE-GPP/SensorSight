import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:sensor_sight_app/screens/device_details.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  late GoogleMapController mapController;

  List<Marker> markers = [
    Marker(
      markerId: MarkerId('OPS-1'),
      position: LatLng(51.5403, -0.008771),
      infoWindow: InfoWindow(
        title: 'OPS-1',
        snippet: 'details >',
        onTap: () {},
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(
        BitmapDescriptor.hueOrange,
      ),
    ),
    Marker(
      markerId: MarkerId('OPS-2'),
      position: LatLng(51.539, -0.010579),
      infoWindow: InfoWindow(
        title: 'OPS-2',
        snippet: 'details >',
        onTap: () {},
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(
        BitmapDescriptor.hueOrange,
      ),
    ),
    Marker(
      markerId: MarkerId('OPS-3'),
      position: LatLng(51.5391, -0.010675),
      infoWindow: InfoWindow(
        title: 'OPS-3',
        snippet: 'details >',
        onTap: () {},
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(
        BitmapDescriptor.hueOrange,
      ),
    ),
    Marker(
      markerId: MarkerId('OPS-4'),
      position: LatLng(51.5395, -0.011017),
      infoWindow: InfoWindow(
        title: 'OPS-4',
        snippet: 'details >',
        onTap: () {},
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(
        BitmapDescriptor.hueOrange,
      ),
    ),
    Marker(
      markerId: MarkerId('OPS-5'),
      position: LatLng(51.54, -0.011442),
      infoWindow: InfoWindow(
        title: 'OPS-5',
        snippet: 'details >',
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
          zoom: 16.5,
        ),
        markers: Set<Marker>.from(markers),
      ),
    );
  }
}
