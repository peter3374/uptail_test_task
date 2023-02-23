// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:test_task/data/scheme/user_scheme.dart';

class User {
  final int id;
  final String name;
  final String username;
  final String email;

  User({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
  });

  User copyWith({
    int? id,
    String? name,
    String? username,
    String? email,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      username: username ?? this.username,
      email: email ?? this.email,
    );
  }

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json[UserScheme.id],
        name: json[UserScheme.name],
        username: json[UserScheme.username],
        email: json[UserScheme.email],
      );
}
