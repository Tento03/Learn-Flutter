import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Scaffold(body: HomePage()));
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Widget> item = [
    Center(child: Text('Beranda')),
    Center(child: Text('Cari')),
    Center(child: Text('Profil')),
  ];
  int selectedPages = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Bottom")),
      body: item[selectedPages],
      bottomNavigationBar: ConvexAppBar(
        initialActiveIndex: selectedPages,
        onTap: (index) {
          setState(() {
            selectedPages = index;
          });
        },
        items: [
          TabItem(icon: Icon(Icons.home)),
          TabItem(icon: Icon(Icons.search)),
          TabItem(icon: Icon(Icons.person)),
        ],
      ),
    );
  }
}
