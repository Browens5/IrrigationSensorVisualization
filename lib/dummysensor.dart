import 'dart:math';

import 'package:senorvis/Interface.dart';

class DummySensor implements SensorManager {
  @override
  double getWaterLevel() {
    return Random().nextDouble()*1000;
  }
}
