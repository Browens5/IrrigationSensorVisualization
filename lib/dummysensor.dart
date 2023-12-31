import 'dart:math';

import 'package:sensorvis/Interface.dart';

class DummySensor extends SensorManager {
  @override
  void init() {
    Stream.periodic(const Duration(milliseconds: 10), (_) {
      final kind = Random().nextInt(3);
      if (kind == 0) {
        waterLevel.add(Random().nextDouble() * 100);
      } else if (kind == 1) {
        humidity.add(Random().nextDouble() * 100);
      } else {
        flowRate.add(Random().nextDouble() * 100);
      }
    }).last;
  }
}
