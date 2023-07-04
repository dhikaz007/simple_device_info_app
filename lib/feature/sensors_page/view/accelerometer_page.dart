import 'package:flutter/material.dart';

import '../view_model/accelerometer_provider.dart';
import 'accelero_charts_page.dart';

class AccelerometerPage extends StatefulWidget {
  const AccelerometerPage({super.key});

  @override
  State<AccelerometerPage> createState() => _AccelerometerPageState();
}

class _AccelerometerPageState extends State<AccelerometerPage> {
  @override
  void initState() {
    super.initState();
    final accelerometerProvider =
        AccelerometerProvider.of(context, listen: false);
    accelerometerProvider.startListening();
  }

  @override
  void dispose() {
    final accelerometerProvider =
        AccelerometerProvider.of(context, listen: false);
    accelerometerProvider.stopListening();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const AcceleroChartsPage();
  }
}
