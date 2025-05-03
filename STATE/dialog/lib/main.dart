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
      title: "Dialog",
      home: Scaffold(
        appBar: AppBar(title: Text("Dialog")),
        body: Builder(
          // 🔑 Tambahkan Builder di sini
          builder:
              (context) => Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder:
                              (context) => AlertDialog(
                                title: Text("Ini Judul"),
                                content: Text("Ini Konten"),
                                actions: [
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text("Yes"),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text("No"),
                                  ),
                                ],
                              ),
                        );
                      },
                      child: Text("Show Dialog"),
                    ),
                  ],
                ),
              ),
        ),
      ),
    );
  }
}
