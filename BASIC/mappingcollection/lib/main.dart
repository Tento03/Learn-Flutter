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
      title: "Mapping Collection",
      home: Scaffold(
        appBar: AppBar(title: Text("Mapping Collection")),
        body: Align(
          alignment: Alignment.center,
          child: ListView(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            children:
                items.map((item) {
                  return Container(
                    margin: EdgeInsets.all(10),
                    child: Center(child: Text(item)),
                  );
                }).toList(),
          ),
        ),
      ),
    );
  }
}
