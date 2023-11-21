import 'dart:io';
import 'dart:math';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sensorvis/Interface.dart';
import 'package:sensorvis/dummysensor.dart';
import 'package:sensorvis/realsensor2.dart';

part 'chartdata.g.dart';

class ChartData {
  ChartData(this.x, this.y);
  final int x;
  final double y;
}

enum Source { dummy, real }

final sourceProvider =
    StateProvider((ref) => Platform.isLinux ? Source.real : Source.dummy);

@Riverpod(keepAlive: true)
SensorManager sensor(SensorRef ref) {
  final source = ref.watch(sourceProvider);
  if (source == Source.dummy) {
    return DummySensor();
  } else {
    return RealSensor2();
  }
}

enum SourceKind { flowRate, humidity, waterLevel }

@Riverpod(keepAlive: true)
class SensorDataNotifier extends _$SensorDataNotifier {
  @override
  List<ChartData> build(SourceKind kind) {
    final manager = ref.watch(sensorProvider);
    switch (kind) {
      case SourceKind.flowRate:
        ref.onDispose(manager.flowRateStream.listen(_listener).cancel);
      case SourceKind.humidity:
        ref.onDispose(manager.humidityStream.listen(_listener).cancel);
      case SourceKind.waterLevel:
        ref.onDispose(manager.waterLevelStream.listen(_listener).cancel);
    }
    return [];
  }

  void _listener(double data) {
    state.add(ChartData(state.length, data));
    state = state;
  }

  @override
  bool updateShouldNotify(List<ChartData> previous, List<ChartData> next) {
    return true;
  }
}

@riverpod
List<ChartData> filteredData(FilteredDataRef ref, SourceKind kind,
    {int nPoints = 200}) {
  final data = ref.watch(sensorDataNotifierProvider(kind));
  return data.sublist(max(0, data.length - nPoints));
}
