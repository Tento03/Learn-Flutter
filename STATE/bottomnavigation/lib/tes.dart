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
            title: Text("hi"),
            bottom: TabBar(
              tabs: [
                Tab(text: "sdsd", icon: Icon(Icons.home)),
                Tab(text: "sdsd", icon: Icon(Icons.home)),
                Tab(text: "sdsd", icon: Icon(Icons.home)),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              Center(child: Text("sds")),
              Center(child: Text("sds")),
              Center(child: Text("sds")),
            ],
          ),
        ),
      ),
    );
  }
}
