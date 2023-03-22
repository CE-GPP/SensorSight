import 'package:flutter/material.dart';

class AppInfo extends StatelessWidget {
  const AppInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        title: const Text('About the App'), // change title
        content: const Text(
            'SensorSight is a BI visualisation tool for outdoor CCTV planning and management for parks and private property. \n\nTechnicians can easily service devices using a 2D map and geospatial AR view of the camera FOV.'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          )
        ]);
  }
}
