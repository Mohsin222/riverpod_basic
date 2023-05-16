import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Notes {
  final String title;
  final String content;
  Notes({required this.title, required this.content});
}


class UserModel {
  final int id;
  final int userId;
  final String title;
  final String body;

  UserModel(
    this.id,
    this.userId,
    this.title,
    this.body,
  );


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'userId': userId,
      'title': title,
      'body': body,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      map['id'] as int,
      map['userId'] as int,
      map['title'] as String,
      map['body'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
