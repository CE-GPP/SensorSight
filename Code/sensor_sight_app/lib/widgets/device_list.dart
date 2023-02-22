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

// class DeviceCard extends StatelessWidget {
//   const DeviceCard({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Card(
//           elevation: 5,
//           //color: Theme.of(context).colorScheme.surfaceVariant,
//           clipBehavior: Clip.hardEdge,
//           child: InkWell(
//             splashColor: Colors.blueGrey.withAlpha(30),
//             onTap: () {
//               // Navigator.push(

//               // )
//               debugPrint('Card tapped.');
//             },
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: const [
//                 ListTile(
//                   leading: CircleAvatar(
//                     backgroundColor: Colors.blueGrey,
//                   ),
//                   title: Text('Device Name'),
//                   subtitle: Text('Device Type'),
//                   trailing: Icon(Icons.circle_rounded),
//                   iconColor: Colors.green,
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

class DeviceListBuilder extends StatelessWidget {
  const DeviceListBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Device List"),
          backgroundColor: Colors.blueGrey[200]),
      body: SafeArea(
        child: ListView.builder(
            itemCount: 10,
            //separatorBuilder: (BuildContext context, int index) =>
            //const Divider(),
            clipBehavior: Clip.hardEdge,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                elevation: 2,
                child: ListTile(
                    //contentPadding: const EdgeInsets.fromLTRB(20, 4, 20, 4),
                    onTap: () {
                      //Navigator.push(

                      //);
                      debugPrint('Card $index tapped.');
                    },
                    leading: const CircleAvatar(
                      backgroundColor: Colors.blueGrey,
                    ),
                    subtitle: const Text('Camera Type'),
                    trailing: const Icon(Icons.circle_rounded),
                    iconColor: Colors
                        .green, // change color based on if device offline or online
                    title: Text("Camera $index")),
              );
            }),
      ),
    );
  }
}



  ///   Widget build(BuildContext context) {
  ///     return Scaffold(
  ///       body: SafeArea(
  ///         child: ListView.custom(
  ///           childrenDelegate: SliverChildBuilderDelegate(
  ///             (BuildContext context, int index) {
  ///               return KeepAlive(
  ///                 data: items[index],
  ///                 key: ValueKey<String>(items[index]),
  ///               );
  ///             },
  ///             childCount: items.length,
  ///             findChildIndexCallback: (Key key) {
  ///               final ValueKey<String> valueKey = key as ValueKey<String>;
  ///               final String data = valueKey.value;
  ///               return items.indexOf(data);
  ///             }
  ///           ),
  ///         ),
  ///       ),
  ///       bottomNavigationBar: BottomAppBar(
  ///         child: Row(
  ///           mainAxisAlignment: MainAxisAlignment.center,
  ///           children: <Widget>[
  ///             TextButton(
  ///               onPressed: () => _reverse(),
  ///               child: const Text('Reverse items'),
  ///             ),
  ///           ],
  ///         ),
  ///       ),
  ///     );
  ///   }
  /// }