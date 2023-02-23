import 'package:test_task/data/models/user.dart';

abstract class UserRepository {
  Future<List<User>> fetchUsers();
}
