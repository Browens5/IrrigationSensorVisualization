import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:senorvis/dummysensor.dart';
import 'package:senorvis/realsensensor.dart';
import 'package:senorvis/chartdata.dart';
// import 'package:graphic/graphic.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
// import 'package:usb_serial/usb_serial.dart';

const isonpi = true;
final manager = isonpi ? RealSensor() : DummySensor();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 0, 2, 105)),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(
          title:
              '                                            Irrigation Modernization Display'),
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
          width: 150 * 2,
          height: 80 * 2,
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
            Spacer(),
            header,
            // data1,

            // Text(
            //     'This display was created by Bill Ezouaouy, Brad McDonald, Yu-Ching Lee, and Brian Owens under the direction of Kara Kafferty'),
            Spacer(),
            Container(
              margin: EdgeInsets.all(10),
              child: Row(children: [
                Spacer(),
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
                Spacer(),
                ElevatedButton(
                  style: style,
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>
                            const MetricsPage(title: 'Metrics'),
                      ),
                    );
                  },
                  child: const Text('Metrics'),
                ),
                Spacer(),
                ElevatedButton(
                  style: style,
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>
                            const ResearchPage(title: 'Research'),
                      ),
                    );
                  },
                  child: const Text('Research'),
                ),
                Spacer(),
              ]),
            ),
            Spacer(),

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
  double waterlevel = 0;
  double flowrate = 0;
  double humidity = 0;
  double waterlevel1 = 0;
  double flowrate1 = 0;
  double humidity1 = 0;
  double waterlevel2 = 0;
  double flowrate2 = 0;
  double humidity2 = 0;
  double waterlevel3 = 0;
  double flowrate3 = 0;
  double humidity3 = 0;
  double waterlevel4 = 0;
  double flowrate4 = 0;
  double humidity4 = 0;
  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(milliseconds: 1000), (timer) {
      refreshwater();
      refreshflow();
      refreshhumidity();
    });
  }

  void refreshwater() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      waterlevel4 = waterlevel3;
      waterlevel3 = waterlevel2;
      waterlevel2 = waterlevel1;
      waterlevel1 = waterlevel;
      waterlevel = manager.getWaterLevel().roundToDouble();
    });
  }

  void refreshflow() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      flowrate = manager.getFlowRate().roundToDouble();
    });
  }

  void refreshhumidity() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      humidity = manager.getHumidity().roundToDouble();
    });
  }

  void refreshwaterpress() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      waterlevel = waterlevel + 1;
    });
  }

  void refreshflowpress() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      flowrate = flowrate + 1;
    });
  }

  void refreshhumiditypress() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      humidity = humidity + 1;
    });
  }

  double water() {
    return waterlevel;
  }

  double water1() {
    return waterlevel1;
  }

  double water2() {
    return waterlevel2;
  }

  double water3() {
    return waterlevel3;
  }

  double water4() {
    return waterlevel4;
  }

  double flow1() {
    return flowrate;
  }

  double humid1() {
    return humidity;
  }

  Widget build(BuildContext context) {
    // final ButtonStyle style =
    //     ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 30));

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
          child: Column(
        children: [
          // const Spacer(),
          // const Text(
          //   'Humidity%:',
          // ),
          // Text(
          //   '$humidity',
          //   style: Theme.of(context).textTheme.headlineMedium,
          // ),
          const Spacer(),
          Container(
            margin: const EdgeInsets.all(20),
            child: SfCartesianChart(
              // Initialize category axis
              primaryXAxis: CategoryAxis(),
              series: <ChartSeries>[
                // Initialize line series
                LineSeries<ChartData, double>(
                    dataSource: [
                      ChartData(0, water4()),
                      ChartData(1, water3()),
                      ChartData(2, water2()),
                      ChartData(3, water1()),
                      ChartData(4, water()),
                    ],
                    // dataSource: [
                    //   ChartData(3.83, 27),
                    //   ChartData(3.93, 27),
                    //   ChartData(4.03, 27),
                    //   ChartData(4.13, 27),
                    //   ChartData(4.23, 27),
                    //   ChartData(4.33, 27),
                    //   ChartData(4.43, 27),
                    //   ChartData(4.53, 27),
                    //   ChartData(4.63, 27),
                    //   ChartData(4.73, 27),
                    //   ChartData(4.83, 27),
                    //   ChartData(4.93, 27),
                    //   ChartData(5.03, 27),
                    //   ChartData(5.13, 27),
                    //   ChartData(5.24, 27),
                    //   ChartData(5.34, 27),
                    //   ChartData(5.44, 27),
                    //   ChartData(5.54, 27),
                    //   ChartData(5.64, 27),
                    //   ChartData(5.74, 27),
                    //   ChartData(5.84, 27),
                    //   ChartData(5.94, 27),
                    //   ChartData(6.04, 27),
                    //   ChartData(6.14, 27),
                    //   ChartData(6.24, 27),
                    //   ChartData(6.34, 27),
                    //   ChartData(6.44, 25),
                    //   ChartData(6.54, 24),
                    //   ChartData(6.64, 36),
                    //   ChartData(6.75, 50),
                    //   ChartData(6.85, 68),
                    //   ChartData(6.95, 78),
                    //   ChartData(7.05, 79),
                    //   ChartData(7.15, 80),
                    //   ChartData(7.25, 82),
                    //   ChartData(7.35, 86),
                    //   ChartData(7.45, 85),
                    //   ChartData(7.55, 86),
                    //   ChartData(7.65, 88),
                    //   ChartData(7.75, 90),
                    //   ChartData(7.85, 84),
                    //   ChartData(7.95, 85),
                    //   ChartData(8.05, 91),
                    //   ChartData(8.15, 94),
                    //   ChartData(8.26, 95),
                    //   ChartData(8.36, 95),
                    //   ChartData(8.56, 95),
                    //   ChartData(8.66, 95),
                    //   ChartData(8.76, 96),
                    //   ChartData(8.86, 95),
                    //   ChartData(8.96, 95),
                    //   ChartData(9.06, 95),
                    //   ChartData(9.16, 97),
                    //   ChartData(9.26, 93),
                    //   ChartData(9.36, 91),
                    //   ChartData(9.46, 90),
                    //   ChartData(9.56, 88),
                    //   ChartData(9.66, 83),
                    //   ChartData(9.77, 46),
                    //   ChartData(9.87, 42),
                    //   ChartData(9.97, 43),
                    //   ChartData(10.07, 41),
                    //   ChartData(10.17, 42),
                    //   ChartData(10.27, 42),
                    //   ChartData(10.37, 29),
                    //   ChartData(10.47, 24),
                    //   ChartData(10.57, 24),
                    //   ChartData(10.67, 24),
                    //   ChartData(10.77, 24),
                    //   ChartData(10.87, 24),
                    //   ChartData(10.97, 24),
                    //   ChartData(11.07, 24),
                    //   ChartData(11.17, 24),
                    //   ChartData(11.28, 24),
                    //   ChartData(11.38, 24),
                    //   ChartData(11.48, 24),
                    //   ChartData(11.58, 24),
                    //   ChartData(11.68, 24),
                    //   ChartData(11.78, 24),
                    //   ChartData(11.88, 24),
                    //   ChartData(11.98, 24),
                    //   ChartData(12.08, 25),
                    //   ChartData(12.18, 25),
                    //   ChartData(12.28, 29),
                    //   ChartData(12.38, 49),
                    //   ChartData(12.48, 72),
                    //   ChartData(12.58, 77),
                    //   ChartData(12.69, 79),
                    //   ChartData(12.79, 82),
                    //   ChartData(12.89, 83),
                    //   ChartData(12.99, 83),
                    //   ChartData(13.09, 83),
                    //   ChartData(13.19, 83),
                    //   ChartData(13.29, 84),
                    //   ChartData(13.89, 84),
                    //   ChartData(13.99, 84),
                    //   ChartData(14.10, 84),
                    //   ChartData(14.20, 84),
                    //   ChartData(14.30, 83),
                    //   ChartData(14.40, 81),
                    //   ChartData(14.50, 78),
                    //   ChartData(14.60, 77),
                    //   ChartData(14.70, 76),
                    //   ChartData(14.80, 77),
                    //   ChartData(14.90, 77),
                    //   ChartData(15.00, 76),
                    //   ChartData(15.10, 76),
                    //   ChartData(15.20, 75),
                    //   ChartData(15.30, 73),
                    //   ChartData(15.40, 72),
                    //   ChartData(15.51, 68),
                    //   ChartData(15.61, 60),
                    //   ChartData(15.71, 36),
                    //   ChartData(15.81, 24),
                    //   ChartData(15.91, 23),
                    //   ChartData(16.01, 23),
                    //   ChartData(16.11, 23),
                    //   ChartData(16.21, 23),
                    //   ChartData(16.31, 23),
                    //   ChartData(16.41, 23),
                    //   ChartData(16.51, 24),
                    //   ChartData(16.61, 24),
                    //   ChartData(16.71, 24),
                    //   ChartData(16.81, 24),
                    //   ChartData(16.92, 24),
                    //   ChartData(17.02, 24),
                    //   ChartData(17.12, 25),
                    //   ChartData(17.22, 28),
                    //   ChartData(17.32, 36),
                    //   ChartData(17.42, 52),
                    //   ChartData(17.52, 59),
                    //   ChartData(17.62, 64),
                    //   ChartData(17.72, 68),
                    //   ChartData(17.82, 75),
                    //   ChartData(17.92, 83),
                    //   ChartData(18.02, 89),
                    //   ChartData(18.12, 91),
                    //   ChartData(18.22, 92),
                    //   ChartData(18.33, 92),
                    //   ChartData(18.43, 92),
                    //   ChartData(18.53, 93),
                    //   ChartData(18.63, 93),
                    //   ChartData(33.63, 26),
                    //   ChartData(33.74, 26),
                    //   ChartData(33.84, 26),
                    //   ChartData(33.94, 26),
                    //   ChartData(34.04, 26),
                    //   ChartData(34.14, 26),
                    //   ChartData(34.24, 26),
                    //   ChartData(34.34, 26),
                    //   ChartData(34.44, 26),
                    //   ChartData(34.54, 26),
                    //   ChartData(34.64, 26),
                    //   ChartData(34.74, 26),
                    //   ChartData(34.84, 26),
                    //   ChartData(34.94, 26),
                    //   ChartData(35.04, 26),
                    //   ChartData(35.15, 26),
                    //   ChartData(35.25, 26),
                    //   ChartData(35.35, 26),
                    //   ChartData(35.45, 26),
                    //   ChartData(35.55, 26),
                    //   ChartData(35.65, 26),
                    //   ChartData(35.75, 26),
                    //   ChartData(35.85, 26),
                    //   ChartData(35.95, 26),
                    //   ChartData(36.05, 26),
                    //   ChartData(36.15, 26),
                    //   ChartData(36.25, 26),
                    //   ChartData(36.35, 26),
                    //   ChartData(36.45, 26),
                    //   ChartData(36.56, 26),
                    //   ChartData(36.66, 26),
                    //   ChartData(36.76, 26),
                    //   ChartData(36.86, 25),
                    //   ChartData(36.96, 26),
                    //   ChartData(37.06, 26),
                    //   ChartData(37.16, 26),
                    //   ChartData(37.26, 26),
                    //   ChartData(37.36, 25),
                    //   ChartData(37.46, 26),
                    //   ChartData(37.56, 26),
                    //   ChartData(37.66, 25),
                    //   ChartData(37.76, 26),
                    //   ChartData(37.86, 26),
                    //   ChartData(37.97, 26),
                    //   ChartData(38.07, 26),
                    //   ChartData(38.17, 26),
                    // ],
                    xValueMapper: (ChartData data, _) => data.x,
                    yValueMapper: (ChartData data, _) => data.y,
                    xAxisName: "Time (s)",
                    yAxisName: "Humidity (%)"),
              ],
            ),
          ),
          const Spacer(),
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
        ],
      )),
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
      body: Center(
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
          'images/re1.png',
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
            color: Color.fromARGB(255, 199, 211, 255),
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
