import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:statemanagement/Controller.dart';

void main(List<String> args) {
  runApp(MyApk());
}

class MyApk extends StatelessWidget {
  final Controller controller = Controller();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Reactive")),
        body: Center(
          child: Column(
            children: [
              Obx(() => Text("${controller.count}")),
              ElevatedButton(
                onPressed: () {
                  controller.increment();
                },
                child: Text("Add"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
