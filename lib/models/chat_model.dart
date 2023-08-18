// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class ChatModel {
  final Map<String, dynamic> mapSent;
  final String message;
  final Timestamp timestamp;
  ChatModel({
    required this.mapSent,
    required this.message,
    required this.timestamp,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'mapSent': mapSent,
      'message': message,
      'timestamp': timestamp,
    };
  }

  factory ChatModel.fromMap(Map<String, dynamic> map) {
    return ChatModel(
      mapSent: Map<String, dynamic>.from(map['mapSent'] ?? {}),
      message: (map['message'] ?? '') as String,
      timestamp: (map['timestamp'] ?? Timestamp(0, 0)),
    );
  }

  String toJson() => json.encode(toMap());

  factory ChatModel.fromJson(String source) => ChatModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
