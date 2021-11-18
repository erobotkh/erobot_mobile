import 'package:get/get.dart';

import '../controllers/reputation_controller.dart';

class ReputationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReputationController>(
      () => ReputationController(),
    );
  }
}
