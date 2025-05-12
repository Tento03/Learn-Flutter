import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';

void main(List<String> args) {
  runApp(
    GetMaterialApp(
      initialRoute: '/',
      getPages: [
        GetPage(
          name: '/',
          page: () => First(),
          binding: BindingsBuilder(() {
            Get.put('');
          }),
        ),
        GetPage(
          name: '/second',
          page: () => Secondd(),
          binding: BindingsBuilder(() {
            Get.put('');
          }),
        ),
      ],
    ),
  );
}

class First extends StatelessWidget {
  const First({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ElevatedButton(
        onPressed: () {
          Get.toNamed('/second');
        },
        child: Text('go'),
      ),
    );
  }
}

class Secondd extends StatelessWidget {
  const Secondd({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ElevatedButton(
        onPressed: () {
          Get.back();
        },
        child: Text('back'),
      ),
    );
  }
}
