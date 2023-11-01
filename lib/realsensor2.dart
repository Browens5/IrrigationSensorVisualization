import 'dart:convert';
import 'dart:math';

import 'package:senorvis/Interface.dart';
import 'package:linux_serial/linux_serial.dart';


class RealSensor2 extends SensorManager {

  @override
  void init() async {
    final s = SerialPorts.ports.singleWhere((e) => e.name == 'ttyS0');
    final handle = s.open(baudrate: Baudrate.b9600);
    handle.encoding = const AsciiCodec();
    final reader = handle.getNewSequentialReader();
    while (true){
      final info = await reader.readln();
      final hm = humidityRE.firstMatch(info);
      final frm = flowrateRE.firstMatch(info);
      final wlm = waterlevelRE.firstMatch(info);
      if (hm != null){
        humidity.add(double.parse(hm.group(1)!));
      } 
      if (frm != null){
        flowRate.add(double.parse(frm.group(1)!));
      }
      if (wlm != null){
        waterLevel.add(double.parse(wlm.group(1)!));
      }
    }
  }
}

final humidityRE = RegExp("H: ([0-9.]+)");
final flowrateRE = RegExp("FR: ([0-9.]+)");
final waterlevelRE = RegExp("WL: ([0-9.]+)");
