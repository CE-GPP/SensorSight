import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'device_details.dart';

class Camera {
  final int id;
  final String name;
  //final double lon;
  //final double lat;
  //final int elevation;
  final String manufacturer;
  final String series;
  final String resolution;
  //final String feed_link;
  //final String image_link;

  const Camera({
    required this.id,
    required this.name,
    //required this.lon,
    //required this.lat,
    //required this.elevation,
    required this.manufacturer,
    required this.series,
    required this.resolution,
    //required this.feed_link,
    //required this.image_link,
  });

  factory Camera.fromJson(Map<String, dynamic> json) {
    return Camera(
      id: json['id'],
      name: json['name'] ?? '',
      //lon: json['lon'] ?? '',
      //lat: json['lat'] ?? '',
      //elevation: json['elevation'] ?? '',
      manufacturer: json['manufacturer'] ?? '',
      series: json['series'] ?? '',
      resolution: json['resolution'] ?? '',
      //feed_link: json['feed_link'] ?? '',
      //image_link: json['image_link'] ?? '',
    );
  }
}

class DeviceList extends StatefulWidget {
  const DeviceList({Key? key}) : super(key: key);

  @override
  _DeviceListState createState() => _DeviceListState();
}

class _DeviceListState extends State<DeviceList> {
  List<Camera> _cameras = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchCameras();
  }

  Future<void> _fetchCameras() async {
    const url = 'https://sensorsight-api.yaman-ka.com/api/cameras';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body) as List<dynamic>;
      final cameras = jsonData.map((json) => Camera.fromJson(json)).toList();

      setState(() {
        _cameras = cameras;
        _isLoading = false;
      });
    } else {
      print('Failed to load cameras. Status code: ${response.statusCode}');
      print('Response body: ${response.body}');
      throw Exception('Failed to load cameras');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _cameras.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 2.0,
                  clipBehavior: Clip.hardEdge,
                  child: InkWell(
                    splashColor: Colors.blueGrey.withAlpha(30),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          fullscreenDialog: true,
                          builder: (context) => DeviceDetails(
                            camera: _cameras[index],
                          ),
                        ),
                      );
                      debugPrint('Card $index tapped.');
                    },
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                      child: ListTile(
                        leading: const CircleAvatar(
                            backgroundImage: NetworkImage(
                              'http://via.placeholder.com/150x150',
                            ),
                            radius: 30.0),
                        title: Text(_cameras[index].name,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18)),
                        subtitle: Text(_cameras[index].manufacturer,
                            style: const TextStyle(
                                fontStyle: FontStyle.italic, fontSize: 14)),
                        trailing: const Icon(Icons.navigate_next),
                        iconColor: Colors.grey,
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
