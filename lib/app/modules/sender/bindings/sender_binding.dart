import 'package:get/get.dart';

import '../controllers/sender_controller.dart';

class SenderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SenderController>(
      () => SenderController(),
    );
  }
}
