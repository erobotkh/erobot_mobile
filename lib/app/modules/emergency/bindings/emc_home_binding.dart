import 'package:get/get.dart';
import 'package:erobot_mobile/app/modules/emergency/controllers/emc_home_controller.dart';

class EmcHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EmcHomeController>(
      () => EmcHomeController(),
    );
  }
}
