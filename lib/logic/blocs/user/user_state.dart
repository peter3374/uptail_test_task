part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

class UserInitialState extends UserState {}

class UsersLoadState extends UserState {}

class UsersLoadedState extends UserState {
  final List<UserEntity> users;

  const UsersLoadedState({required this.users});
  @override
  List<Object> get props => [users];
}

class UsersLoadedWithErrorState extends UserState {
  final String message;

  const UsersLoadedWithErrorState({required this.message});

  @override
  List<Object> get props => [message];
}
