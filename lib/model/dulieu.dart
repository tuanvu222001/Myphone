// import 'dart:convert';

// List<User> userModelFromJson(String str) =>
//     List<User>.from(json.decode(str).map((x) => User.fromJson(x)));

// String userModelToJson(List<User> data) =>
//     User.encode(List<dynamic>.from(data.map((x) => x.toJson())));
// class User {
//   String? username;
//   String? password;
//   String? password2;

//   User({this.username, this.password, this.password2});

//   User.fromJson(Map<String, dynamic> json) {
//     username:
//     json['username'];
//     password:
//     json['password'];
//     password2:
//     json['password2'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> _data = <String, dynamic>{};
//     _data['username'] = username;
//     _data['password'] = password;
//     _data['password2'] = password2;
//     return _data;
//   }
  
//   static encode(List list) {}
// }
