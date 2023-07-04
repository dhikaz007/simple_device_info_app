import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sensors_plus/sensors_plus.dart';

import '../model/accelerometer_model.dart';

class AccelerometerProvider with ChangeNotifier {
  StreamSubscription<AccelerometerEvent>? _accelerometerSubscription;
  final List<AccelerometerModel> _dataList = [];

  List<AccelerometerModel> get dataList => _dataList;

  void addDataPoint(dataPoint) {
    _dataList.add(dataPoint);
    notifyListeners();
  }

  void startListening() {
    _accelerometerSubscription ??= accelerometerEvents.listen((event) {
      final dataPoint = AccelerometerModel(
        x: event.x,
        y: event.y,
        z: event.z,
      );
      addDataPoint(dataPoint);
    });
  }

  void clearData() {
    _dataList.clear();
    notifyListeners();
  }

  void stopListening() {
    _accelerometerSubscription?.cancel();
    _accelerometerSubscription = null;
    clearData();
  }

  static AccelerometerProvider of(BuildContext context, {bool listen = true}) {
    return Provider.of<AccelerometerProvider>(context, listen: listen);
  }
}
