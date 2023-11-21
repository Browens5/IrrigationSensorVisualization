import 'dart:async';
import 'dart:ffi';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:senorvis/dummysensor.dart';
import 'package:senorvis/realsensensor.dart';
import 'package:senorvis/chartdata.dart';
// import 'package:graphic/graphic.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'realsensor2.dart';
// import 'package:usb_serial/usb_serial.dart';

const isonpi = true;
final manager = isonpi ? RealSensor2() : DummySensor();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Irrigation Display',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 0, 2, 105)),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(
          title:
              '                                                                        Irrigation Modernization Sensor Data'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class DataPage extends StatefulWidget {
  const DataPage({super.key, required this.title});

  final String title;

  @override
  State<DataPage> createState() => _DataPageState();
}

class FlowRatePage extends StatefulWidget {
  const FlowRatePage({super.key, required this.title});

  final String title;

  @override
  State<FlowRatePage> createState() => _FlowRatePageState();
}

class WaterLevelPage extends StatefulWidget {
  const WaterLevelPage({super.key, required this.title});

  final String title;

  @override
  State<WaterLevelPage> createState() => _WaterLevelPageState();
}

class HumidityPage extends StatefulWidget {
  const HumidityPage({super.key, required this.title});

  final String title;

  @override
  State<HumidityPage> createState() => _HumidityPageState();
}

class MetricsPage extends StatefulWidget {
  const MetricsPage({super.key, required this.title});

  final String title;

  @override
  State<MetricsPage> createState() => _MetricsPageState();
}

class ResearchPage extends StatefulWidget {
  const ResearchPage({super.key, required this.title});

  final String title;

