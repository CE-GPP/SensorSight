import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:sensor_sight_app/screens/device_details.dart';
import 'package:sensor_sight_app/widgets/camera_json.dart';

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
                        leading: CircleAvatar(
                            backgroundImage: NetworkImage(
                                'https://sensorsight-api.yaman-ka.com/images/${_cameras[index].imageLink}'),
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
