import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sensorvis/chart.dart';
import 'package:sensorvis/chartdata.dart';
// import 'package:graphic/graphic.dart';
// import 'package:usb_serial/usb_serial.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
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
      home: const MyHomePage(title: 'Irrigation Modernization Sensor Data'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
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
        centerTitle: true,
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
          ],
        ),
      ),
    );
  }
}

class DataPage extends ConsumerWidget {
  const DataPage({required this.title, super.key});
  final String title;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recentrates = ref.watch(filteredDataProvider(SourceKind.flowRate));
    final recentlevels = ref.watch(filteredDataProvider(SourceKind.waterLevel));
    final recenthumids = ref.watch(filteredDataProvider(SourceKind.humidity));
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Center(
          child: Row(
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.fromLTRB(10, 10, 10, 30),
              child: ChartWidget(
                title: 'Flow Rate Data (%)',
                data: recentrates,
                axisName: 'Flow Rate (L/min)',
                color: const Color.fromARGB(255, 255, 0, 0),
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.fromLTRB(10, 10, 10, 30),
              child: ChartWidget(
                title: 'Water Level Data (%)',
                data: recentlevels,
                axisName: "Water Level (%)",
                color: const Color.fromARGB(255, 13, 0, 255),
              ),
            ),
          ),
          Expanded(
            // flex: 2,
            child: Container(
              margin: const EdgeInsets.fromLTRB(10, 10, 10, 30),
              child: ChartWidget(
                title: 'Humidity Data (%)',
                data: recenthumids,
                axisName: 'Humidity (%)',
                color: const Color.fromARGB(255, 9, 255, 0),
              ),
            ),
          ),
        ],
      )),
    );
  }
}

class FlowRatePage extends HookConsumerWidget {
  const FlowRatePage({required this.title, super.key});
  final String title;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nPoints = useState(200);
    final recentrates = ref.watch(
        filteredDataProvider(SourceKind.flowRate, nPoints: nPoints.value));
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: SizedBox(
        child: Column(
          children: [
            Text(
              "Sliding Window (${nPoints.value})",
            ),
            Slider(
              value: nPoints.value.toDouble(),
              max: 1000,
              min: 50,
              label: "Sliding Window (${nPoints.value})",
              onChanged: (value) {
                nPoints.value = value.toInt();
              },
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ChartWidget(
                showTitle: false,
                title: 'Flow Rate Data (%)',
                data: recentrates,
                axisName: 'Flow Rate (L/min)',
                color: const Color.fromARGB(255, 255, 0, 0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class WaterLevelPage extends HookConsumerWidget {
  const WaterLevelPage({required this.title, super.key});
  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nPoints = useState(200);
    final recentlevels = ref.watch(
        filteredDataProvider(SourceKind.waterLevel, nPoints: nPoints.value));

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Column(
        children: [
          Text(
            "Sliding Window (${nPoints.value})",
          ),
          Slider(
            value: nPoints.value.toDouble(),
            max: 1000,
            min: 50,
            label: "Sliding Window (${nPoints.value})",
            onChanged: (value) {
              nPoints.value = value.toInt();
            },
          ),
          const SizedBox(height: 20),
          Expanded(
            child: ChartWidget(
              showTitle: false,
              title: 'Water Level Data (%)',
              data: recentlevels,
              axisName: "Water Level (%)",
              color: const Color.fromARGB(255, 13, 0, 255),
            ),
          ),
        ],
      ),
    );
  }
}

class HumidityPage extends HookConsumerWidget {
  const HumidityPage({required this.title, super.key});
  final String title;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nPoints = useState(200);
    final recenthumids = ref.watch(
        filteredDataProvider(SourceKind.humidity, nPoints: nPoints.value));

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Column(
        children: [
          Text(
            "Sliding Window (${nPoints.value})",
          ),
          Slider(
            value: nPoints.value.toDouble(),
            max: 1000,
            min: 50,
            label: "Sliding Window (${nPoints.value})",
            onChanged: (value) {
              nPoints.value = value.toInt();
            },
          ),
          const SizedBox(height: 20),
          Expanded(
            child: ChartWidget(
              showTitle: false,
              title: 'Humidity Data (%)',
              data: recenthumids,
              axisName: 'Humidity (%)',
              color: const Color.fromARGB(255, 9, 255, 0),
            ),
          ),
        ],
      ),
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
