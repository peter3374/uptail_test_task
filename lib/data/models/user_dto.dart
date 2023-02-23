import 'package:test_task/data/scheme/user_scheme.dart';
import 'package:test_task/domain/entities/user_entity.dart';

class UserDTO {
  final int id;
  final String name;
  final String username;
  final String email;

  UserDTO({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
  });

  factory UserDTO.fromJson(Map<String, dynamic> json) => UserDTO(
        id: json[UserScheme.id],
        name: json[UserScheme.name],
        username: json[UserScheme.username],
        email: json[UserScheme.email],
      );

  UserEntity toEntity() => UserEntity(
        id: id,
        name: name,
        username: username,
        email: email,
      );
}
