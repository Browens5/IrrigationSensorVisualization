import 'dart:async';

import 'package:flutter/material.dart';
import 'package:senorvis/dummysensor.dart';

const isonpi = false;
final manager = isonpi ? DummySensor() : DummySensor();

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
      home: const MyHomePage(title: 'Irrigation Modernization Display'),
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
  double waterlevel = 0;
  double flowrate = 0;
  double humidity = 0;
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
            // const Text(
            //   'Water Level%:',
            // ),
            // Text(
            //   '$waterlevel',
            //   style: Theme.of(context).textTheme.headlineMedium,
            // ),
            Spacer(),
            Text(
                'This display was created by Bill Ezouaouy, Brad McDonald, Yu-Ching Lee, and Brian Owens under the direction of Kara Kafferty'),
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
  @override
  Widget build(BuildContext context) {
    final ButtonStyle style =
        ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 30));
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
          child: Column(
        children: [
          Spacer(),
          Text('This is the data page. Put the data collected here'),
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
                      builder: (context) => const MyHomePage(
                          title: 'Irrigation Modernization Display'),
                    ),
                  );
                },
                child: const Text('Home'),
              ),
              Spacer(),
              ElevatedButton(
                style: style,
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const MetricsPage(title: 'Metrics'),
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
    final ButtonStyle style =
        ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 30));
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
          Container(
            margin: EdgeInsets.all(10),
            child: Row(children: [
              Spacer(),
              ElevatedButton(
                style: style,
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const MyHomePage(
                          title: 'Irrigation Modernization Display'),
                    ),
                  );
                },
                child: const Text('Home'),
              ),
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
        ],
      )),
    );
  }
}

class _ResearchPageState extends State<ResearchPage> {
  @override
  Widget build(BuildContext context) {
    AppBar(
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      title: Text(widget.title),
    );
    final ButtonStyle style =
        ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 30));
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
          child: Column(
        children: [
          Spacer(),
          Text('This is the research page. Put the research information here'),
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
                      builder: (context) => const MyHomePage(
                          title: 'Irrigation Modernization Display'),
                    ),
                  );
                },
                child: const Text('Home'),
              ),
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
                      builder: (context) => const MetricsPage(title: 'Metrics'),
                    ),
                  );
                },
                child: const Text('Metrics'),
              ),
              Spacer(),
            ]),
          ),
          Spacer(),
        ],
      )),
    );
  }
}
