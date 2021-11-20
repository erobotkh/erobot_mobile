import 'package:erobot_mobile/app/routes/app_pages.dart';
import 'package:erobot_mobile/services/storages/user_token_storage.dart';
import 'package:get/get.dart';

class ProfileWrapperController extends GetxController {
  final UserTokenStorage storage = UserTokenStorage();
  final Rx<bool?> isSignedIn = null.obs;

  @override
  void onInit() {
    super.onInit();
    print("DLDLDL");
    storage.getCurrentUserToken().then((value) {
      isSignedIn.value = value?.accessToken != null;
      if (isSignedIn.value == true) {
        Get.replace(Routes.PROFILE_DETAIL);
      } else {
        Get.replace(Routes.LOGIN);
      }
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
