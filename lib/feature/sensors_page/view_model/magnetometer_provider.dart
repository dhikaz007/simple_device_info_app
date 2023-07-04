import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sensors_plus/sensors_plus.dart';

import '../model/magnetometer_model.dart';

class MagnetometerProvider with ChangeNotifier {
  StreamSubscription<MagnetometerEvent>? _magnetometerSubscription;
  final List<MagnetometerModel> _dataList = [];

  List<MagnetometerModel> get dataList => _dataList;

  void addDataPoint(dataPoint) {
    _dataList.add(dataPoint);
    notifyListeners();
  }

  void startListening() {
    _magnetometerSubscription ??= magnetometerEvents.listen((event) {
      final dataPoint = MagnetometerModel(
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
    _magnetometerSubscription?.cancel();
    _magnetometerSubscription = null;
    clearData();
  }

  static MagnetometerProvider of(BuildContext context, {bool listen = true}) {
    return Provider.of<MagnetometerProvider>(context, listen: listen);
  }
}
