import 'package:erobot/screens/accounts/local_widgets/E_DontHaveAcc.dart';
import 'package:erobot/widgets/E_bottun.dart';
import 'package:erobot/screens/accounts/local_widgets/E_Email.dart';
import 'package:erobot/screens/accounts/local_widgets/E_Erobot.dart';
import 'package:erobot/screens/accounts/local_widgets/E_ForgetPasword.dart';
import 'package:erobot/screens/accounts/local_widgets/E_Password.dart';
import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    return Scaffold(
      backgroundColor: _theme.colorScheme.background,
      appBar: _buildAppBar(_theme, context),
      body: _buildBody(_theme, context),
    );
  }

  _buildAppBar(ThemeData _theme, BuildContext context) {
    return AppBar(
      centerTitle: false,
      backgroundColor: _theme.colorScheme.surface,
      title: Text(
        'Login',
        style: _theme.textTheme.headline6,
      ),
    );
  }

  _buildBody(ThemeData _theme, BuildContext context) {
    return ListView(
      children: [
        Container(
          child: Column(
            children: [
              Erobot(
                  text:
                      'Member will have access privilege to see post, oportunity, and team reputation.',
                  name: 'Erobot Member'),
              Email(text: 'test@gmail.com', name: 'Email'),
              Password(text: '*******', name: 'Password'),
              ForgetPassword(
                name: 'Forget Password?',
                onTap: '',
              ),
              BottunLogin(
                name: 'LOGIN',
                onTap: '',
              ),
              DontHaveAcc(name: 'Didn’t have account yet? Register', onTap: ''),
            ],
          ),
        )
      ],
    );
  }
}
