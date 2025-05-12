import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/instance_manager.dart';

void main(List<String> args) {
  runApp(
    GetMaterialApp(
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => First()),
        GetPage(name: '/second', page: () => Second()),
      ],
    ),
  );
}

class First extends StatelessWidget {
  const First({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Get.toNamed('/second');
          },
          child: Text("go"),
        ),
      ),
    );
  }
}

class Second extends StatelessWidget {
  const Second({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Get.back();
          },
          child: Text("back"),
        ),
      ),
    );
  }
}
