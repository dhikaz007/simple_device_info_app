import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view_model/mobile_scanner_provider.dart';
import 'mobile_scanner_page.dart';

class MobileScannerMain extends StatelessWidget {
  const MobileScannerMain({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MobileScannerProvider(),
      child: const MobileScannerPage(),
    );
  }
}
