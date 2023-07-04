import 'package:flutter/material.dart';

import '../model/barcode_model.dart';

class BarcodeProvider with ChangeNotifier {
  BarcodeModel? _barcodeModel;

  BarcodeModel? get barcodeModel => _barcodeModel;

  set barcodeData(BarcodeModel data) {
    _barcodeModel = data;
    notifyListeners();
  }
}
