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
  });

  final List<ChartData> data;
  final String title;
  final String axisName;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(10, 10, 10, 30),
      child: SfCartesianChart(
        // Initialize category axis
        title: ChartTitle(
            text: title,
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

            xValueMapper: (ChartData data, _) => data.x,
            yValueMapper: (ChartData data, _) => data.y,
            xAxisName: "Time (a.u.)",
            yAxisName: "Flow Rate (L/min)",
            animationDuration: 800,
            color: color,
            // markerSettings: const MarkerSettings(isVisible: true),
          ),
        ],
      ),
    );
  }
}
