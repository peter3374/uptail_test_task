import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task/data/data_source/user_data_source_impl.dart';
import 'package:test_task/data/repository/user_data_repository_impl.dart';
import 'package:test_task/logic/blocs/network_connection/internet_cubit.dart';
import 'package:test_task/logic/blocs/qr/qr_bloc.dart';
import 'package:test_task/logic/blocs/user/user_bloc.dart';
import 'package:test_task/logic/services/network_service.dart';
import 'package:test_task/presenatation/auth_screen/auth_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => UserBloc(
            UserInitialState(),
            userRepository: UserRepositoryImpl(
              userDataSource: UserDataSourceImpl(
                networkSource: NetworkSource(),
              ),
            ),
          ),
        ),
        BlocProvider(
          create: (context) => InternetCubit(
            connectivity: Connectivity(),
          ),
        ),
        BlocProvider(
          create: (context) => QrBloc(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          useMaterial3: true,
          colorSchemeSeed: Colors.green,
        ),
        home: const AuthScreen(),
      ),
    );
  }
}
