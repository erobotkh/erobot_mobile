import 'package:get/get.dart';

import '../controllers/thumbstick_controller.dart';

class ThumbstickBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ThumbstickController>(
      () => ThumbstickController(),
    );
  }
}
