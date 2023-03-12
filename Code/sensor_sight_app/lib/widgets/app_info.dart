import 'package:flutter/material.dart';

class AppInfo extends StatelessWidget {
  const AppInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        title: const Text('About the App'), // change title
        content: const Text('This app is a demo app for SensorSight.'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          )
        ]);
  }
}
