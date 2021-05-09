import 'package:erobot/widgets/BottunLogin.dart';
import 'package:erobot/widgets/Email.dart';
import 'package:erobot/widgets/Erobot.dart';
import 'package:erobot/widgets/ForgetPasword.dart';
import 'package:erobot/widgets/Password.dart';
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
        'Account',
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
                  text: 'Sign in with your email & password provide by Erobot',
                  name: 'Erobot'),
              Email(text: 'test@gmail.com', name: 'Email'),
              Password(text: '*******', name: 'Password'),
              BottunLogin(name: 'LOGIN'),
              ForgetPassword(name: 'Forget Password?'),
            ],
          ),
        )
      ],
    );
  }
}
