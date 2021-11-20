import 'package:erobot_mobile/app/data/mixins/toast.dart';
import 'package:erobot_mobile/app/data/widgets/er_email_field.dart';
import 'package:erobot_mobile/app/data/widgets/er_main_action_button.dart';
import 'package:erobot_mobile/app/data/widgets/er_password_field.dart';
import 'package:erobot_mobile/app/data/widgets/er_tap_effect.dart';
import 'package:erobot_mobile/app/data/widgets/er_text_field.dart';
import 'package:erobot_mobile/app/modules/login/local_widgets/auth_header.dart';
import 'package:erobot_mobile/app/modules/profile_wrapper/controllers/profile_wrapper_controller.dart';
import 'package:erobot_mobile/constants/config_constant.dart';
import 'package:erobot_mobile/services/base_apis/auth_api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> with Toast {
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => RegisterController());
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: false,
        backgroundColor: Theme.of(context).colorScheme.surface,
        title: Text(
          'Register',
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            AuthHeaderWidget(),
            buildFormField(context: context),
            ErMainActionButton(
              margin: EdgeInsets.all(ConfigConstant.margin2),
              label: 'Register',
              onTap: () async {
                AuthApi authApi = AuthApi();
                await showLoading(
                  () => authApi.registerWithEmail(
                    firstName: controller.firstName.value,
                    lastName: controller.lastName.value,
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
              label: "Already have an account? Log in",
              onTap: () {
                Get.find<ProfileWrapperController>().toggleLoginRegisterPage();
              },
            ),
          ],
        ),
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

  Container buildFormField({required BuildContext context}) {
    return Container(
      padding: EdgeInsets.only(left: ConfigConstant.margin2, right: ConfigConstant.margin2),
      margin: EdgeInsets.only(bottom: ConfigConstant.margin1),
      child: Column(
        children: [
          ErTextField(
            labelText: 'First Name',
            onChanged: (value) {
              controller.firstName.value = value;
            },
          ),
          ErTextField(
            labelText: 'Last Name',
            onChanged: (value) {
              controller.lastName.value = value;
            },
          ),
          ErEmailField(
            onChanged: (value) {
              controller.email.value = value;
            },
          ),
          ErPasswordField(
            onChanged: (value) {
              controller.password.value = value;
            },
          ),
        ],
      ),
    );
  }
}
