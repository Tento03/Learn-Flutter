import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  final box = GetStorage();
  var isLoggedin = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    isLoggedin.value = box.read('isLoggedin') ?? false;
  }

  void login() {
    isLoggedin.value = true;
    box.write('isLoggedin', true);
  }

  void logout() {
    isLoggedin.value = false;
    box.remove('isLoggedin');
  }
}
