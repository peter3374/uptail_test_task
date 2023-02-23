import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task/logic/blocs/network_connection/internet_cubit.dart';
import 'package:test_task/logic/blocs/network_connection/internet_state.dart';
import 'package:test_task/logic/blocs/user/user_bloc.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async => context.read<UserBloc>().add(LoadUsersEvent()),
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(title: const Text('UserScreen')),
      body: BlocBuilder<InternetCubit, InternetCubitState>(
        builder: (context, connectionState) {
          if (connectionState is InternetLoadingState) {
            return const Center(child: CircularProgressIndicator.adaptive());
          }
          return connectionState is InternetDisconnectedState
              ? const Center(child: Text('No internet'))
              : BlocBuilder<UserBloc, UserState>(
                  builder: (context, userState) {
                    if (userState is UserInitialState) {
                      context.read<UserBloc>().add(LoadUsersEvent());
                      return const Center(
                        child: CircularProgressIndicator.adaptive(),
                      );
                    }
                    if (userState is UsersLoadedState) {
                      return ListView.builder(
                        itemCount: userState.users.length,
                        itemBuilder: (context, index) {
                          final users = userState.users[index];
                          return Card(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('${users.id}'),
                                Text('name :${users.name}'),
                                Text('email :${users.email}'),
                                Text('username :${users.username}')
                              ],
                            ),
                          );
                        },
                      );
                    }
                    if (userState is UsersLoadedWithErrorState) {
                      return const Center(
                        child: Text('Error'),
                      );
                    }

                    return const SizedBox();
                  },
                );
        },
      ),
    );
  }
}
