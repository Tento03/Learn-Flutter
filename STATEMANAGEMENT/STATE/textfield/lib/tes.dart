import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MyApk());
}

class MyApk extends StatelessWidget {
  const MyApk({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> items = ["sd", "dsd", "sdd"];
    return MaterialApp(
      home: Scaffold(
        body: SizedBox(
          height: 600,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ListView.builder(
                shrinkWrap: true,
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return Container(
                    color: Colors.amber,
                    height: 200,
                    child: Text("item ke $index is ${items[index]}"),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
