import 'package:flutter/material.dart';

import '../view_model/magnetometer_provider.dart';
import 'magneto_charts_page.dart';

class MagnetometerPage extends StatefulWidget {
  const MagnetometerPage({super.key});

  @override
  State<MagnetometerPage> createState() => _MagnetometerPageState();
}

class _MagnetometerPageState extends State<MagnetometerPage> {
  @override
  void initState() {
    super.initState();
    final magnetometerProvider =
        MagnetometerProvider.of(context, listen: false);
    magnetometerProvider.startListening();
  }

  @override
  void dispose() {
    final magnetometerProvider =
        MagnetometerProvider.of(context, listen: false);
    magnetometerProvider.stopListening();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const MagnetoChartsPage();
  }
}
