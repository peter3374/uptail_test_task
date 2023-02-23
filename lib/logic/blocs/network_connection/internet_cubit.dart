import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task/logic/blocs/network_connection/internet_state.dart';

class InternetCubit extends Cubit<InternetCubitState> {
  final Connectivity connectivity;

  InternetCubit({required this.connectivity}) : super(InternetLoadingState()) {
    connectivity.onConnectivityChanged.listen((connectivityResult) {
    
      connectivityResult == ConnectivityResult.none
          ? emit(InternetDisconnectedState())
          : emit(InternetConnectedState());
    });
  }
}
