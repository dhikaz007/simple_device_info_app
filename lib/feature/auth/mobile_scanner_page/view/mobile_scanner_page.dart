import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view_model/mobile_scanner_provider.dart';
import 'widget/mobile_scanner_widget.dart';

class MobileScannerPage extends StatelessWidget {
  const MobileScannerPage({super.key});

  @override
  Widget build(BuildContext context) {
    final scanWindow = Rect.fromCenter(
      center: MediaQuery.sizeOf(context).center(Offset.zero),
      width: 200,
      height: 200,
    );

    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(),
      body: SafeArea(
        child: Consumer<MobileScannerProvider>(
          builder: (context, value, _) => MobileScannerWidget(
            scanWindow: scanWindow,
            value: value,
          ),
        ),
      ),
    );
  }
}
