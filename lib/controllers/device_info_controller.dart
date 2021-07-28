import 'package:device_info/device_info.dart';
import 'package:flutter/material.dart';

class DeviceInfoController {
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  Future<String> getDeviceId(BuildContext context) async {
    // get device id when the platform is IOS
    if (Theme.of(context).platform == TargetPlatform.iOS) {
      IosDeviceInfo iosDeviceInfo = await deviceInfo.iosInfo;
      return iosDeviceInfo.identifierForVendor;
    }
    // get device id when the platform is Android
    else {
      AndroidDeviceInfo androidDeviceInfo = await deviceInfo.androidInfo;
      return androidDeviceInfo.androidId;
    }
  }
}
