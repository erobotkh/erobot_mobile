import 'package:get/get.dart';

import '../controllers/bluetooth_list_controller.dart';

class BluetoothListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BluetoothListController>(
      () => BluetoothListController(),
    );
  }
}
