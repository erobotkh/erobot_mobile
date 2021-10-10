import 'package:erobot/config/config_constant.dart';
import 'package:erobot/mixin/toast.dart';
import 'package:erobot/screens/accounts/local_widges/auth_header_widget.dart';
import 'package:erobot/screens/accounts/login_screen.dart';
import 'package:erobot/screens/accounts/profile_account.dart';
import 'package:erobot/services/authentication/auth_api.dart';
import 'package:erobot/widgets/er_main_action_bottun.dart';
import 'package:erobot/widgets/er_tap_effect.dart';
import 'package:erobot/widgets/er_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class RegisterScreen extends HookWidget with Toast {
  @override
  Widget build(BuildContext context) {
    ValueNotifier email = useState('');
    ValueNotifier password = useState('');
    ValueNotifier firstName = useState('');
    ValueNotifier lastName = useState('');
    ValueNotifier hidePassword = useState(true);
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
            AuthHeaderWidget(context: context),
            buildFormField(
              context: context,
              hidPassword: hidePassword.value,
              onHidePassword: () => hidePassword.value = !hidePassword.value,
              onChangeFirstName: (value) => firstName.value = value,
              onChangeLastName: (value) => lastName.value = value,
              onChangeEmail: (value) => email.value = value,
              onChangePassword: (value) => password.value = value,
            ),
            buildTextButton(
              context: context,
              label: 'Forget Password',
              alignment: Alignment.centerRight,
            ),
            ERMainActionButton(
              margin: EdgeInsets.all(ConfigConstant.margin2),
              label: 'Register',
              onTap: () async {
                AuthApi authApi = AuthApi();
                showLoading();
                await authApi.register(
                  firstName: firstName.value,
                  lastName: lastName.value,
                  email: email.value,
                  password: password.value,
                );
                hideLoading();
                if (authApi.success()) {
                  showSuccess(context: context, title: 'Log in successful');
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => ProfileScreen(),
                    ),
                  );
                } else
                  print(authApi.errorMessage());
              },
            ),
            buildTextButton(
              context: context,
              label: "Already have an account? Log in",
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => LoginScreen(),
                  ),
                );
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
      child: ERTapEffect(
        child: Text(label),
        onTap: onTap,
      ),
    );
  }

  Container buildFormField({
    required BuildContext context,
    bool hidPassword = true,
    void Function(String)? onChangeFirstName,
    void Function(String)? onChangeLastName,
    void Function(String)? onChangeEmail,
    void Function(String)? onChangePassword,
    void Function(String)? onChangeConfirmPassword,
    void Function()? onHidePassword,
  }) {
    return Container(
      padding: EdgeInsets.only(left: ConfigConstant.margin2, right: ConfigConstant.margin2),
      margin: EdgeInsets.only(bottom: ConfigConstant.margin1),
      child: Column(
        children: [
          ERTextField(
            labelText: 'First Name',
            onChange: onChangeFirstName,
          ),
          ERTextField(
            labelText: 'Last Name',
            onChange: onChangeLastName,
          ),
          ERTextField(
            labelText: 'Email',
            onChange: onChangeEmail,
          ),
          ERTextField(
            labelText: 'Password',
            password: true,
            hidePassword: hidPassword,
            onChange: onChangePassword,
            onHidePassword: onHidePassword,
          ),
          ERTextField(
            labelText: 'Confirm Password',
            password: true,
            hidePassword: hidPassword,
            onChange: onChangeConfirmPassword,
            onHidePassword: onHidePassword,
          ),
        ],
      ),
    );
  }
}