  @override
  State<ResearchPage> createState() => _ResearchPageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Widget header = Container(
    alignment: Alignment.topCenter,
    // padding: EdgeInsets.all(10),

    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'images/INL.png',
          width: 180 * 2,
          height: 100 * 2,
          fit: BoxFit.cover,
        ),
        Image.asset(
          'images/90.png',
          width: 180 * 2,
          height: 100 * 2,
          fit: BoxFit.cover,
        ),
      ],
    ),
  );

  // Widget datalist = Container(
  //   alignment: Alignment.bottomCenter,
  //   child: Row(
  //     children: [
  //       Expanded(
  //           child: Column(
  //         children: [
  //           const Text(
  //             'Water Level(Dummy Data)%:',
  //           ),
  //           Text(
  //             '$waterlevel',
  //             style: Theme.of(context).textTheme.headlineMedium,
  //           ),
  //           ElevatedButton(
  //             style: style,
  //             onPressed: refreshwaterpress,
  //             child: const Text('Add Water'),
  //           ),
  //         ],
  //       ))
  //     ],
  //   ),
  // );

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style =
        ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 30));
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,

          children: <Widget>[
            const Spacer(),
            header,
            // data1,

            // Text(
            //     'This display was created by Bill Ezouaouy, Brad McDonald, Yu-Ching Lee, and Brian Owens under the direction of Kara Kafferty'),
            const Spacer(),
            Container(
              margin: const EdgeInsets.all(10),
              child: Row(children: [
                const Spacer(),
                ElevatedButton(
                  style: style,
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const DataPage(title: 'Data'),
                      ),
                    );
                  },
                  child: const Text('Data'),
                ),
                const Spacer(),
                ElevatedButton(
                  style: style,
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>
                            const FlowRatePage(title: 'Flow Rate'),
                      ),
                    );
                  },
                  child: const Text('Flow Rate'),
                ),
                const Spacer(),
                ElevatedButton(
                  style: style,
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>
                            const WaterLevelPage(title: 'Water Level'),
                      ),
                    );
                  },
                  child: const Text('Water Level'),
                ),
                const Spacer(),
                ElevatedButton(
                  style: style,
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>
                            const HumidityPage(title: 'Humidity'),
                      ),
                    );
                  },
                  child: const Text('Humidity'),
                ),
                const Spacer(),
              ]),
            ),
            const Spacer(),

            // const Text(
            //   'Flow Rate:',
            // ),
            // Text(
            //   '$flowrate',
            //   style: Theme.of(context).textTheme.headlineMedium,
            // ),

            // const Text(
            //   'Humidity%:',
            // ),
            // Text(
            //   '$humidity',
            //   style: Theme.of(context).textTheme.headlineMedium,
            // ),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: refreshwaterpress,
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class _DataPageState extends State<DataPage> {
  StreamSubscription<double>? _waterLevelSubscription;
  StreamSubscription<double>? _flowRateSubscription;
  StreamSubscription<double>? _humiditySubscription;
  @override
  void initState() {
    super.initState();
    _waterLevelSubscription =
        manager.waterLevelStream.listen(_waterLevelListener);
    _flowRateSubscription = manager.flowRateStream.listen(_flowRateListener);
    _humiditySubscription = manager.humidityStream.listen(_humidityListener);
  }

  @override
  void dispose() {
    _waterLevelSubscription?.cancel();
    _flowRateSubscription?.cancel();
    _humiditySubscription?.cancel();
    super.dispose();
  }

  List<ChartData> waterlevels = [];
  List<ChartData> recentlevels = [];
  List<ChartData> flowrates = [];
  List<ChartData> recentrates = [];
  List<ChartData> humidities = [];
  List<ChartData> recenthumids = [];
  int lengthdata = 200;

  void _waterLevelListener(double level) {
    waterlevels.add(ChartData(waterlevels.length, level));
    recentlevels = waterlevels.sublist(max(0, waterlevels.length - lengthdata));
    setState(() {});
  }

  void _flowRateListener(double rate) {
    flowrates.add(ChartData(flowrates.length, rate));
    recentrates = flowrates.sublist(max(0, flowrates.length - lengthdata));
    setState(() {});
  }

  void _humidityListener(double humidity) {
    humidities.add(ChartData(humidities.length, humidity));
    recenthumids = humidities.sublist(max(0, humidities.length - lengthdata));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // final ButtonStyle style =
    //     ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 30));
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
          child: Row(
        children: [
          // const Spacer(),
          // Container(
          //   margin: const EdgeInsets.all(20),
          //   child: Row(
          //     children: [
          //       const Spacer(),
          //       Column(
          //         children: [
          //           const Text(
          //             'Water level: ',
          //           ),
          //           Text(
          //             waterlevels.lastOrNull?.y.toStringAsFixed(2) ??
          //                 'Not Available',
          //             style: Theme.of(context).textTheme.headlineMedium,
          //           ),
          //         ],
          //       ),
          //       Column(
          //         children: [
          //           const Text(
          //             'Flow Rate: ',
          //           ),
          //           Text(
          //             flowrates.isEmpty
          //                 ? 'Not Available'
          //                 : "${(flowrates.lastOrNull ?? ChartData(0, 0.0)).y.toStringAsFixed(2)} L/s",
          //             style: Theme.of(context).textTheme.headlineMedium,
          //           ),
          //         ],
          //       ),
          //       const Spacer(),
          //       Column(
          //         children: [
          //           const Text(
          //             'Humidity (%):',
          //           ),
          //           Text(
          //             humidities.lastOrNull?.y.toStringAsFixed(2) ??
          //                 'Not Available',
          //             style: Theme.of(context).textTheme.headlineMedium,
          //           ),
          //         ],
          //       ),
          //       const Spacer(),
          //     ],
          //   ),
          // ),

          // const Spacer(),
          // Container(
          //     margin: const EdgeInsets.all(20),
          //     child: Row(
          //       children: [
          // const Spacer(),
          Container(
            margin: const EdgeInsets.all(24),
            child: SfCartesianChart(
              // Initialize category axis
              title: ChartTitle(
                  text: 'Flow Rate Data (%)',
                  borderWidth: 2,
                  // Aligns the chart title to left
                  alignment: ChartAlignment.center,
                  textStyle: const TextStyle(
                    color: Color.fromARGB(255, 101, 0, 0),
                  )),
              primaryXAxis: NumericAxis(title: AxisTitle(text: 'Time (a.u.)')),
              primaryYAxis: NumericAxis(
                  title: AxisTitle(text: 'Flow Rate (L/min)'),
                  labelAlignment: LabelAlignment.center),
              series: <ChartSeries>[
                // Initialize line series

                // FastLineSeries<ChartData, double>(
                LineSeries<ChartData, int>(
                  // SplineAreaSeries<ChartData, int>(
                  // BubbleSeries<ChartData, double>(
                  // StepAreaSeries<ChartData, double>(
                  // StepLineSeries<ChartData, double>(
                  dataSource: recentrates,

                  xValueMapper: (ChartData data, _) => data.x,
                  yValueMapper: (ChartData data, _) => data.y,
                  xAxisName: "Time (a.u.)",
                  yAxisName: "Flow Rate (L/min)",
                  animationDuration: 800,
                  color: const Color.fromARGB(255, 13, 0, 255),
                  // markerSettings: const MarkerSettings(isVisible: true),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.all(24),
            child: SfCartesianChart(
              // Initialize category axis
              title: ChartTitle(
                  text: 'Water Level Data (%)',
                  borderWidth: 2,
                  // Aligns the chart title to left
                  alignment: ChartAlignment.center,
                  textStyle: const TextStyle(
                    color: Color.fromARGB(255, 5, 0, 101),
                  )),
              primaryXAxis: NumericAxis(title: AxisTitle(text: 'Time (a.u.)')),
              primaryYAxis: NumericAxis(
                  title: AxisTitle(text: 'Water Level (%)'),
                  labelAlignment: LabelAlignment.center),
              series: <ChartSeries>[
                // Initialize line series

                // FastLineSeries<ChartData, double>(
                LineSeries<ChartData, int>(
                  // SplineAreaSeries<ChartData, int>(
                  // BubbleSeries<ChartData, double>(
                  // StepAreaSeries<ChartData, double>(
                  // StepLineSeries<ChartData, double>(
                  dataSource: recentlevels,

                  xValueMapper: (ChartData data, _) => data.x,
                  yValueMapper: (ChartData data, _) => data.y,
                  xAxisName: "Time (a.u.)",
                  yAxisName: "Water Level (%)",
                  animationDuration: 800,
                  color: const Color.fromARGB(255, 13, 0, 255),
                  // markerSettings: const MarkerSettings(isVisible: true),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.all(24),
            child: SfCartesianChart(
              // Initialize category axis
              title: ChartTitle(
                  text: 'Humidity Data (%)',
                  borderWidth: 2,
                  // Aligns the chart title to left
                  alignment: ChartAlignment.center,
                  textStyle: const TextStyle(
                    color: Color.fromARGB(255, 5, 0, 101),
                  )),
              primaryXAxis: NumericAxis(title: AxisTitle(text: 'Time (a.u.)')),
              primaryYAxis: NumericAxis(
                  title: AxisTitle(text: 'Humidity (%)'),
                  labelAlignment: LabelAlignment.center),
              series: <ChartSeries>[
                // Initialize line series

                // FastLineSeries<ChartData, double>(
                LineSeries<ChartData, int>(
                  // SplineAreaSeries<ChartData, int>(
                  // BubbleSeries<ChartData, double>(
                  // StepAreaSeries<ChartData, double>(
                  // StepLineSeries<ChartData, double>(
                  dataSource: recenthumids,
                  xValueMapper: (ChartData data, _) => data.x,
                  yValueMapper: (ChartData data, _) => data.y,
                  xAxisName: "Time (a.u.)",
                  yAxisName: "Humidity (%)",
                  animationDuration: 800,
                  color: const Color.fromARGB(255, 9, 255, 0),
                  // markerSettings: const MarkerSettings(isVisible: true),
                ),
              ],
            ),
          ),
          const Spacer(),
        ],
      )),

      // const Spacer(),
      // Text('This is the data page. Put the data collected here'),
      // Spacer(),
      // Container(
      //   margin: EdgeInsets.all(10),
      //   child: Row(children: [
      //     Spacer(),
      //     ElevatedButton(
      //       style: style,
      //       onPressed: () {
      //         Navigator.of(context).push(
      //           MaterialPageRoute(
      //             builder: (context) => const MyHomePage(
      //                 title: 'Irrigation Modernization Display'),
      //           ),
      //         );
      //       },
      //       child: const Text('Home'),
      //     ),
      //     Spacer(),
      //     ElevatedButton(
      //       style: style,
      //       onPressed: () {
      //         Navigator.of(context).push(
      //           MaterialPageRoute(
      //             builder: (context) => const MetricsPage(title: 'Metrics'),
      //           ),
      //         );
      //       },
      //       child: const Text('Metrics'),
      //     ),
      //     Spacer(),
      //     ElevatedButton(
      //       style: style,
      //       onPressed: () {
      //         Navigator.of(context).push(
      //           MaterialPageRoute(
      //             builder: (context) =>
      //                 const ResearchPage(title: 'Research'),
      //           ),
      //         );
      //       },
      //       child: const Text('Research'),
      //     ),
      //     Spacer(),
      //   ]),
      // ),
      // Spacer(),
      // ],
      // )
      // ),
    );
  }
}

class _FlowRatePageState extends State<FlowRatePage> {
  StreamSubscription<double>? _flowRateSubscription;
  @override
  void initState() {
    super.initState();
    _flowRateSubscription = manager.flowRateStream.listen(_flowRateListener);
  }

  @override
  void dispose() {
    _flowRateSubscription?.cancel();
    super.dispose();
  }

  List<ChartData> flowrates = [];
  List<ChartData> recentrates = [];
  int lengthdata = 200;

  void _flowRateListener(double rate) {
    flowrates.add(ChartData(flowrates.length, rate));
    recentrates = flowrates.sublist(max(0, flowrates.length - lengthdata));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // final ButtonStyle style =
    //     ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 30));
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: SizedBox(
        // child: Column(
        // children: [
        // const Spacer(),
        // Container(
        //   margin: const EdgeInsets.all(20),
        //   child: Row(
        //     children: [
        //       const Spacer(),
        //       Column(
        //         children: [
        //           const Text(
        //             'Flow Rate: ',
        //           ),
        //           Text(
        //             flowrates.lastOrNull?.y.toStringAsFixed(2) ??
        //                 'Not Available',
        //             style: Theme.of(context).textTheme.headlineMedium,
        //           ),
        //         ],
        //       ),
        //       const Spacer(),
        //     ],
        //   ),
        // ),

        // const Spacer(),
        // Container(
        // margin: const EdgeInsets.all(20),
        child: SfCartesianChart(
          // Initialize category axis
          // title: ChartTitle(
          //     text: 'Flow Rate Data (L/min)',
          //     borderWidth: 2,
          //     // Aligns the chart title to left
          //     alignment: ChartAlignment.center,
          //     textStyle: const TextStyle(
          //       color: Color.fromARGB(255, 5, 0, 101),
          //     )),
          primaryXAxis: NumericAxis(title: AxisTitle(text: 'Time (a.u.)')),
          primaryYAxis: NumericAxis(
              title: AxisTitle(text: 'Flow Rate (L/min)'),
              labelAlignment: LabelAlignment.center),
          series: <ChartSeries>[
            // Initialize line series

            // FastLineSeries<ChartData, double>(
            LineSeries<ChartData, int>(
              // SplineAreaSeries<ChartData, int>(
              // BubbleSeries<ChartData, double>(
              // StepAreaSeries<ChartData, double>(
              // StepLineSeries<ChartData, double>(
              dataSource: recentrates,

              xValueMapper: (ChartData data, _) => data.x,
              yValueMapper: (ChartData data, _) => data.y,
              xAxisName: "Time (a.u.)",
              yAxisName: "Flow Rate (L/min)",
              animationDuration: 800,
              color: const Color.fromARGB(255, 13, 0, 255),
              // markerSettings: const MarkerSettings(isVisible: true),
            ),
          ],
        ),
        //     ),

        //     // const Spacer(),
        //   ],
        // )
      ),
    );
  }
}

class _WaterLevelPageState extends State<WaterLevelPage> {
  StreamSubscription<double>? _waterLevelSubscription;
  @override
  void initState() {
    super.initState();
    _waterLevelSubscription =
        manager.waterLevelStream.listen(_waterLevelListener);
  }

  @override
  void dispose() {
    _waterLevelSubscription?.cancel();
    super.dispose();
  }

  List<ChartData> waterlevels = [];
  List<ChartData> recentlevels = [];
  int lengthdata = 200;

  void _waterLevelListener(double level) {
    waterlevels.add(ChartData(waterlevels.length, level));
    recentlevels = waterlevels.sublist(max(0, waterlevels.length - lengthdata));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // final ButtonStyle style =
    //     ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 30));
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: SizedBox(
        // child: Column(
        // children: [
        // const Spacer(),
        // Container(
        //   margin: const EdgeInsets.all(20),
        //   child: Row(
        //     children: [
        //       const Spacer(),
        //       Column(
        //         children: [
        //           const Text(
        //             'Water Level (%): ',
        //           ),
        //           Text(
        //             waterlevels.lastOrNull?.y.toStringAsFixed(2) ??
        //                 'Not Available',
        //             style: Theme.of(context).textTheme.headlineMedium,
        //           ),
        //         ],
        //       ),
        //       const Spacer(),
        //     ],
        //   ),
        // ),

        // const Spacer(),
        // Container(
        // margin: const EdgeInsets.all(20),
        child: SfCartesianChart(
          // Initialize category axis
          // title: ChartTitle(
          //     text: 'Water Level Data (%)',
          //     borderWidth: 2,
          //     // Aligns the chart title to left
          //     alignment: ChartAlignment.center,
          //     textStyle: const TextStyle(
          //       color: Color.fromARGB(255, 5, 0, 101),
          //     )),
          primaryXAxis: NumericAxis(title: AxisTitle(text: 'Time (a.u.)')),
          primaryYAxis: NumericAxis(
              title: AxisTitle(text: 'Water Level (%)'),
              labelAlignment: LabelAlignment.center),
          series: <ChartSeries>[
            // Initialize line series

            // FastLineSeries<ChartData, double>(
            LineSeries<ChartData, int>(
              // SplineAreaSeries<ChartData, int>(
              // BubbleSeries<ChartData, double>(
              // StepAreaSeries<ChartData, double>(
              // StepLineSeries<ChartData, double>(
              dataSource: recentlevels,

              xValueMapper: (ChartData data, _) => data.x,
              yValueMapper: (ChartData data, _) => data.y,
              xAxisName: "Time (a.u.)",
              yAxisName: "Water Level (%)",
              animationDuration: 800,
              color: const Color.fromARGB(255, 13, 0, 255),
              // markerSettings: const MarkerSettings(isVisible: true),
            ),
          ],
        ),
        // ),

        // const Spacer(),
        // ],
        // )
      ),
    );
  }
}

class _HumidityPageState extends State<HumidityPage> {
  StreamSubscription<double>? _humiditySubscription;
  @override
  void initState() {
    super.initState();
    _humiditySubscription = manager.humidityStream.listen(_humidityListener);
  }

  @override
  void dispose() {
    _humiditySubscription?.cancel();
    super.dispose();
  }

  List<ChartData> humidities = [];
  List<ChartData> recenthumids = [];
  int lengthdata = 200;

  void _humidityListener(double humidity) {
    humidities.add(ChartData(humidities.length, humidity));
    recenthumids = humidities.sublist(max(0, humidities.length - lengthdata));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // final ButtonStyle style =
    //     ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 30));
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: SizedBox(
        //   child: Row(
        // children: [
        //   const Spacer(),
        //   Container(
        //     margin: const EdgeInsets.all(20),
        //     child: Row(
        //       children: [
        //         const Spacer(),
        //         Column(
        //           children: [
        //             const Text(
        //               'Humidity (%): ',
        //             ),
        //             Text(
        //               humidities.lastOrNull?.y.toStringAsFixed(2) ??
        //                   'Not Available',
        //               style: Theme.of(context).textTheme.headlineMedium,
        //             ),
        //           ],
        //         ),
        //         const Spacer(),
        //       ],
        //     ),
        //   ),

        //   const Spacer(),
        // Container(
        // margin: const EdgeInsets.all(20),
        child: SfCartesianChart(
          // Initialize category axis
          // title: ChartTitle(
          //     text: 'Humidity Data (%)',
          //     borderWidth: 2,
          //     // Aligns the chart title to left
          //     alignment: ChartAlignment.center,
          //     textStyle: const TextStyle(
          //       color: Color.fromARGB(255, 5, 0, 101),
          //     )),
          primaryXAxis: NumericAxis(title: AxisTitle(text: 'Time (a.u.)')),
          primaryYAxis: NumericAxis(
              title: AxisTitle(text: 'Humidity (%)'),
              labelAlignment: LabelAlignment.center),
          series: <ChartSeries>[
            // Initialize line series

            // FastLineSeries<ChartData, double>(
            LineSeries<ChartData, int>(
              // SplineAreaSeries<ChartData, int>(
              // BubbleSeries<ChartData, double>(
              // StepAreaSeries<ChartData, double>(
              // StepLineSeries<ChartData, double>(
              dataSource: recenthumids,

              xValueMapper: (ChartData data, _) => data.x,
              yValueMapper: (ChartData data, _) => data.y,
              xAxisName: "Time (a.u.)",
              yAxisName: "Humidity (%)",
              animationDuration: 800,
              color: const Color.fromARGB(255, 13, 0, 255),
              // markerSettings: const MarkerSettings(isVisible: true),
            ),
          ],
        ),
      ),

      // const Spacer(),
      // ],
      // )
      // ),
    );
  }
}

class _MetricsPageState extends State<MetricsPage> {
  @override
  Widget build(BuildContext context) {
    AppBar(
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      title: Text(widget.title),
    );
    // final ButtonStyle style =
    //     ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 30));
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: const Center(
          child: Column(
        children: [
          Spacer(),
          Text('This is the metrics page. Put the real farm metrics here'),
          Spacer(),
          // Container(
          //   margin: EdgeInsets.all(10),
          //   child: Row(children: [
          //     Spacer(),
          //     ElevatedButton(
          //       style: style,
          //       onPressed: () {
          //         Navigator.of(context).push(
          //           MaterialPageRoute(
          //             builder: (context) => const MyHomePage(
          //                 title: 'Irrigation Modernization Display'),
          //           ),
          //         );
          //       },
          //       child: const Text('Home'),
          //     ),
          //     Spacer(),
          //     ElevatedButton(
          //       style: style,
          //       onPressed: () {
          //         Navigator.of(context).push(
          //           MaterialPageRoute(
          //             builder: (context) => const DataPage(title: 'Data'),
          //           ),
          //         );
          //       },
          //       child: const Text('Data'),
          //     ),
          //     Spacer(),
          //     ElevatedButton(
          //       style: style,
          //       onPressed: () {
          //         Navigator.of(context).push(
          //           MaterialPageRoute(
          //             builder: (context) =>
          //                 const ResearchPage(title: 'Research'),
          //           ),
          //         );
          //       },
          //       child: const Text('Research'),
          //     ),
          //     Spacer(),
          //   ]),
          // ),
          Spacer(),
        ],
      )),
    );
  }
}

