import 'package:flutter/material.dart';

void main() {
  runApp(SignUp());
}

class SignUp extends StatelessWidget {
  SignUp({super.key, this.TenDangNhap, this.MatKhau, this.NhapLaiMatKhau});
  final TenDangNhap;
  final MatKhau;
  final NhapLaiMatKhau;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SignUp',
      theme:
          ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.red)),
      home: MySignUp(),
    );
  }
}

class MySignUp extends StatelessWidget {
  const MySignUp({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
        key: _formKey,
        body: Column(
          children: <Widget>[
            AppBar(
              title: Text('Dang ki'),
            ),
            Text(
              'Ten tai khoan',
              style: TextStyle(
                height: 4,
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
                if (value == null || value.isEmpty) {
                  return 'xin hay nhap ten dang nhap';
                }
                return null;
              },
            ),
            Text('Mat Khau', style: TextStyle(height: 4)),
            TextFormField(
              autofocus: true,
              decoration: InputDecoration(
                  labelText: 'Password',
                  hintText: "Nhap mat khau",
                  border: OutlineInputBorder(),
                  icon: Icon(Icons.password)),
              obscureText: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Xin hãy nhập password';
                }
                return null;
              },
            ),
            Text(
              'Nhap lai mat khau',
              style: TextStyle(
                height: 4,
              ),
            ),
            TextFormField(
              autofocus: true,
              decoration: InputDecoration(
                  labelText: 'Password',
                  hintText: "Nhap lai mat khau",
                  border: OutlineInputBorder(),
                  icon: Icon(Icons.verified_user_rounded)),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'xin hay nhap lai password';
                }
                return null;
              },
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Dang ki'))
          ],
        ));
  }
}
