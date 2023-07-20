
import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/SignUp.dart';
import 'package:flutter_application_1/vidu2/vidu2JSON.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_application_1/model/dulieu.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:convert';


void main() {
  runApp(Login());
}

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login',
      theme:
          ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.white)),
      home: MyLogin(),
    );
  }
}

class MyLogin extends StatefulWidget {
  const MyLogin({super.key});

  @override
  State<MyLogin> createState() => _MyLoginState();
}

List<UserNext> model(String str) =>
    List<UserNext>.from(json.decode(str).map((x) => UserNext.fromJson(x)));

class UserNext {
  int? userId;
  int? id;
  String? title;
  String? body;

  UserNext({this.userId, this.id, this.title, this.body});

  UserNext.fromJson(Map<String, dynamic> json) {
    userId = json["userId"];
    id = json["id"];
    title = json["title"];
    body = json["body"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["userId"] = userId;
    _data["id"] = id;
    _data["title"] = title;
    _data["body"] = body;
    return _data;
  }
}

class ApiNext {
  Future<List<UserNext>?> getUserNext() async {
    final url = Uri.parse("https://jsonplaceholder.typicode.com/posts");
    final response = await http.get(url);
    try {
      List<UserNext> _model = model(response.body);
      return _model;
    } catch (e) {
      Text(e.toString());
    }
  }
}

class _MyLoginState extends State<MyLogin> {
  final _formKey = GlobalKey<FormState>();
  List<UserNext> _User = [];

  void initState() {
    super.initState();
    getDt;
  }

  void getDt() async {
    _User = (await ApiNext().getUserNext())!;
    setState(() {
      _User;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _formKey,
        body: Column(
          children: <Widget>[
            AppBar(
              title: Text('Dang Nhap'),
            ),
            Text(
              'Ten tai khoan',
              style: TextStyle(
                height: 2,
              ),
            ),
            TextFormField(
              autofocus: true,
              decoration: InputDecoration(
                  labelText: 'User Name',
                  hintText: "Nhap ho va ten",
                  border: OutlineInputBorder(),
                  icon: Icon(Icons.verified_user_rounded)),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'xin hay nhap ten dang nhap';
                }
                return null;
              },
            ),
            Text('Mat Khau', style: TextStyle(height: 2)),
            TextFormField(
              autofocus: true,
              decoration: InputDecoration(
                  labelText: 'Password',
                  hintText: "Nhap mat khau",
                  border: OutlineInputBorder(),
                  icon: Icon(Icons.password)),
              obscureText: true,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Xin hãy nhập password';
                }
                return null;
              },
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MyProfile()));
                },
                child: Text('Dang Nhap')),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MySignUp()));
                },
                child: Text('Dang ki')),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MyViduData()));
                },
                child: Text('Lay du lieu')),
          ],
        ));
  }
}
