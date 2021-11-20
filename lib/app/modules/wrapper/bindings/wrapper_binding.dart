import 'package:erobot_mobile/app/modules/education/controllers/education_controller.dart';
import 'package:erobot_mobile/app/modules/home/controllers/home_controller.dart';
import 'package:erobot_mobile/app/modules/profile_wrapper/views/profile_wrapper_view.dart';
import 'package:get/get.dart';

import '../controllers/wrapper_controller.dart';

class WrapperBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WrapperController>(
      () => WrapperController(),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<EducationController>(
      () => EducationController(),
    );
    Get.lazyPut<ProfileWrapperView>(
      () => ProfileWrapperView(),
    );
  }
}
