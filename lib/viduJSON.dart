import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';



List<Post> userModelFromJson(String str) =>
    List<Post>.from(json.decode(str).map((x) => Post.fromJson(x)));

String userModelToJson(List<Post> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Post {
  int? userId;
  int? id;
  String? title;
  String? body;

  Post({this.userId, this.id, this.title, this.body});

  Post.fromJson(Map<String, dynamic> json) {
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

class ApiServices {
  Future<List<Post>?> getPost() async {
    try {
      var url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<Post> _model = userModelFromJson(response.body);
        return _model;
      }
    } catch (e) {
      Text(e.toString());
    }
    return null;
  }
}

class Data extends StatelessWidget {
  const Data({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Data',
      home: MyData(),
    );
  }
}

class MyData extends StatefulWidget {
  const MyData({super.key});
  @override
  State<MyData> createState() => _MyDataState();
}

class _MyDataState extends State<MyData> {
  late List<Post>? _post = [];

  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    var data = (await ApiServices().getPost());
    print(_post);
    setState(() {
      _post = data;
      print(_post);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('du lieu'),
        ),
        body: ((_post == null) || (_post!.isEmpty))
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: _post!.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(_post![index].id.toString()),
                            Text(_post![index].userId.toString()),
                          ],
                        )
                      ],
                    ),
                  );
                }));
  }
}