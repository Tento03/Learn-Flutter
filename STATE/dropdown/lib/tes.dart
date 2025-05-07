import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MyApk());
}

class MyApk extends StatelessWidget {
  const MyApk({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text("hsds"),
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.home), text: "Home"),
                Tab(icon: Icon(Icons.home), text: "Home"),
                Tab(icon: Icon(Icons.home), text: "Home"),
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
