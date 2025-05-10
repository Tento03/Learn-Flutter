import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class MyController extends GetxController {
  var count = 0.obs;
  var search = ''.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    ever(count, (val) => print("Ever:count changed to $val"));
    once(count, (val) => print("Once:count change to $val"));
    debounce(
      search,
      (val) => print("Debounce:search = $val"),
      time: Duration(seconds: 1),
    );
    interval(
      search,
      (val) => print("Interval:search= $val"),
      time: Duration(seconds: 2),
    );
  }
}
