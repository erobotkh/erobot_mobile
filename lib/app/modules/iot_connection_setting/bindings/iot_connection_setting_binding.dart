import 'package:erobot_mobile/app/modules/iot_connection_setting/controllers/iot_controller.dart';
import 'package:get/get.dart';

import '../controllers/iot_connection_setting_controller.dart';

class IotConnectionSettingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IotConnectionSettingController>(
      () => IotConnectionSettingController(),
    );
    Get.lazyPut<IotController>(
      () => IotController(),
    );
  }
}
