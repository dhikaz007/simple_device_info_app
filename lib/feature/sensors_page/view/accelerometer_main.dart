import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view_model/accelerometer_provider.dart';
import 'accelerometer_page.dart';

class AccelerometerMain extends StatelessWidget {
  const AccelerometerMain({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AccelerometerProvider(),
      child: const AccelerometerPage(),
    );
  }
}
