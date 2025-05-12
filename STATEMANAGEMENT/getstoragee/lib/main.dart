import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getstoragee/my_controller.dart';

void main(List<String> args) async {
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Obx(
        () => loginController.isLoggedin.value ? HomePage() : LoginPage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  final LoginController loginController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            loginController.logout();
          },
          child: Text('Logout'),
        ),
      ),
    );
  }
}

class LoginPage extends StatelessWidget {
  final LoginController loginController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            loginController.login();
          },
          child: Text('Login'),
        ),
      ),
    );
  }
}
