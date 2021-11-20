import 'package:erobot_mobile/app/data/widgets/er_loading.dart';
import 'package:erobot_mobile/app/modules/login/views/login_view.dart';
import 'package:erobot_mobile/app/modules/profile_detail/views/profile_detail_view.dart';
import 'package:erobot_mobile/app/modules/profile_wrapper/controllers/profile_wrapper_controller.dart';
import 'package:erobot_mobile/app/modules/register/views/register_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileWrapperView extends GetView<ProfileWrapperController> {
  @override
  Widget build(BuildContext context) {
    Get.put(ProfileWrapperController());
    return Obx(() {
      switch (controller.state.value) {
        case ProfileWrapperState.login:
          return LoginView();
        case ProfileWrapperState.register:
          return RegisterView();
        case ProfileWrapperState.profile:
          return ProfileDetailView();
        case ProfileWrapperState.loading:
          return buildLoading();
      }
    });
  }

  Scaffold buildLoading() {
    return Scaffold(
      body: Center(
        child: ERLoading(),
      ),
    );
  }
}
