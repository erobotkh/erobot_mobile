import 'package:get/get.dart';

import '../controllers/ball_shooter_controller.dart';

class BallShooterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BallShooterController>(
      () => BallShooterController(),
    );
  }
}
