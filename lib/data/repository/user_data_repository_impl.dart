import 'dart:developer';

import 'package:test_task/data/data_source/user_data_source.dart';
import 'package:test_task/data/models/user.dart';
import 'package:test_task/data/repository/user_data_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserDataSource _userDataSource;

  UserRepositoryImpl({
    required UserDataSource userDataSource,
  }) : _userDataSource = userDataSource;

  @override
  Future<List<User>> fetchUsers() async {
    try {
      List<User> notes = [];
      final rawUsers = await _userDataSource.fetchUsers();

      for (int i = 0; i < rawUsers.length; i++) {
        notes.add(User.fromJson(rawUsers[i]));
      }
      return notes;
    } catch (e, t) {
      log('eee $e , $t');
      throw '';
    }
  }
}
