import 'package:flutter/material.dart';
import 'package:sensorvis/chartdata.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartWidget extends StatelessWidget {
  const ChartWidget({
    super.key,
    required this.data,
    required this.title,
    required this.axisName,
    required this.color,
    this.showTitle = true,
  });

  final List<ChartData> data;
  final String title;
  final String axisName;
  final Color color;
  final bool showTitle;

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      // Initialize category axis
      title: ChartTitle(
          text: showTitle ? title : "",
          borderWidth: 2,
          // Aligns the chart title to left
          alignment: ChartAlignment.center,
          textStyle: const TextStyle(
            color: Color.fromARGB(255, 5, 0, 101),
          )),
      primaryXAxis: NumericAxis(title: AxisTitle(text: 'Time (a.u.)')),
      primaryYAxis: NumericAxis(
          title: AxisTitle(text: axisName),
          labelAlignment: LabelAlignment.center),
      series: <ChartSeries>[
        // Initialize line series

        // FastLineSeries<ChartData, double>(
        LineSeries<ChartData, int>(
          // SplineAreaSeries<ChartData, int>(
          // BubbleSeries<ChartData, double>(
          // StepAreaSeries<ChartData, double>(
          // StepLineSeries<ChartData, double>(
          dataSource: data,
          animationDelay: 0,
          animationDuration: 0,

          xValueMapper: (ChartData data, _) => data.x,
          yValueMapper: (ChartData data, _) => data.y,
          xAxisName: "Time (a.u.)",
          yAxisName: "Flow Rate (L/min)",
          color: color,
          // markerSettings: const MarkerSettings(isVisible: true),
        ),
      ],
    );
  }
}
