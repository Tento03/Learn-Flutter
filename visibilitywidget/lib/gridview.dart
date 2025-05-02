import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MyGrid());
}

class MyGrid extends StatelessWidget {
  const MyGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My Grid",
      home: Scaffold(
        body: Align(
          alignment: Alignment.center,
          child: GridView.count(
            shrinkWrap: true,
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            children: [
              NewWidget(),
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

class NewWidget extends StatelessWidget {
  const NewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      color: Colors.red,
      child: Center(child: Text("Red")),
    );
  }
}
