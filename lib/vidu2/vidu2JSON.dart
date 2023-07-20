import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/vidu2/detail.dart';
import 'package:http/http.dart' as http;

class User {
  int? postId;
  int? id;
  String? name;
  String? email;
  String? body;

  User({this.postId, this.id, this.name, this.email, this.body});

  User.fromJson(Map<String, dynamic> json) {
    postId = json["postId"];
    id = json["id"];
    name = json["name"];
    email = json["email"];
    body = json["body"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["postId"] = postId;
    _data["id"] = id;
    _data["name"] = name;
    _data["email"] = email;
    _data["body"] = body;
    return _data;
  }
}

List<User> userModel(String str) =>
    List<User>.from(json.decode(str).map((x) => User.fromJson(x)));

class Api {
  Future<List<User>?> getUser() async {
    final url = Uri.parse("https://jsonplaceholder.typicode.com/posts");
    final response = await http.get(url);
    try {
      if (response.statusCode == 200) {
        List<User> _model = userModel(response.body);
        return _model;
      }
    } catch (e) {
      Text(e.toString());
    }
  }
}

class ViduData extends StatelessWidget {
  const ViduData({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo du lieu',
      home: MyViduData(),
    );
  }
}

class MyViduData extends StatefulWidget {
  const MyViduData({super.key});

  @override
  State<MyViduData> createState() => _MyViduDataState();
}

class _MyViduDataState extends State<MyViduData> {
  List<User> _user = [];
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    _user = (await Api().getUser())!;
    setState(() {
      _user;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            actions: [Title(color: Colors.pink, child: Text('Du lieu o day'))]),
        body: ((_user == null) || (_user.isEmpty))
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: _user.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                      child: Container(
                    padding: EdgeInsets.all(10.0),
                    color: Colors.amber,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(_user[index].id.toString()),
                        Text(_user[index].body.toString()),
                      ],
                    ),
                  ),
                  onTap: (){
                    int select = int.parse(_user[index].id as String);
                    Navigator.push(context, MaterialPageRoute(builder: (context) => DetailTastSceen(id:  )));
                  },
                  )
                  ;
                })
                
                );
  }
}
