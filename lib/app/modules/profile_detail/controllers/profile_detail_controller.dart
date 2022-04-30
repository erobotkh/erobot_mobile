import 'package:erobot_mobile/mixins/loading.dart';
import 'package:erobot_mobile/models/user_model.dart';
import 'package:erobot_mobile/services/apis/user_api.dart';
import 'package:get/get.dart';

class ProfileDetailController extends GetxController with Loading {
  Rx<UserModel>? user;

  getProfile() async {
    UserApi api = UserApi();
    user = UserModel().obs;

    showLoading();
    await api.fetchOne().then((value) {
      user?.value = value;
    });
    hideLoading();

    update();
  }

  @override
  void onInit() {
    super.onInit();
    getProfile();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