class _ResearchPageState extends State<ResearchPage> {
  Widget picturesrow = Container(
    alignment: Alignment.topCenter,
    padding: const EdgeInsets.all(10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'images/re1.jpeg',
          width: 180 * 4,
          height: 145 * 4,
          fit: BoxFit.cover,
        ),
        const Text(""),
        Image.asset(
          'images/re2.png',
          width: 180 * 4,
          height: 145 * 4,
          fit: BoxFit.cover,
        ),
        const Text(""),
        Image.asset(
          'images/re3.png',
          width: 180 * 4,
          height: 145 * 4,
          fit: BoxFit.cover,
        ),
      ],
    ),
  );
  @override
  Widget build(BuildContext context) {
    AppBar(
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      title: Text(widget.title),
    );
    // final ButtonStyle style =
    //     ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 30));
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: SizedBox.expand(
          child: DraggableScrollableSheet(
        initialChildSize: 1,
        minChildSize: 1,
        builder: (BuildContext context, ScrollController scrollController) {
          return Container(
            color: const Color.fromARGB(255, 199, 211, 255),
            child: ListView.builder(
              controller: scrollController,
              itemCount: 1,
              itemBuilder: (BuildContext context, int index) {
                return picturesrow;
              },
            ),
          );
        },
      )),
    );
  }
}
