import 'package:platform_device_id/platform_device_id.dart';

class PlatformDeviceController {
  Future<String> getDeviceId() async {
    String? deviceId = await PlatformDeviceId.getDeviceId;
    if (deviceId == null) {
      deviceId = "Undefined";
    }
    return deviceId;
  }
}
