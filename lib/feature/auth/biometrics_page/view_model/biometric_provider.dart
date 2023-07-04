import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

enum BiometricStatus {
  unknown,
  available,
  notAvailable,
  authenticated,
  error,
}

class BioMetricProvider extends ChangeNotifier {
  final LocalAuthentication localAuth;

  BioMetricProvider({required this.localAuth});

  BiometricStatus _status = BiometricStatus.unknown;

  BiometricStatus get status => _status;

  Future<void> checkBiometricAvailability() async {
    try {
      bool isAvailable = await localAuth.canCheckBiometrics;
      _status = isAvailable
          ? BiometricStatus.available
          : BiometricStatus.notAvailable;
    } on PlatformException catch (e) {
      _status = BiometricStatus.error;
      debugPrint('Biometric status: ${e.message}');
    }
    notifyListeners();
  }

  Future<void> authenticate() async {
    bool isAuthenticated = false;
    try {
      isAuthenticated = await localAuth.authenticate(
        localizedReason: 'Please authenticate to access the app',
        options: const AuthenticationOptions(
          biometricOnly: true,
          useErrorDialogs: true,
          stickyAuth: true,
        ),
      );
    } on PlatformException catch (e) {
      isAuthenticated = false;
      debugPrint('Authentication error: ${e.message}');
    }
    _status =
        isAuthenticated ? BiometricStatus.authenticated : BiometricStatus.error;
    notifyListeners();
  }
}
