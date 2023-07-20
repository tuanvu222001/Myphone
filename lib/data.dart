// import 'dart:convert' as json;
// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// void main() {
//   runApp(Data());
// }

// class Post {
//   final int userId;
//   final int id;
//   final String title;
//   final String description;

//   Post(
//       {required this.userId,
//       required this.id,
//       required this.title,
//       required this.description});

//   factory Post.fromJson(Map<String, dynamic> json) {
//     return Post(
//         userId: json['userId'],
//         id: json['id'],
//         title: json['title'],
//         description: json[' description']);
//   }
// }

// class ApiServices {
//   Future<List<Post>> fetchPost() async {
//     final Uri url = Uri.parse("https://jsonplaceholder.typicode.com/posts");

//     final response = http.get(url);
//     return http.get(url).then((http.Response response) {
//       final String jsonBody = response.body;
//       final int statusCode = response.statusCode;
//       if (statusCode != 200 || jsonBody == null) {
//         print(response.reasonPhrase);
//         throw new Exception("Loi load api");
//       }
//       final JsonDecoder _decoder = new JsonDecoder();
//       final useListContainer = _decoder.convert(jsonBody);
//       final List userList = useListContainer['results'];
//       return userList
//           .map((contactRaw) => new Post.fromJson(contactRaw))
//           .toList();
//     });
//   }
// }

// class Data extends StatelessWidget {
//   const Data({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Data',
//       home: MyData(),
//     );
//   }
// }

// class MyData extends StatefulWidget {
//   const MyData({super.key});

//   @override
//   State<MyData> createState() => _MyDataState();
// }

// class _MyDataState extends State<MyData> {
//   late Future<Post> post;
//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('du lieu'),
//       ),
//       body: Container(
//         child: FutureBuilder<List<Post>>(
//             future: ApiServices().fetchPost(),
//             builder: (context, abc) {
//               if ((abc.hasError) || (!abc.hasData))
//                 return Container(
//                   child: Center(child: CircularProgressIndicator()),
//                 );
//               List<Post>? userList = abc.data;
//               return ListView.builder(
//                   itemBuilder: (BuildContext context, int index) {
//                 return UserItem(
//                   user: userList?[index],
//                 );
//               });
//             }),
//       ),
//     );
//   }
// }

// class UserItem extends StatelessWidget {
//   Post? user;
//   UserItem({this.user});

//   @override
//   Widget build(BuildContext context) {
//     return new Container(
//       margin: new EdgeInsets.only(top: 20.0),
//       child: new Row(
//         children: <Widget>[
//           new Container(
//             height: 80.0,
//             width: 80.0,
//             margin: new EdgeInsets.only(right: 20.0),
//             child: new CircleAvatar(
//               backgroundImage: new NetworkImage(user!.description!),
//             ),
//           ),
//           new Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: <Widget>[
//               new Text(
//                 (user!.userId + user!.id) as String,
//                 style: new TextStyle(
//                   fontSize: 20.0,
//                   color: Colors.black,
//                 ),
//               ),
//               new Container(
//                 margin: new EdgeInsets.only(top: 10.0),
//                 child: new Text(
//                   user!.title!,
//                   style: new TextStyle(
//                     fontSize: 15.0,
//                     color: Colors.grey,
//                   ),
//                 ),
//               ),
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }
