import 'package:get/get.dart';

import '../controllers/ir_remoter_controller.dart';

class IrRemoterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IrRemoterController>(
      () => IrRemoterController(),
    );
  }
}
