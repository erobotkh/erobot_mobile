import 'package:get/get.dart';

import '../controllers/setting_ir_remoter_controller.dart';

class SettingIrRemoterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SettingIrRemoterController>(
      () => SettingIrRemoterController(),
    );
  }
}
