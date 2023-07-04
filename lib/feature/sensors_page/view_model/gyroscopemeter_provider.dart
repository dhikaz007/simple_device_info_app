import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sensors_plus/sensors_plus.dart';

import '../model/gyroscope_model.dart';

class GyroscopemeterProvider with ChangeNotifier {
  StreamSubscription<GyroscopeEvent>? _gyroscopemeterSubscription;
  final List<GyroscopeModel> _dataList = [];

  List<GyroscopeModel> get dataList => _dataList;

  void addDataPoint(dataPoint) {
    _dataList.add(dataPoint);
    notifyListeners();
  }

  void startListening() {
    _gyroscopemeterSubscription ??= gyroscopeEvents.listen((event) {
      final dataPoint = GyroscopeModel(
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
    _gyroscopemeterSubscription?.cancel();
    _gyroscopemeterSubscription = null;
    clearData();
  }

  static GyroscopemeterProvider of(BuildContext context, {bool listen = true}) {
    return Provider.of<GyroscopemeterProvider>(context, listen: listen);
  }
}
