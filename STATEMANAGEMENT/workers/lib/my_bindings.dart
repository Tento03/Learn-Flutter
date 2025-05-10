import 'package:get/get.dart';
import 'package:workers/my_controller.dart';

class MyBindings extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(MyController());
  }
}
