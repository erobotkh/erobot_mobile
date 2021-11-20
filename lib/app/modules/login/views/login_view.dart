import 'package:erobot_mobile/app/data/mixins/toast.dart';
import 'package:erobot_mobile/app/data/widgets/er_email_field.dart';
import 'package:erobot_mobile/app/data/widgets/er_main_action_button.dart';
import 'package:erobot_mobile/app/data/widgets/er_password_field.dart';
import 'package:erobot_mobile/app/data/widgets/er_tap_effect.dart';
import 'package:erobot_mobile/app/modules/login/local_widgets/auth_header.dart';
import 'package:erobot_mobile/app/modules/profile_wrapper/controllers/profile_wrapper_controller.dart';
import 'package:erobot_mobile/constants/config_constant.dart';
import 'package:erobot_mobile/services/base_apis/auth_api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> with Toast {
  @override
  Widget build(BuildContext context) {
    Get.put(LoginController());
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Theme.of(context).colorScheme.surface,
        title: Text(
          'Login',
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
      body: ListView(
        children: [
          AuthHeaderWidget(),
          buildFormField(
            context: context,
            onChangeEmail: (value) {
              controller.email.value = value;
            },
            onChangePassword: (value) {
              controller.password.value = value;
            },
          ),
          buildTextButton(
            context: context,
            label: 'Forget Password',
            alignment: Alignment.centerRight,
          ),
          ErMainActionButton(
            margin: EdgeInsets.all(ConfigConstant.margin2),
            label: 'Log In',
            onTap: () async {
              AuthApi authApi = AuthApi();
              await showLoading(
                () => authApi.loginWithEmail(
                  email: controller.email.value,
                  password: controller.password.value,
                ),
              );
              if (authApi.success()) {
                showSuccess(context: context, title: 'Log in successful');
                Get.find<ProfileWrapperController>().checkSignedInStatus();
              } else {
                print(authApi.message());
              }
            },
          ),
          buildTextButton(
            context: context,
            label: "Don't have account yet? Register",
            onTap: () {
              Get.find<ProfileWrapperController>().toggleLoginRegisterPage();
            },
          ),
        ],
      ),
    );
  }

  Widget buildTextButton({
    required BuildContext context,
    required String label,
    AlignmentGeometry? alignment,
    void Function()? onTap,
  }) {
    return Container(
      margin: EdgeInsets.only(right: ConfigConstant.margin2),
      width: double.infinity,
      alignment: alignment ?? Alignment.center,
      child: ErTapEffect(
        child: Text(label),
        onTap: onTap,
      ),
    );
  }

  Container buildFormField({
    required BuildContext context,
    void Function(String)? onChangeEmail,
    void Function(String)? onChangePassword,
    void Function()? onHidePassword,
  }) {
    return Container(
      padding: EdgeInsets.only(left: ConfigConstant.margin2, right: ConfigConstant.margin2),
      margin: EdgeInsets.only(bottom: ConfigConstant.margin1),
      child: Column(
        children: [
          ErEmailField(
            onChanged: onChangeEmail,
          ),
          ErPasswordField(
            onChanged: onChangePassword,
          ),
        ],
      ),
    );
  }
}
