import 'package:flutter/material.dart';

import '../view_model/gyroscopemeter_provider.dart';
import 'gyroscope_charts_page.dart';

class GyroscopemeterPage extends StatefulWidget {
  const GyroscopemeterPage({super.key});

  @override
  State<GyroscopemeterPage> createState() => _GyroscopemeterPageState();
}

class _GyroscopemeterPageState extends State<GyroscopemeterPage> {
  @override
  void initState() {
    super.initState();
    final gyroscopemeterProvider =
        GyroscopemeterProvider.of(context, listen: false);
    gyroscopemeterProvider.startListening();
  }

  @override
  void dispose() {
    final gyroscopemeterProvider =
        GyroscopemeterProvider.of(context, listen: false);
    gyroscopemeterProvider.stopListening();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const GyroscopeChartsPage();
  }
}
