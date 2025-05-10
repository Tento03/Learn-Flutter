import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main(List<String> args) {
  runApp(MyApk());
}

class MyApk extends StatelessWidget {
  const MyApk({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(home: Scaffold(body: HomeBar()));
  }
}

class HomeBar extends StatefulWidget {
  const HomeBar({super.key});

  @override
  State<HomeBar> createState() => _HomeBarState();
}

class _HomeBarState extends State<HomeBar> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("sds")),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Get.defaultDialog(
              title: "sds",
              content: Text("dsds"),
              textConfirm: "yes",
              textCancel: "no",
              onConfirm: () {
                Get.back();
                Get.snackbar("sds", "sdsd");
              },
              onCancel: () {
                Get.back();
              },
            );
          },
          child: Text("pres"),
        ),
      ),
      bottomNavigationBar: ConvexAppBar(
        initialActiveIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: [
          TabItem(icon: Icon(Icons.home)),
          TabItem(icon: Icon(Icons.home)),
          TabItem(icon: Icon(Icons.home)),
        ],
      ),
    );
  }
}
