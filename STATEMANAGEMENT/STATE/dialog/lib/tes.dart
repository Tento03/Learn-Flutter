import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MyApk());
}

class MyApk extends StatelessWidget {
  const MyApk({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> items = ["red", "green", "blue"];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("hi")),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ListView.builder(
              shrinkWrap: true,
              itemCount: items.length,
              itemBuilder: (context, index) {
                return Container(
                  color: Colors.amber,
                  height: 100,
                  width: 100,
                  child: Text("data ke $index is ${items[index]}"),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
