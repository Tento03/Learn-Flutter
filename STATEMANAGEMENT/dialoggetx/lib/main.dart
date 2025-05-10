import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/route_manager.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Dialog")),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              Get.defaultDialog(
                title: "Konfirmasi",
                content: Text("Are u loved her?"),
                textConfirm: "Yes",
                textCancel: "Nah",
                onConfirm: () {
                  Get.back();
                  Get.snackbar(
                    "Alert",
                    "Nc",
                    snackPosition: SnackPosition.BOTTOM,
                  );
                },
                onCancel: () {
                  Get.back();
                  Get.snackbar("Alert", "Tf");
                },
              );
            },
            child: Text("Gas"),
          ),
        ),
      ),
    );
  }
}
