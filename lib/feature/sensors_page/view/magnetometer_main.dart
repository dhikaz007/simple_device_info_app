import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view_model/magnetometer_provider.dart';
import 'magnetometer_page.dart';

class MagnetometerMain extends StatelessWidget {
  const MagnetometerMain({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MagnetometerProvider(),
      child: const MagnetometerPage(),
    );
  }
}
