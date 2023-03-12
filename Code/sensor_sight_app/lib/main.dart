import 'package:flutter/material.dart';
import 'package:sensor_sight_app/screens/home_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String _title = 'SensorSight App';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
