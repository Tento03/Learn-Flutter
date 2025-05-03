import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> items = ["red", "green", "blue"];
    return MaterialApp(
      title: "My App",
      home: Scaffold(
        appBar: AppBar(title: Text("Halo"), backgroundColor: Colors.amber),
        body: Align(
          alignment: Alignment.center,
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: items.length,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.all(10),
                child: Center(
                  child: Text("item ke $index adalah ${items[index]}"),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
