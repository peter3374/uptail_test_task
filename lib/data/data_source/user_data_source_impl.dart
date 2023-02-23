import 'package:test_task/data/data_source/user_data_source.dart';
import 'package:test_task/data/models/user_dto.dart';
import 'package:test_task/logic/services/error_service.dart';
import 'package:test_task/logic/services/network_service.dart';

class UserDataSourceImpl implements UserDataSource {
  final _usersUrl = 'https://jsonplaceholder.typicode.com/users';
  final NetworkSource _networkSource;

  UserDataSourceImpl({
    required NetworkSource networkSource,
  }) : _networkSource = networkSource;

  @override
  Future<List<UserDTO>> fetchUsers() async {
    List<UserDTO> users = [];
    try {
      final responce = await _networkSource.get(path: _usersUrl);
      final rawUsers = responce.data as List<dynamic>;

      for (int i = 0; i < rawUsers.length; i++) {
        users.add(UserDTO.fromJson(rawUsers[i]));
      }
    } catch (e) {
      throw Failure('Ошибка!');
    }
    return [];
  }
}
