// ignore_for_file: avoid_print

import 'dart:async';

abstract class SensorManager {
  SensorManager() {
    waterLevelStream.listen((event) {
      print("Water Level: $event");
    });
    flowRateStream.listen((event) {
      print("Flow Rate: $event");
    });
    humidityStream.listen((event) {
      print("Humidity: $event");
    });
    init();
  }
  void init();

  void dispose() {
    waterLevel.close();
    flowRate.close();
    humidity.close();
  }

  final StreamController<double> waterLevel =
      StreamController<double>.broadcast();
  final StreamController<double> flowRate =
      StreamController<double>.broadcast();
  final StreamController<double> humidity =
      StreamController<double>.broadcast();

  late final Stream<double> waterLevelStream = waterLevel.stream;
  late final Stream<double> flowRateStream = flowRate.stream;
  late final Stream<double> humidityStream = humidity.stream;
}
