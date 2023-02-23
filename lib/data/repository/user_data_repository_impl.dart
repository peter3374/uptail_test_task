import 'package:test_task/data/data_source/user_data_source.dart';
import 'package:test_task/domain/entities/user_entity.dart';
import 'package:test_task/domain/repository/user_data_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserDataSource _userDataSource;

  UserRepositoryImpl({required UserDataSource userDataSource})
      : _userDataSource = userDataSource;

  @override
  Future<List<UserEntity>> fetchUsers() async {
    final rawUsers = await _userDataSource.fetchUsers();

    final entities = rawUsers.map((user) => user.toEntity()).toList();
    return entities;
  }
}
