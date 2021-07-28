part of 'device_bloc.dart';

abstract class DeviceState extends Equatable {
  const DeviceState();

  @override
  List<Object> get props => [];
}

class DeviceInitial extends DeviceState {}

class DeviceLoading extends DeviceState {}

class DeviceLoaded extends DeviceState {
  // return id from platform package
  final String platformPackage;
  // return id form device info package
  final String deviceInfoPackage;
  DeviceLoaded({
    required this.platformPackage,
    required this.deviceInfoPackage,
  });
  @override
  List<Object> get props => [platformPackage, deviceInfoPackage];
}
