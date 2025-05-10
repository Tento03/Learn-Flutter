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
            title: Text("Tab Bar Example"),
            bottom: TabBar(
              isScrollable: true,
              tabs: [
                Tab(icon: Icon(Icons.home), text: "Home"),
                Tab(icon: Icon(Icons.settings), text: "Settings"),
                Tab(icon: Icon(Icons.person), text: "Person"),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              Center(child: Text("Ini halaman view")),
              Center(child: Text("Ini halaman setting")),
              Center(child: Text("Ini halaman profile")),
            ],
          ),
        ),
      ),
    );
  }
}
