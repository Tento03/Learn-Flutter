import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/instance_manager.dart';
import 'package:statemanagement/CounterController.dart';

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

class HomePage extends StatelessWidget {
  final Countercontroller countercontroller = Get.put(Countercontroller());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Countercontroller>(
      init: Countercontroller(),
      builder:
          (controller) => Scaffold(
            body: Center(child: Text("Count:${countercontroller.count}")),
            floatingActionButton: FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: countercontroller.increment,
            ),
          ),
    );
  }
}
