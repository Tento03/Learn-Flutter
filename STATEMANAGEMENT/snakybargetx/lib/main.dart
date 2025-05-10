import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Snack Bar")),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              Get.snackbar(
                "Alert",
                "I Love ",
                snackPosition: SnackPosition.BOTTOM,
                backgroundColor: Colors.black,
                colorText: Colors.white,
                duration: Duration(seconds: 3),
              );
            },
            child: Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}
