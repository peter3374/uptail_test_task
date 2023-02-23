// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:test_task/data/data_source/user_data_source.dart';
import 'package:test_task/logic/services/error_service.dart';
import 'package:test_task/logic/services/network_service.dart';

class UserDataSourceImpl implements UserDataSource {
  final _usersUrl = 'https://jsonplaceholder.typicode.com/users';
  final NetworkSource _networkSource;

  UserDataSourceImpl({
    required NetworkSource networkSource,
  }) : _networkSource = networkSource;

  @override
  Future<List<dynamic>> fetchUsers() async {
    try {
      final responce = await _networkSource.get(path: _usersUrl);
      return responce.data as List<dynamic>;
    } catch (e) {
      throw Failure('Ошибка!');
    }
  }
}
