import 'package:flutter/material.dart';

class DeviceInfo extends StatelessWidget {
  const DeviceInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(8),
      children: <Widget>[
        Container(
          height: 50,
          color: Colors.orange[600],
          child: const Center(child: Text('Navigation buttons')),
        ),
        Container(
          height: 100,
          color: Colors.red[500],
          child: const Center(child: Text('CircleAvatar')),
        ),
        Container(
          height: 75,
          color: Colors.blue[500],
          child: const Center(child: Text('Device Name')),
        ),
        Container(
          height: 300,
          color: Colors.green[500],
          child: const Center(child: Text('Device Info')),
        ),
      ],
    );
  }
}
