import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Widget Visiblity",
      home: Scaffold(
        appBar: AppBar(
          title: Text("My App"),
          backgroundColor: Colors.amberAccent,
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 50,
                width: 50,
                color: Colors.red,
                child: Center(child: Text("Red")),
              ),
              Container(
                width: 50,
                height: 50,
                color: Colors.green,
                child: Center(child: Text("Green")),
              ),
              Container(
                width: 50,
                height: 50,
                color: Colors.yellow,
                child: Center(child: Text("Yellow")),
              ),
              Container(
                height: 50,
                width: 50,
                color: Colors.red,
                child: Center(child: Text("Red")),
              ),
              Container(
                width: 50,
                height: 50,
                color: Colors.green,
                child: Center(child: Text("Green")),
              ),
              Container(
                width: 50,
                height: 50,
                color: Colors.yellow,
                child: Center(child: Text("Yellow")),
              ),
              Container(
                height: 50,
                width: 50,
                color: Colors.red,
                child: Center(child: Text("Red")),
              ),
              Container(
                width: 50,
                height: 50,
                color: Colors.green,
                child: Center(child: Text("Green")),
              ),
              Container(
                width: 50,
                height: 50,
                color: Colors.yellow,
                child: Center(child: Text("Yellow")),
              ),
              Container(
                height: 50,
                width: 50,
                color: Colors.red,
                child: Center(child: Text("Red")),
              ),
              Container(
                width: 50,
                height: 50,
                color: Colors.green,
                child: Center(child: Text("Green")),
              ),
              Container(
                width: 50,
                height: 50,
                color: Colors.yellow,
                child: Center(child: Text("Yellow")),
              ),
              Container(
                height: 50,
                width: 50,
                color: Colors.red,
                child: Center(child: Text("Red")),
              ),
              Container(
                width: 50,
                height: 50,
                color: Colors.green,
                child: Center(child: Text("Green")),
              ),
              Container(
                width: 50,
                height: 50,
                color: Colors.yellow,
                child: Center(child: Text("Yellow")),
              ),
              Container(
                height: 50,
                width: 50,
                color: Colors.red,
                child: Center(child: Text("Red")),
              ),
              Container(
                width: 50,
                height: 50,
                color: Colors.green,
                child: Center(child: Text("Green")),
              ),
              Container(
                width: 50,
                height: 50,
                color: Colors.yellow,
                child: Center(child: Text("Yellow")),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
