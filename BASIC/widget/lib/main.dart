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
      title: "Tento Application",
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text("My App"),
          centerTitle: false,
        ),
        backgroundColor: Colors.amber,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FlutterLogo(size: 200),
              SizedBox(height: 20),
              Text("Halo ini Flutter", style: TextStyle(fontSize: 24)),
              ElevatedButton(
                onPressed: () {
                  print("Halo");
                },
                child: Text("Klik Saya"),
              ),
              Icon(Icons.home),
              Image.asset("data/sakamoto.jpg"),
            ],
          ),
        ),
      ),
    );
  }
}
