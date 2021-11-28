import 'package:erobot_mobile/app/modules/wrapper/controllers/iot_controller.dart';
import 'package:get/get.dart';
import '../controllers/wrapper_controller.dart';

class WrapperBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WrapperController>(
      () => WrapperController(),
    );
    Get.lazyPut<IotController>(
      () => IotController(),
    );
  }
}
