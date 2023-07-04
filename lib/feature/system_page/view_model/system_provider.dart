import 'dart:io';

import 'package:flutter/material.dart';
import 'package:device_info_plus/device_info_plus.dart';

import '../model/system_model.dart';

class SystemProvider extends ChangeNotifier {
  SystemModel? _deviceInfoModel;

  SystemModel? get deviceInfo => _deviceInfoModel;

  Future<void> fetchDeviceInfo() async {
    final deviceInfoPlugin = DeviceInfoPlugin();

    try {
      if (Platform.isAndroid) {
        final androidInfo = await deviceInfoPlugin.androidInfo;
        _deviceInfoModel = SystemModel(
          deviceName: androidInfo.device,
          deviceId: androidInfo.id,
          deviceModel: androidInfo.model,
          deviceProduct: androidInfo.product,
          deviceManufacturer: androidInfo.manufacturer,
          deviceBoard: androidInfo.board,
          deviceHardware: androidInfo.hardware,
          deviceOSVersion: androidInfo.version.release,
          deviceSDKVersion: androidInfo.version.sdkInt.toString(),
          deviceVersionCode: androidInfo.version.codename,
          deviceBuild: androidInfo.device,
          deviceFingerprint: androidInfo.fingerprint,
          deviceSecurityPatch: androidInfo.version.securityPatch.toString(),
          supported32BitAbis: androidInfo.supported32BitAbis.toString(),
          supported64BitAbis: androidInfo.supported64BitAbis.toString(),
          supportedAbis: androidInfo.supportedAbis.toString(),
        );
      } else if (Platform.isIOS) {
        final iosInfo = await deviceInfoPlugin.iosInfo;
        _deviceInfoModel = SystemModel(
          deviceName: iosInfo.name,
          deviceId: iosInfo.identifierForVendor ?? '',
          deviceModel: iosInfo.utsname.machine,
          deviceManufacturer: 'Apple',
          deviceBoard: '',
          deviceHardware: '',
          deviceProduct: '',
          deviceOSVersion: '',
          deviceSDKVersion: '',
          deviceVersionCode: '',
          deviceBuild: '',
          deviceFingerprint: '',
          deviceSecurityPatch: '',
          supported32BitAbis: '',
          supported64BitAbis: '',
          supportedAbis: '',
        );
      }
    } catch (e) {
      debugPrint('Failed to get device info: $e');
    }

    notifyListeners();
  }
}
