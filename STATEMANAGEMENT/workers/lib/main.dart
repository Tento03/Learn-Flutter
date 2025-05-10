import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/route_manager.dart';
import 'package:workers/my_bindings.dart';
import 'package:workers/my_controller.dart';

void main(List<String> args) {
  runApp(GetMaterialApp(initialBinding: MyBindings(), home: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final MyController myController = Get.find();

    return Scaffold(
      appBar: AppBar(title: Text("Workers")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Obx(() => Text("${myController.count}")),
            ElevatedButton(
              onPressed: () {
                myController.count++;
              },
              child: Text("Increment Count"),
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                label: Text("Search"),
                border: OutlineInputBorder(),
              ),
              onChanged: (val) => myController.search.value = val,
            ),
          ],
        ),
      ),
    );
  }
}
