import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

part 'qr_event.dart';
part 'qr_state.dart';

class QrBloc extends Bloc<QrEvent, QrState> {
  String? _scanBarcode;

  QrBloc() : super(QrInitialState()) {
    on<QrEvent>((event, emit) async {
      if (event is QrScanEvent) {
        log('QrScanEvent');
        emit(QrScanningState());
        log('QrScanningState');
        final isScanned = await _scanQR();
        log('isScanned $isScanned');
        if (isScanned) {
          emit(QrScannedState());
          log('QrScannedState');
        }
      }
    });
  }

  Future<bool> _scanQR() async {
    String barcodeScanRes;

    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);
      _scanBarcode = barcodeScanRes;

      return _isScannedQr();
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }
    return false;
  }

  bool _isScannedQr() =>
      _scanBarcode != null && _scanBarcode!.contains('http') ? true : false;
}
