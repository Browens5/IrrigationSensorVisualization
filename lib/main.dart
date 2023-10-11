import 'dart:async';

import 'package:flutter/material.dart';
import 'package:senorvis/dummysensor.dart';
const isonpi = false;
final manager = isonpi ? DummySensor() : DummySensor();

// import 'package:flutter/cupertino.dart';

// /// Flutter code sample for [CupertinoPageScaffold].

// void main() => runApp(const PageScaffoldApp());

// class PageScaffoldApp extends StatelessWidget {
//   const PageScaffoldApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const CupertinoApp(
//       theme: CupertinoThemeData(brightness: Brightness.light),
//       home: PageScaffoldExample(),
//     );
//   }
// }

// class PageScaffoldExample extends StatefulWidget {
//   const PageScaffoldExample({super.key});

//   @override
//   State<PageScaffoldExample> createState() => _PageScaffoldExampleState();
// }

// class _PageScaffoldExampleState extends State<PageScaffoldExample> {
//   int _count = 0;

//   @override
//   Widget build(BuildContext context) {
//     return CupertinoPageScaffold(
//       // Uncomment to change the background color
//       // backgroundColor: CupertinoColors.systemPink,
//       navigationBar: const CupertinoNavigationBar(
//         middle: Text('INL Irrigation Demo - BYUI'),
//       ),
//       child: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Center(
//               child: Text('You have pressed the button $_count times.'),
//             ),
//             const SizedBox(height: 20.0),
//             Center(
//               child: CupertinoButton.filled(
//                 onPressed: () => setState(() => _count++),
//                 child: const Icon(CupertinoIcons.add),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

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
            ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 255, 0, 0)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'INL Irrigation Demo - BYU-Idaho'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double waterlevel = 0;
  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(milliseconds: 1000), (timer) {
      refreshwater();
    });
  }

  void refreshwater() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      waterlevel = manager.getWaterLevel();
    });
  }

  @override
  Widget build(BuildContext context) {
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
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$waterlevel',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: refreshwater,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
