import 'package:flutter/material.dart';
//import 'package:http/http.dart' as http;

// Future<Album> fetchAlbum() async {
//   final response = await http
//       .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));

//   if (response.statusCode == 200) {
//     // If the server did return a 200 OK response,
//     // then parse the JSON.
//     return Album.fromJson(jsonDecode(response.body));
//   } else {
//     // If the server did not return a 200 OK response,
//     // then throw an exception.
//     throw Exception('Failed to load album');
//   }
// }

// class Album {
//   final int userId;
//   final int id;
//   final String title;

//   const Album({
//     required this.userId,
//     required this.id,
//     required this.title,
//   });

//   factory Album.fromJson(Map<String, dynamic> json) {
//     return Album(
//       userId: json['userId'],
//       id: json['id'],
//       title: json['title'],
//     );
//   }
// }

class DeviceListBuilder extends StatelessWidget {
  const DeviceListBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar:
      //AppBar(title: const Text("Device List"), backgroundColor: Colors.blueGrey[200]),
      body: ListView.builder(
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
                leading: const CircleAvatar(
                  backgroundColor: Colors.blueGrey,
                ),
                subtitle: const Text('Device Type'),
                trailing: const Icon(Icons.circle_rounded),
                iconColor: Colors.green,
                title: Text("Device $index"));
          }),
    );
  }
}
