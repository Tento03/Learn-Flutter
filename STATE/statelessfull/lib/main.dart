import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int counter = 0;

  void incrementCounter() {
    setState(() {
      counter++;
    });
  }

  void decrementCounter() {
    setState(() {
      counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "State",
      home: Scaffold(
        appBar: AppBar(title: Text("State")),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("$counter"),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      incrementCounter();
                    },
                    child: Text("Increase"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      decrementCounter();
                    },
                    child: Text("Decrease"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
