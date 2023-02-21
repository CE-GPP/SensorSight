import 'package:flutter/material.dart';

class DeviceInfo extends StatelessWidget {
  const DeviceInfo({super.key});

  static const TextStyle optionStyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    wordSpacing: 8,
  );

  //final ButtonStyle style =
  //    ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));

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
          //color: Colors.green[500],
          child: Card(
              color: Colors.green[500],
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
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
                        children: const [
                          ElevatedButton(
                              //style: ButtonStyle(),
                              onPressed: null,
                              child: Text('Map View')),
                          SizedBox(
                            width: 10,
                          ),
                          ElevatedButton(
                              //style: ButtonStyle(),
                              onPressed: null,
                              child: Text('Live Feeds')),
                        ],
                      ),
                    ]),
              )),
        ),
      ],
    );
  }
}
