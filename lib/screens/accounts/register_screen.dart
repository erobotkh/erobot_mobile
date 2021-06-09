import 'package:erobot/config/config_constant.dart';
import 'package:erobot/screens/accounts/local_widgets/e_dont_have_acc.dart';
import 'package:erobot/widgets/e_bottun.dart';
import 'package:erobot/screens/accounts/local_widgets/e_textfield_text.dart';
import 'package:erobot/screens/accounts/local_widgets/e_erobot.dart';
import 'package:erobot/screens/accounts/local_widgets/e_textfield_password.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
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
        'Register',
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
              Container(
                padding: EdgeInsets.only(
                    left: ConfigConstant.margin2,
                    right: ConfigConstant.margin2),
                child: Column(
                  children: [
                    Email(name: 'Full name'),
                    Email(name: 'Phone Number'),
                    Email(name: 'Email'),
                    Password(name: 'Password'),
                    Password(name: 'Confirm Password'),
                  ],
                ),
              ),
              ButtonLogin(
                name: 'REGISTER',
                onTap: () {},
              ),
              DontHaveAcc(name: 'Already have an account? Login', onTap: ''),
            ],
          ),
        )
      ],
    );
  }
}
