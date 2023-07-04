import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view_model/gyroscopemeter_provider.dart';
import 'gyroscopemater_page.dart';

class GyroscopemeterMain extends StatelessWidget {
  const GyroscopemeterMain({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GyroscopemeterProvider(),
      child: const GyroscopemeterPage(),
    );
  }
}
