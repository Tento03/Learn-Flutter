import 'package:get/get.dart';

class Countercontroller extends GetxController {
  int count = 0;

  void increment() {
    count++;
    update();
  }
}
