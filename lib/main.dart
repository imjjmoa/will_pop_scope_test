import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}
final navigatorKey = GlobalKey<NavigatorState>();


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      navigatorKey: navigatorKey,
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 70),
          child: Stack(
            children: [
              Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: 100,
                    height: 40,
                    child: ElevatedButton(onPressed: () {
                      Navigator.of(navigatorKey.currentState!.overlay!.context).push(PageRouteBuilder(
                          opaque: false,
                          pageBuilder: (context, _, __) =>
                              BlueWidget()));
                    }, child: Text("Show Page", style: TextStyle(color: Colors.white),), style:
                    ElevatedButton.styleFrom(primary: Colors.blue,)),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}



class BlueWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blue,
      ),
    );
  }
}