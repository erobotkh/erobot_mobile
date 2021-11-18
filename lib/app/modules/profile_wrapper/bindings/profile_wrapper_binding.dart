import 'package:get/get.dart';

import '../controllers/profile_wrapper_controller.dart';

class ProfileWrapperBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileWrapperController>(
      () => ProfileWrapperController(),
    );
  }
}
