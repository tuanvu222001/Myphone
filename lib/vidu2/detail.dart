import 'package:flutter/material.dart';

import 'vidu2JSON.dart';



class DetailTastSceen extends StatefulWidget {
  const DetailTastSceen({super.key, required this.id});
  final int id;

  @override
  State<DetailTastSceen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<DetailTastSceen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Tast'),
      ),
      body: ,
    );
  }
}