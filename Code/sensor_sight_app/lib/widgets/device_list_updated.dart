import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'device_info.dart';

class Camera {
  final int id;
  final String name;
  final String manufacturer;
  //final String imageLink;

  const Camera({
    required this.id,
    required this.name,
    required this.manufacturer,
    //required this.imageLink,
  });

  factory Camera.fromJson(Map<String, dynamic> json) {
    return Camera(
      id: json['id'],
      name: json['name'] ?? '',
      manufacturer: json['manufacturer'] ?? '',
      //imageLink: json['imageLink'] ?? '',
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
      body: ListView.builder(
        itemCount: _cameras.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 2.0,
            clipBehavior: Clip.hardEdge,
            child: InkWell(
              splashColor: Colors.blueGrey.withAlpha(30),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DeviceInfo(camera: _cameras[index]),
                  ),
                );
                debugPrint('Card $index tapped.');
              },
              child: ListTile(
                leading: const CircleAvatar(
                    backgroundImage: NetworkImage(
                  'http://via.placeholder.com/150x150',
                )),
                title: Text(_cameras[index].name),
                subtitle: Text(_cameras[index].manufacturer),
                trailing: const Icon(Icons.circle_rounded),
                iconColor: Colors
                    .green, // change color based on if device offline or online
              ),
            ),
          );
        },
      ),
    );
  }
}
