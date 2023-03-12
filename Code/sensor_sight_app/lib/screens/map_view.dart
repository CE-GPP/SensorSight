import 'dart:collection';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapView extends StatefulWidget {
  const MapView({super.key});

  @override
  State<MapView> createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  late GoogleMapController _mapController;
  Set<Marker> _markers = Set();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GoogleMap(
          mapType: MapType.satellite,
          myLocationEnabled: true,
          //onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: LatLng(0, 0), // Use user's current location here
            zoom: 15,
          ),
          onCameraMove: (position) {
            _updateMarkers();
          },
          markers: _markers, // Create a method to get the list of markers
        ),

        //polygons: _polygon,
      ),
    );
  }

  @override
  void dispose() {
    _mapController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _updateMarkers();
  }

  Future<Set<Marker>> _getMarkers() async {
    // Get user's current location
    Position position = await Geolocator.getCurrentPosition();
    LatLng center = LatLng(position.latitude, position.longitude);

    // Fetch the list of markers from the API
    List<MarkerData> markerDataList = await _fetchMarkersFromApi();

    // Create a list of markers that are within the 2km radius from the map center
    List<Marker> markers = [];
    for (MarkerData markerData in markerDataList) {
      LatLng markerPosition = LatLng(markerData.latitude, markerData.longitude);
      double distance = Geolocator.distanceBetween(center.latitude,
          center.longitude, markerPosition.latitude, markerPosition.longitude);
      if (distance <= 2000) {
        markers.add(Marker(
          markerId: MarkerId(markerData.id),
          position: markerPosition,
          // Add other marker properties here
        ));
      }
    }

    return Set.from(markers);
  }

  Future<List<MarkerData>> _fetchMarkersFromApi() async {
    // Fetch the list of markers from the API using a package like http or dio
    // Convert the response to a list of MarkerData objects and return it
    // For this example, we'll return a hardcoded list of markers
    return [
      MarkerData(id: '1', latitude: 37.4219999, longitude: -122.0840575),
      MarkerData(id: '2', latitude: 37.421997, longitude: -122.084049),
      MarkerData(id: '3', latitude: 37.421996, longitude: -122.084031),
      MarkerData(id: '4', latitude: 37.421995, longitude: -122.084013),
    ];
  }
}

class MarkerData {
  final String name;
  final double latitude;
  final double longitude;

  MarkerData(
      {required this.name, required this.latitude, required this.longitude});
}
