import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:test_task/presenatation/users_screen/user_screen.dart';

class QrScreen extends StatefulWidget {
  const QrScreen({super.key});

  @override
  State<QrScreen> createState() => _QrScreenState();
}

class _QrScreenState extends State<QrScreen> {
  String? _scanBarcode;

  Future<void> scanQR() async {
    String barcodeScanRes;

    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);
      _scanBarcode = barcodeScanRes;
      _isCanPush();
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }
  }

  void _isCanPush() => _scanBarcode != null && _scanBarcode!.contains('http')
      ? _pushToUsersScreen()
      : null;

  Future<void> _pushToUsersScreen() async =>
      await Future.delayed(const Duration(seconds: 1)).then(
        (_) => Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const UserScreen(),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Qr screen'),
      ),
      body: Center(
        child: OutlinedButton(
          onPressed: () async => await scanQR(),
          child: const Text('Start QR scan'),
        ),
      ),
    );
  }
}
