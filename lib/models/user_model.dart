import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserModel {
  final String email;
  final String name;
  final String password;
  final String uid;
  final String? token;
  UserModel({
    required this.email,
    required this.name,
    required this.password,
    required this.uid,
    this.token,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'name': name,
      'password': password,
      'uid': uid,
      'token': token,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      email: (map['email'] ?? '') as String,
      name: (map['name'] ?? '') as String,
      password: (map['password'] ?? '') as String,
      uid: (map['uid'] ?? '') as String,
      token: (map['token'] ?? '') as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
