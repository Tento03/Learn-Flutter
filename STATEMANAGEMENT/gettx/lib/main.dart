import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'counter_controller.dart'; // import controller

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // Masukkan controller ke memory
  final CounterController counterController = Get.put(CounterController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('GetX Counter')),
        body: Center(
          child: Obx(
            () => Text(
              'Angka: ${counterController.count}',
              style: TextStyle(fontSize: 30),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: counterController.increment,
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
