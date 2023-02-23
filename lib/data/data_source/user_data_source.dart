import 'package:test_task/data/models/user_dto.dart';

abstract class UserDataSource {
  Future<List<UserDTO>> fetchUsers();
}
