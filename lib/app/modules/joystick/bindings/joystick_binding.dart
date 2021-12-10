import 'package:get/get.dart';

import '../controllers/joystick_controller.dart';

class JoystickBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<JoystickController>(
      () => JoystickController(),
    );
  }
}
