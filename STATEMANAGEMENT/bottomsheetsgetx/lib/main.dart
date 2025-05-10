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
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              Get.bottomSheet(
                Container(
                  padding: EdgeInsets.all(20),
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                  ),
                  child: Column(
                    children: [
                      Text("Ini bottomSheet"),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: Text("Close"),
                      ),
                    ],
                  ),
                ),
              );
            },
            child: Text("Press"),
          ),
        ),
      ),
    );
  }
}
