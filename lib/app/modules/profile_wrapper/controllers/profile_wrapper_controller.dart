import 'package:erobot_mobile/services/storages/user_token_storage.dart';
import 'package:get/get.dart';

enum ProfileWrapperState {
  login,
  register,
  profile,
  loading,
}

class ProfileWrapperController extends GetxController {
  final UserTokenStorage storage = UserTokenStorage();
  Rx<ProfileWrapperState> state = ProfileWrapperState.loading.obs;

  @override
  void onInit() {
    super.onInit();
    checkSignedInStatus();
  }

  void checkSignedInStatus() {
    storage.getCurrentUserToken().then((value) {
      if (value?.accessToken != null) {
        state.value = ProfileWrapperState.profile;
      } else {
        state.value = ProfileWrapperState.login;
      }
    });
  }

  void toggleLoginRegisterPage() {
    switch (state.value) {
      case ProfileWrapperState.login:
        state.value = ProfileWrapperState.register;
        break;
      case ProfileWrapperState.register:
        state.value = ProfileWrapperState.login;
        break;
      default:
    }
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
