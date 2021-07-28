part of 'device_bloc.dart';

abstract class DeviceEvent extends Equatable {
  const DeviceEvent();

  @override
  List<Object> get props => [];
}

class GetDeviceID extends DeviceEvent {
  final BuildContext context;
  GetDeviceID({
    required this.context,
  });
  @override
  List<Object> get props => [context];
}
