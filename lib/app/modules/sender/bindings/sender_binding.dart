import 'package:erobot_mobile/app/modules/wrapper/controllers/iot_controller.dart';
import 'package:get/get.dart';

import '../controllers/sender_controller.dart';

class SenderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SenderController>(
      () => SenderController(),
    );
    Get.lazyPut<IotController>(
      () => IotController(),
    );
  }
}
