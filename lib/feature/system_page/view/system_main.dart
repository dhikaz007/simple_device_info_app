import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view_model/system_provider.dart';
import 'system_page.dart';

class SystemMain extends StatelessWidget {
  const SystemMain({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SystemProvider()..fetchDeviceInfo(),
      child: const SystemPage(),
    );
  }
}
