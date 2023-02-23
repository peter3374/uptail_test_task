import 'package:flutter/material.dart';
import 'package:test_task/presenatation/qr_screen/qr_screen.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Auth screen'),
      ),
      body: Center(
        child: OutlinedButton(
          onPressed: () async => await Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const QrScreen(),
            ),
          ),
          child: const Text(
            'Login',
          ),
        ),
      ),
    );
  }
}
