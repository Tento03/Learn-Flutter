import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> items = ["Red", "Green", "Blue"];
    return MaterialApp(
      title: "Halo",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Widget Builder"),
          backgroundColor: Colors.amber,
        ),
        body: Align(
          alignment: Alignment.center,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: items.length,
            itemBuilder: (context, index) {
              return Container(
                color: Colors.amber,
                child: Center(child: Text("Item ke ${items[index]}")),
              );
            },
          ),
        ),
      ),
    );
  }
}
