import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class MobileScannerProvider extends ChangeNotifier {
  bool _isScan = false;
  Barcode? _initialBarcode;
  BarcodeCapture? _initialCapture;
  MobileScannerArguments? _arguments;

  Barcode? get barcode => _initialBarcode;
  BarcodeCapture? get initialCapture => _initialCapture;
  MobileScannerArguments? get arguments => _arguments;
  bool get isScan => _isScan;

  Future<bool> onDetect(BarcodeCapture capture) async {
    _isScan = true;
    try {
      _initialCapture = capture;
      _initialBarcode = capture.barcodes.first;
      notifyListeners();
    } on PlatformException catch (e) {
      debugPrint('ERROR : ${e.toString()}');
    } finally {
      _isScan = false;
      notifyListeners();
    }
    return _isScan;
  }
}
