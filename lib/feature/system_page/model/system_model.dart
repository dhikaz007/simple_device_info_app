// ignore_for_file: public_member_api_docs, sort_constructors_first
class SystemModel {
  final String deviceName;
  final String deviceId;
  final String deviceModel;
  final String deviceProduct;
  final String deviceManufacturer;
  final String deviceBoard;
  final String deviceHardware;
  final String deviceOSVersion;
  final String deviceSDKVersion;
  final String deviceVersionCode;
  final String deviceBuild;
  final String deviceSecurityPatch;
  final String deviceFingerprint;
  final String supported32BitAbis;
  final String supported64BitAbis;
  final String supportedAbis;

  SystemModel({
    required this.deviceName,
    required this.deviceId,
    required this.deviceModel,
    required this.deviceProduct,
    required this.deviceManufacturer,
    required this.deviceBoard,
    required this.deviceHardware,
    required this.deviceOSVersion,
    required this.deviceSDKVersion,
    required this.deviceVersionCode,
    required this.deviceBuild,
    required this.deviceSecurityPatch,
    required this.deviceFingerprint,
    required this.supported32BitAbis,
    required this.supported64BitAbis,
    required this.supportedAbis,
  });
}
