// ignore_for_file: use_build_context_synchronously

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test_task/data/models/user.dart';
import 'package:test_task/data/repository/user_data_repository.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState>   {
  final UserRepository _userRepository;

  UserBloc(
    super.initialState, {
    required UserRepository userRepository,
  }) : _userRepository = userRepository {
    on<UserEvent>((event, emit) async {
      if (event is LoadUsersEvent) {
        emit(UsersLoadState());
        try {
          final users = await _fetchUsers();
          emit(UsersLoadedState(users: users));
        } catch (e) {
          emit(UsersLoadedWithErrorState(message: e.toString()));
        }
      }
    });
  }

  Future<List<User>> _fetchUsers() async => await _userRepository.fetchUsers();
}
