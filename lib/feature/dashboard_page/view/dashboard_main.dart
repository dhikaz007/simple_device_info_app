import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view_model/battery_provider.dart';
import 'dashboard_page.dart';

class DashboardMain extends StatelessWidget {
  const DashboardMain({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => BatteryProvider()..startListening(),
      child: const DashboardPage(),
    );
  }
}
