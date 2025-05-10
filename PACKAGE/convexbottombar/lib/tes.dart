import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:convexbottombar/main.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MyApk());
}

class MyApk extends StatelessWidget {
  const MyApk({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Homie());
  }
}

class Homie extends StatefulWidget {
  const Homie({super.key});

  @override
  State<Homie> createState() => _HomieState();
}

class _HomieState extends State<Homie> {
  final List<Widget> items = [
    Center(child: Text("home")),
    Center(child: Text("home")),
    Center(child: Text("home")),
  ];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("sd")),
      bottomNavigationBar: ConvexAppBar(
        initialActiveIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: [
          TabItem(icon: Icon(Icons.home), title: "sds"),
          TabItem(icon: Icon(Icons.home), title: "sds"),
          TabItem(icon: Icon(Icons.home), title: "sds"),
        ],
      ),
    );
  }
}
