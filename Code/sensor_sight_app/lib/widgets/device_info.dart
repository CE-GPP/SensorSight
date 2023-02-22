import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:sensor_sight_app/main.dart';
import 'package:sensor_sight_app/widgets/device_list.dart';

//test
class DeviceInfo extends StatelessWidget {
  const DeviceInfo({super.key});

  static const TextStyle optionStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    wordSpacing: 8,
  );

  //final ButtonStyle style =
  //    ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(8),
      children: <Widget>[
        // Container(
        //   height: 50,
        //   color: Colors.orange[600],
        //   child: const Center(child: Text('Navigation buttons')),
        //),
        Row(
          children: [
            Container(
              height: 100,
              width: 100,
              child: Card(
                color: Colors.blueGrey[100],
              ),
            ),
            Container(
              height: 100,
              width: 195,
              child: Card(
                color: Colors.blueGrey[200],
              ),
            ),
            Container(
              height: 100,
              width: 100,
              child: Card(
                color: Colors.blueGrey[300],
              ),
            ),
          ],
        ),
        Container(
          height: 75,
          child: Card(
            color: Colors.blueGrey[50],
            child: const Center(
              child: Text(
                'Device [index]',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        Container(
          height: 350,
          //color: Colors.green[500],
          child: Card(
              color: Colors.blueGrey[50],
              //elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Device: [Device]',
                        style: optionStyle,
                      ),
                      Text(
                        'Manufacturer: [Manufacturer]',
                        style: optionStyle,
                      ),
                      Text(
                        'Series: [Series]',
                        style: optionStyle,
                      ),
                      Text(
                        'Resolution: [Resolution]',
                        style: optionStyle,
                      ),
                      Text(
                        'Panoramic: [Panoramic]',
                        style: optionStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                              //style: ButtonStyle(),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const MyApp()));
                              },
                              child: const Text('Map View')),
                          const SizedBox(
                            width: 15,
                          ),
                          ElevatedButton(
                              //style: ButtonStyle(),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const DeviceListBuilder()));
                              },
                              child: Text('Live Feed')),
                        ],
                      ),
                    ]),
              )),
        ),
      ],
    );
  }
}
