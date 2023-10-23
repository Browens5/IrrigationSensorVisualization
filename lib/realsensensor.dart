import 'dart:math';

import 'package:senorvis/Interface.dart';
import 'package:dart_periphery/dart_periphery.dart';
// import 'dart:io';
// 0x38 - AHT2x

class RealSensor implements SensorManager {
  @override
  double getWaterLevel() {
    return Random().nextDouble() * 10000;
  }

  double getFlowRate() {
    return Random().nextDouble() * 1000;
  }

  double getHumidity() {
    // return Random().nextDouble() * 1000;
    var s = Serial('/dev/ttyS0', Baudrate.b9600);
    try {
      String humid = s.read(256, 40).toString();
      return double.parse(humid);
      // return 1.0;
    } finally {
      s.dispose();
    }

    // var i2c = I2C(1);
    // try {
    //   // print('I2C info:' + i2c.getI2Cinfo());
    //   var aht2x = BME280(i2c);
    //   var r = aht2x.getValues();
    //   return r.humidity;
    // } finally {
    //   i2c.dispose();
    // }
    // var aht2x = BME280(i2c);
    // var r = aht2x.getValues();
    // return r.humidity;
  }
}

// void main() {
//   // Select the right I2C bus number /dev/i2c-?
//   // 1 for Raspbery Pi, 0 for NanoPi (Armbian), 2 Banana Pi (Armbian)
//   var i2c = I2C(1);
//   try {
//     print('I2C info:' + i2c.getI2Cinfo());
//     var bme280 = BME280(i2c);
//     var r = bme280.getValues();
//     print('Temperature [°] ${r.temperature.toStringAsFixed(1)}');
//     print('Humidity [%] ${r.humidity.toStringAsFixed(1)}');
//     print('Pressure [hPa] ${r.pressure.toStringAsFixed(1)}');
//   } finally {
//     i2c.dispose();
//   }
// }
