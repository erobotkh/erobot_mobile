import 'package:erobot/config/config_constant.dart';
import 'package:erobot/constant/theme_constant.dart';
import 'package:erobot/mixin/toast.dart';
import 'package:erobot/services/authentication/auth_api.dart';
import 'package:erobot/widgets/er_main_action_bottun.dart';
import 'package:erobot/widgets/er_tap_effect.dart';
import 'package:erobot/widgets/er_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class LoginScreen extends HookWidget with Toast {
  @override
  Widget build(BuildContext context) {
    ValueNotifier email = useState('');
    ValueNotifier password = useState('');
    ValueNotifier hidePassword = useState(true);
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Theme.of(context).colorScheme.surface,
        title: Text(
          'Login',
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
      body: Column(
        children: [
          buildLogInHeader(context),
          buildFormField(
            context: context,
            hidPassword: hidePassword.value,
            onHidePassword: () => hidePassword.value = !hidePassword.value,
            onChangeEmail: (value) {
              email.value = value;
            },
            onChangePassword: (value) {
              password.value = value;
            },
          ),
          buildTextButton(
            context: context,
            label: 'Forget Password',
            alignment: Alignment.centerRight,
          ),
          ERMainActionButton(
            margin: EdgeInsets.all(ConfigConstant.margin2),
            label: 'Log In',
            onTap: () async {
              AuthApi authApi = AuthApi();
              showLoading();
              await authApi.exec(
                email: email.value,
                password: password.value,
              );
              hideLoading();
              if (authApi.success())
                showSuccess(context: context, title: 'Log in successful');
              else
                print(authApi.errorMessage());
            },
          ),
          buildTextButton(
            context: context,
            label: "Don't have account yet? Register",
          ),
        ],
      ),
    );
  }

  Widget buildTextButton({
    required BuildContext context,
    required String label,
    AlignmentGeometry? alignment,
  }) {
    return Container(
      margin: EdgeInsets.only(right: ConfigConstant.margin2),
      width: double.infinity,
      alignment: alignment ?? Alignment.center,
      child: ERTapEffect(
        child: Text(label),
        onTap: () {},
      ),
    );
  }

  Container buildFormField({
    required BuildContext context,
    bool hidPassword = true,
    void Function(String)? onChangeEmail,
    void Function(String)? onChangePassword,
    void Function()? onHidePassword,
  }) {
    return Container(
      padding: EdgeInsets.only(left: ConfigConstant.margin2, right: ConfigConstant.margin2),
      margin: EdgeInsets.only(bottom: ConfigConstant.margin1),
      child: Column(
        children: [
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
        ],
      ),
    );
  }

  AspectRatio buildLogInHeader(BuildContext context) {
    ThemeData _theme = Theme.of(context);
    return AspectRatio(
      aspectRatio: 375 / 96,
      child: Container(
        padding: const EdgeInsets.only(right: 40, top: 10),
        decoration: BoxDecoration(
          gradient: ThemeConstant.redGradient,
        ),
        child: ListTile(
          title: Text(
            'Erobot Member',
            style: _theme.textTheme.bodyText1,
          ),
          subtitle: Text(
            'Member will have access privilege to see post, oportunity, and team reputation.',
            style: _theme.textTheme.caption?.copyWith(
              color: _theme.colorScheme.onPrimary.withOpacity(0.5),
            ),
          ),
          trailing: Icon(
            Icons.people,
            color: _theme.colorScheme.onPrimary,
            size: 72,
          ),
        ),
      ),
    );
  }
}
