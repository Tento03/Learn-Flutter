import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MyList());
}

class MyList extends StatelessWidget {
  const MyList({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "ListView",
      home: Scaffold(
        body: Align(
          alignment: Alignment.center,
          child: ListView(
            shrinkWrap: false,
            scrollDirection: Axis.vertical,
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
