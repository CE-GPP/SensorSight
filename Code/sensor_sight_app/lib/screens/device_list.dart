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

class DeviceCard extends StatelessWidget {
  const DeviceCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          elevation: 5,
          //color: Theme.of(context).colorScheme.surfaceVariant,
          clipBehavior: Clip.hardEdge,
          child: InkWell(
            splashColor: Colors.blueGrey.withAlpha(30),
            onTap: () {
              // Navigator.push(

              // )
              debugPrint('Card tapped.');
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.blueGrey,
                  ),
                  title: Text('Device Name'),
                  subtitle: Text('Device Type'),
                  trailing: Icon(Icons.circle_rounded),
                  iconColor: Colors.green,
                ),
              ],
            ),
          ),
        ),
        Card(
          elevation: 5,
          //color: Theme.of(context).colorScheme.surfaceVariant,
          clipBehavior: Clip.hardEdge,
          child: InkWell(
            splashColor: Colors.blueGrey.withAlpha(30),
            onTap: () {
              // Navigator.push(

              // )
              debugPrint('Card tapped.');
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.blueGrey,
                  ),
                  title: Text('Device Name'),
                  subtitle: Text('Device Type'),
                  trailing: Icon(Icons.circle_rounded),
                  iconColor: Colors.green,
                ),
              ],
            ),
          ),
        ),
        Card(
          elevation: 5,
          //color: Theme.of(context).colorScheme.surfaceVariant,
          clipBehavior: Clip.hardEdge,
          child: InkWell(
            splashColor: Colors.blueGrey.withAlpha(30),
            onTap: () {
              // Navigator.push(

              // )
              debugPrint('Card tapped.');
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.blueGrey,
                  ),
                  title: Text('Device Name'),
                  subtitle: Text('Device Type'),
                  trailing: Icon(Icons.circle_rounded),
                  iconColor: Colors.green,
                ),
              ],
            ),
          ),
        ),
        Card(
          elevation: 5,
          //color: Theme.of(context).colorScheme.surfaceVariant,
          clipBehavior: Clip.hardEdge,
          child: InkWell(
            splashColor: Colors.blueGrey.withAlpha(30),
            onTap: () {
              // Navigator.push(

              // )
              debugPrint('Card tapped.');
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.blueGrey,
                  ),
                  title: Text('Device Name'),
                  subtitle: Text('Device Type'),
                  trailing: Icon(Icons.circle_rounded),
                  iconColor: Colors.green,
                ),
              ],
            ),
          ),
        ),
        Card(
          elevation: 5,
          //color: Theme.of(context).colorScheme.surfaceVariant,
          clipBehavior: Clip.hardEdge,
          child: InkWell(
            splashColor: Colors.blueGrey.withAlpha(30),
            onTap: () {
              // Navigator.push(

              // )
              debugPrint('Card tapped.');
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.blueGrey,
                  ),
                  title: Text('Device Name'),
                  subtitle: Text('Device Type'),
                  trailing: Icon(Icons.circle_rounded),
                  iconColor: Colors.green,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

// class DeviceCard extends StatelessWidget {
//   const DeviceCard({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Device List'),
//         backgroundColor: Colors.blueGrey[700],
//       ),
//       body: ListView.builder(
//           itemCount: 5, //devices.length,
//           itemBuilder: (BuildContext context, int index) {
//             return const ListTile(
//               leading: CircleAvatar(
//                 backgroundImage: NetworkImage('https://picsum.photos/123/350'),
//               ),
//               trailing: Icon(Icons.circle_notifications_rounded),
//               title: Text('Device #'), //$index
//             );
//           }),
//     );
//   }
// }