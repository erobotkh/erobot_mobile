import 'package:get/get.dart';

import '../controllers/robot_remote_setting_controller.dart';

class RobotRemoteSettingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RobotRemoteSettingController>(
      () => RobotRemoteSettingController(),
    );
  }
}
