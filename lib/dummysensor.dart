import 'dart:math';

import 'package:senorvis/Interface.dart';

class DummySensor implements SensorManager {
  @override
  double getWaterLevel() {
    return Random().nextDouble() * 100;
    // return 1;
  }

  @override
  double getFlowRate() {
    return Random().nextDouble() * 10;
  }

  @override
  double getHumidity() {
    var source = '4';
    return double.parse(source);
  }
}
