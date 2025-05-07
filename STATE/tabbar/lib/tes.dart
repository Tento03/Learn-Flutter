import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text("ssds"),
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.home), text: "hOME"),
                Tab(icon: Icon(Icons.home), text: "hOME"),
                Tab(icon: Icon(Icons.home), text: "hOME"),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              Center(child: Text("home")),
              Center(child: Text("home")),
              Center(child: Text("home")),
            ],
          ),
        ),
      ),
    );
  }
}
