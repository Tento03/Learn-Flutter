import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rxvariable/my_binding.dart';
import 'package:rxvariable/my_controller.dart';

void main(List<String> args) {
  runApp(GetMaterialApp(initialBinding: MyBinding(), home: HomeView()));
}

// ignore: use_key_in_widget_constructors
class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final MyController c = Get.find();

    return Scaffold(
      appBar: AppBar(title: Text("Semua Variabel Reaktif")),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("RxInt: ${c.rxInt}"),
              Text("RxDouble: ${c.rxDouble}"),
              Text("RxString: ${c.rxString}"),
              Text("RxBool: ${c.rxBool}"),
              Text("RxList: ${c.rxList}"),
              Text("RxMap: ${c.rxMap}"),
              Text("RxSet: ${c.rxSet}"),
              Text("Rx<User>: ${c.rxUser.value.name}, ${c.rxUser.value.age}"),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  c.rxInt++;
                  c.rxDouble.value += 1.5;
                  c.rxString.value = "Updated";
                  c.rxBool.toggle();

                  c.rxList.add("Item ${c.rxList.length + 1}");
                  c.rxMap["key${c.rxMap.length + 1}"] = "value";
                  c.rxSet.add("item${c.rxSet.length + 1}");

                  c.updateUser();
                },
                child: Text("Update Semua"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
