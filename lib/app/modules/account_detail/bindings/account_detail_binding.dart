import 'package:get/get.dart';

import '../controllers/account_detail_controller.dart';

class AccountDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AccountDetailController>(
      () => AccountDetailController(),
    );
  }
}
