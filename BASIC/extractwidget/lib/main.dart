import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MyExtractWidget());
}

class MyExtractWidget extends StatelessWidget {
  const MyExtractWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Extract Widget",
      home: Scaffold(
        appBar: AppBar(title: Text("My Widget")),
        body: Align(
          alignment: Alignment.center,
          child: GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            children: [
              MyContainer(),
              MyContainer(),
              MyContainer(),
              MyContainer(),
              MyContainer(),
              MyContainer(),
              MyContainer(),
              MyContainer(),
              MyContainer(),
              MyContainer(),
              MyContainer(),
            ],
          ),
        ),
      ),
    );
  }
}

class MyContainer extends StatelessWidget {
  const MyContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      color: Colors.amber,
      child: Center(child: Text("Text")),
    );
  }
}
