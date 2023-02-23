import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task/logic/blocs/qr/qr_bloc.dart';
import 'package:test_task/presenatation/users_screen/user_screen.dart';

class QrScreen extends StatefulWidget {
  const QrScreen({super.key});

  @override
  State<QrScreen> createState() => _QrScreenState();
}

class _QrScreenState extends State<QrScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Qr screen'),
      ),
      body: BlocListener<QrBloc, QrState>(
        listener: (context, state) async {
          if (state is QrScannedState) {
            await Future.delayed(const Duration(seconds: 1)).then(
              (_) => Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const UserScreen(),
                ),
              ),
            );
          }
        },
        child: Center(
          child: OutlinedButton(
            onPressed: () async => context.read<QrBloc>().add(QrScanEvent()),
            child: const Text('Start QR scan'),
          ),
        ),
      ),
    );
  }
}
