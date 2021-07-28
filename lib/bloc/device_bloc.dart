import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_get_device_id/controllers/device_info_controller.dart';
import 'package:flutter_get_device_id/controllers/platfrom_device_controller.dart';

part 'device_event.dart';
part 'device_state.dart';

class DeviceBloc extends Bloc<DeviceEvent, DeviceState> {
  DeviceBloc() : super(DeviceInitial());
  DeviceInfoController deviceInfoController = DeviceInfoController();
  PlatformDeviceController platformDeviceController =
      PlatformDeviceController();

  @override
  Stream<DeviceState> mapEventToState(
    DeviceEvent event,
  ) async* {
    if (event is GetDeviceID) {
      yield DeviceLoading();
      // return id from platform package
      String platformPackage = await platformDeviceController.getDeviceId();
      // return id form device info package
      String deviceInfoPackage =
          await deviceInfoController.getDeviceId(event.context);
      // add delay for making it has an progress (debuging)
      await Future.delayed(Duration(seconds: 2));
      yield DeviceLoaded(
          platformPackage: platformPackage,
          deviceInfoPackage: deviceInfoPackage);
    }
  }
}
