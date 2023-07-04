import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view_model/barcode_provider.dart';
import 'barcode_page.dart';

class BarcodeMain extends StatelessWidget {
  const BarcodeMain({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => BarcodeProvider(),
      child: const BarcodePage(),
    );
  }
}
