import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';



class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange)),
      home: MyProfile(),
    );
  }
}

class MyProfile extends StatefulWidget {
  MyProfile({
    super.key,
  });

  @override
  State<MyProfile> createState() => _MyProfile();
}

class _MyProfile extends State<MyProfile> {
  TextEditingController ten = TextEditingController();
  TextEditingController tuoi = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Profile',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Column(
          children: [
            Text('Họ Tên'),
            TextField(
                controller: ten,
                style: TextStyle(
                  color: Colors.amber,
                ),
                decoration: InputDecoration(
                    labelText: 'User Name',
                    hintText: 'Nhap ten vao day',
                    border: UnderlineInputBorder())),
            Text('Tuoi'),
            TextFormField(
                keyboardType: TextInputType.number,
                controller: tuoi,
                textDirection: TextDirection.ltr,
                style: TextStyle(
                  color: Colors.amber,
                ),
                decoration: InputDecoration(
                  labelText: 'tuoi',
                  hintText: 'Nhap tuoi vao day',
                  border: UnderlineInputBorder(),
                )),
            
            ElevatedButton(
                onPressed: () {
                  // KeyboardKey:
                  // TextInputType.number;
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TapScreen(
                              ten.text.toString(), int.parse(tuoi.text))));
                },
                child: Text('Bam vao day')),
                
          ],
        ));
  }
}




class TapScreen extends StatefulWidget {
  TapScreen(this.ten2, this.tuoi2, {super.key});
  String ten2;
  int tuoi2;

  @override
  State<TapScreen> createState() => _TapScreenState();
}

class _TapScreenState extends State<TapScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Profile',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Column(children: [
          Text('Họ Tên: ${widget.ten2}'),
          Text('Tuoi: ${widget.tuoi2}'),
          ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Go Back'))
        ]));
  }
}
