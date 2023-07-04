class BatteryModel {
  int? currentNow = -1;
  int? currentAverage = -1;
  int? chargeTimeRemaining = -1;
  String? health = "unknown";
  String? pluggedStatus = "unknown";
  String? technology = "unknown";
  int? batteryLevel;
  int? batteryCapacity;
  int? remainingEnergy = -1;
  int? scale;
  int? temperature = -1;
  int? voltage = -1;
  bool? present = true;

  BatteryModel({
    this.currentNow,
    this.currentAverage,
    this.chargeTimeRemaining,
    this.health,
    this.pluggedStatus,
    this.technology,
    this.batteryLevel,
    this.batteryCapacity,
    this.remainingEnergy,
    this.scale,
    this.temperature,
    this.voltage,
    this.present,
  });
}
