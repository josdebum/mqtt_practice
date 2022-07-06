import 'package:flutter/material.dart';
import 'package:mqtt_practice/mqtt_setup.dart';
import 'package:provider/provider.dart';

import 'app_state.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MultiProvider(providers: [
          ChangeNotifierProvider<MQTTAppState>(
            create: (_) => MQTTAppState(),
            child: MyHomePage(),
          ),
        ]));
  }
}

//class ChangeNotifierProvider {}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late MQTTManager manager;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mqtt"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextButton(
                onPressed: () async {
                  manager.connect();
                },
                child: Text("Connect")),
            TextButton(
                onPressed: () async {
                  manager.onSubscribed("");
                },
                child: Text("Subscribe")),
            TextButton(
                onPressed: () async {
                  manager.onConnected();
                },
                child: Text("Publish")),
            TextButton(
                onPressed: () async {
                  manager.connect();
                },
                child: Text("Unsubscribe")),
            TextButton(
                onPressed: () async {
                  manager.connect();
                },
                child: Text("Disconnect")),
          ],
        ),
      ),
    );
  }
}
