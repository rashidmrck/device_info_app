import 'dart:io';

import 'package:device_info/device_info.dart';
import 'package:flutter/foundation.dart';

class DeviseDetails extends ChangeNotifier {
  String os;
  DeviseDetails(this.os) {
    if (os == "android") {
      androidDeviceInfo();
    } else {
      iosDeviceInfo();
    }
  }
  static final DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

  Map<String, dynamic> _deviceData;

  Map<String, dynamic> get deviceData => _deviceData;

  Future<void> androidDeviceInfo() async {
    AndroidDeviceInfo build = await deviceInfo.androidInfo;

    _deviceData = {
      'version.securityPatch': build.version.securityPatch,
      'version.sdkInt': build.version.sdkInt,
      'version.release': build.version.release,
      'version.previewSdkInt': build.version.previewSdkInt,
      'version.incremental': build.version.incremental,
      'version.codename': build.version.codename,
      'version.baseOS': build.version.baseOS,
      'board': build.board,
      'bootloader': build.bootloader,
      'brand': build.brand,
      'device': build.device,
      'display': build.display,
      'fingerprint': build.fingerprint,
      'hardware': build.hardware,
      'host': build.host,
      'id': build.id,
      'manufacturer': build.manufacturer,
      'model': build.model,
      'product': build.product,
      'supported32BitAbis': build.supported32BitAbis,
      'supported64BitAbis': build.supported64BitAbis,
      'supportedAbis': build.supportedAbis,
      'tags': build.tags,
      'type': build.type,
      'isPhysicalDevice': build.isPhysicalDevice,
      'androidId': build.androidId,
      'systemFeatures': build.systemFeatures,
    };
    notifyListeners();
  }

  Future<void> iosDeviceInfo() async {
    IosDeviceInfo data = await deviceInfo.iosInfo;

    _deviceData = {
      'name': data.name,
      'systemName': data.systemName,
      'systemVersion': data.systemVersion,
      'model': data.model,
      'localizedModel': data.localizedModel,
      'identifierForVendor': data.identifierForVendor,
      'isPhysicalDevice': data.isPhysicalDevice,
      'utsname.sysname:': data.utsname.sysname,
      'utsname.nodename:': data.utsname.nodename,
      'utsname.release:': data.utsname.release,
      'utsname.version:': data.utsname.version,
      'utsname.machine:': data.utsname.machine,
    };
    notifyListeners();
  }

//  Future<Map<String, dynamic>> methodDeviceData(os) async {
//    if (os == "android") {
//      await androidDeviceInfo();
//    } else {
//      await iosDeviceInfo();
//    }
//    return _deviceData;
//  }
}
