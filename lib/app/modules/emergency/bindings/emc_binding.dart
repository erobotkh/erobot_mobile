import 'package:erobot_mobile/app/modules/emergency/controllers/emc_controller.dart';
import 'package:get/get.dart';

class EmcBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EmcController>(
      () => EmcController(),
    );
  }
}
