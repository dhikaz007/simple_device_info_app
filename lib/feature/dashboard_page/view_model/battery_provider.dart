import 'package:battery_info/battery_info_plugin.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/battery_model.dart';

class BatteryProvider with ChangeNotifier {
  final BatteryInfoPlugin _batteryInfoPlugin = BatteryInfoPlugin();
  final List<BatteryModel> _dataList = [];

  List<BatteryModel> get dataList => _dataList;

  void addDataBattery(BatteryModel data) {
    _dataList.add(data);
    notifyListeners();
  }

  void clearData() {
    _dataList.clear();
    notifyListeners();
  }

  void startListening() async {
    _batteryInfoPlugin.androidBatteryInfoStream.listen((event) {
      final data = BatteryModel(
        health: event?.health,
        technology: event?.technology,
        batteryLevel: event?.batteryLevel,
        batteryCapacity: event?.batteryCapacity,
        currentAverage: event?.currentAverage,
        currentNow: event?.currentNow,
        remainingEnergy: event?.remainingEnergy,
        temperature: event?.temperature,
        voltage: event?.voltage,
        scale: event?.scale,
      );
      addDataBattery(data);
    });
  }

  void stopListening() {
    clearData();
  }

  static BatteryProvider of(BuildContext context, {bool listen = true}) {
    return Provider.of<BatteryProvider>(context, listen: listen);
  }
}
