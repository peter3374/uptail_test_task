part of 'qr_bloc.dart';

abstract class QrState extends Equatable {
  const QrState();

  @override
  List<Object> get props => [];
}

class QrInitialState extends QrState {}

class QrScanningState extends QrState {}

class QrScannedState extends QrState {}
