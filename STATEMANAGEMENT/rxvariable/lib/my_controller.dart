import 'package:get/get.dart';
import 'package:rxvariable/my_model.dart';

class MyController extends GetxController {
  var rxInt = 0.obs;
  var rxDouble = 0.0.obs;
  var rxString = "Hello".obs;
  var rxBool = true.obs;

  var rxList = <String>[].obs;
  var rxSet = <String>{}.obs;
  var rxMap = <String, dynamic>{}.obs;

  var rxUser = Rx<User>(User("Tento", 21));

  void updateUser() {
    rxUser.value = User("Tento", 45);
  }
}
