import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';

import 'package:flutter/services.dart';

class Device {
  String deviceName;
  String deviceId;

  Device({required this.deviceName, required this.deviceId});
}

Future<Device?> deviceDetails() async {
  final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();

  late final Device device;
  try {
    if (Platform.isAndroid) {
      AndroidDeviceInfo build = await deviceInfoPlugin.androidInfo;
      // setState(() {
      //   deviceName = build.model;
      //   deviceVersion = build.version.toString();
      //   identifier = build.androidId;
      // });

      print('android${build.toString()}');

      device = Device(deviceName: build.model, deviceId: build.id);
      //UUID for Android
    } else if (Platform.isIOS) {
      IosDeviceInfo data = await deviceInfoPlugin.iosInfo;
      // setState(() {
      //   deviceName = data.name;
      //   deviceVersion = data.systemVersion;
      //   identifier = data.identifierForVendor;
      // }); //UUID for iOS

      device = Device(
          deviceName: data.name ?? '',
          deviceId: data.identifierForVendor ?? '');
    }
  } on PlatformException {
    print('Failed to get platform version');
  }
  return device;
}
