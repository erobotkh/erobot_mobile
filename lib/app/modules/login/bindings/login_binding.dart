import 'package:erobot_mobile/app/modules/profile_wrapper/controllers/profile_wrapper_controller.dart';
import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(
      () => LoginController(),
    );
    Get.lazyPut<ProfileWrapperController>(
      () => ProfileWrapperController(),
    );
  }
}
