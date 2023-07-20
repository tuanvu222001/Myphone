// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:sqflite/sqflite.dart';
// import 'dart:convert';

// void main() {
//   runApp(App());
// }

// class App extends StatelessWidget {
//   const App({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Demo',
//       home: MyApp(),
//     );
//   }
// }

// class MyApp extends StatefulWidget {
//   const MyApp({super.key});

//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text('SqLite'),
//         ),
//         body: FutureBuilder<List<Client>>(
//             future: DBProvider.db.getAllClients(),
//             builder:
//                 (BuildContext context, AsyncSnapshot<List<Client>> snapshot) {
//               if (snapshot.hasData) {
//                 return ListView.builder(
//                   itemCount: snapshot.data?.length,
//                   itemBuilder: (context, index) {
//                     Client? item = snapshot.data?[index];
//                     return ListTile(
//                       title: Text(item!.lastName.toString()),
//                       leading: Text(item.id.toString()),
//                       trailing: Checkbox(
//                         onChanged: (value) {
//                           DBProvider.db.getBlockedClients(item);
//                         },
//                         value: item.blocked,
//                       ),
//                     );
//                   },
//                 );
//               } else {
//                 return Center(
//                   child: CircularProgressIndicator(),
//                 );
//               }
//             }));
//   }
// }
// List<Client> testClients = [
//     Client(firstName: "Raouf", lastName: "Rahiche", blocked: false),
//     Client(firstName: "Zaki", lastName: "oun", blocked: true),
//     Client(firstName: "oussama", lastName: "ali", blocked: false),
//   ];

// class DBProvider {
//   DBProvider._();
//   static final DBProvider db = DBProvider._();

//   static late Database _database;

//   Future<Database> get database async {
//     if (_database != null) {
//       return _database;
//     }
//     _database = await initDB();
//     return _database;
//   }

//   initDB() async {
//     Directory documentsDirectory = await getApplicationDocumentsDirectory();
//     String path = join(documentsDirectory.path, "TestDB.db");
//     return await openDatabase(
//       path,
//       version: 1,
//       onOpen: (db) {},
//       onCreate: (Database db, int version) async {
//         await db.execute("CREATE TABLE Client("
//             "id INTERGER PRIMARY KEY,"
//             "first_name TEXT,"
//             "last_name TEXT,"
//             "blocked BIT"
//             ")");
//       },
//     );
//   }

//   //khoi tao
//   newClient(Client newClient) async {
//     final db = await database;
//     var res = await db.rawInsert("INSERT Into Client (id,first_name)"
//         " VALUES (${newClient.id},${newClient.firstName})");
//     return res;
//   }

//   getAllClients() async {
//     final db = await database;
//     var res = await db.query("Client");
//     List<Client> list =
//         res.isNotEmpty ? res.map((c) => Client.fromMap(c)).toList() : [];
//     return list;
//   }

//   //nhan du lieu
//   getBlockedClients(Client item) async {
//     final db = await database;
//     var res = await db.rawQuery("SELECT * FROM Client WHERE blocked=1");
//     List<Client> list =
//         res.isNotEmpty ? res.map((c) => Client.fromMap(c)).toList() : [];
//     return list;
//   }

//   //cap nhat du lieu
//   updateClient(Client newClient) async {
//     final db = await database;
//     var res = await db.update("Client", newClient.toMap(),
//         where: "id = ?", whereArgs: [newClient.id]);
//     return res;
//   }

//   //xoa du lieu
//   deleteClient(int id) async {
//     final db = await database;
//     db.delete("Client", where: "id = ?", whereArgs: [id]);
//   }
// }

// Client clientFromJson(String str) {
//   final jsonData = json.decode(str);
//   return Client.fromMap(jsonData);
// }

// String clientToJson(Client data) {
//   final dyn = data.toMap();
//   return json.encode(dyn);
// }

// class Client {
//   int? id;
//   String? firstName;
//   String? lastName;
//   bool? blocked;

//   Client({
//     this.id,
//     this.firstName,
//     this.lastName,
//     this.blocked,
//   });

//   factory Client.fromMap(Map<String, dynamic> json) => new Client(
//         id: json["id"],
//         firstName: json["first_name"],
//         lastName: json["last_name"],
//         blocked: json["blocked"] == 1,
//       );

//   Map<String, dynamic> toMap() => {
//         "id": id,
//         "first_name": firstName,
//         "last_name": lastName,
//         "blocked": blocked,
//       };
// }
