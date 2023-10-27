import 'dart:math';

import 'package:senorvis/Interface.dart';

class DummySensor implements SensorManager {
  @override
  double getWaterLevel() {
    // return Random().nextDouble() * 100;
    return 1;
  }

  double getFlowRate() {
    return Random().nextDouble() * 10;
  }

  double getHumidity() {
    var source = '4';
    return double.parse(source);
  }
}
