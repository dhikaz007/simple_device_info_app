import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:provider/provider.dart';

import '../view_model/biometric_provider.dart';
import 'biometric_page.dart';

class BiometricMain extends StatelessWidget {
  const BiometricMain({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => BioMetricProvider(
        localAuth: LocalAuthentication(),
      ),
      child: const BiometricPage(),
    );
  }
}
