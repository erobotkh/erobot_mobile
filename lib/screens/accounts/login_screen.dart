import 'package:erobot/config/config_constant.dart';
import 'package:erobot/constant/theme_constant.dart';
import 'package:erobot/widgets/e_bottun.dart';
import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
          buildFormField(context),
          Container(
            padding: EdgeInsets.only(right: ConfigConstant.margin2),
            alignment: Alignment.centerRight,
            child: buildTextButton(context, 'Forget Password'),
          ),
          ButtonLogin(
            name: 'LOGIN',
            onTap: () {},
          ),
          buildTextButton(context, "Don't have account yet? Register"),
        ],
      ),
    );
  }

  InkWell buildTextButton(BuildContext context, String label) {
    return InkWell(
      onTap: () {},
      child: Text(
        label,
        style: Theme.of(context).textTheme.caption,
      ),
    );
  }

  Container buildFormField(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: ConfigConstant.margin2, right: ConfigConstant.margin2),
      margin: EdgeInsets.only(bottom: ConfigConstant.margin1),
      child: Column(
        children: [
          TextField(
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              hintStyle: Theme.of(context).textTheme.bodyText1,
              labelText: 'Email',
              labelStyle: Theme.of(context).textTheme.caption,
            ),
          ),
          TextField(
            obscureText: false,
            autocorrect: true,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              hintStyle: Theme.of(context).textTheme.bodyText1,
              labelText: 'Password',
              labelStyle: Theme.of(context).textTheme.caption,
              suffixIcon: IconButton(
                icon: Icon(
                  true ? Icons.visibility : Icons.visibility_off_rounded,
                  color: Theme.of(context).colorScheme.onPrimary.withOpacity(0.5),
                  size: 20,
                ),
                onPressed: () {},
              ),
            ),
          )
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
          trailing: IconButton(
            icon: Icon(
              Icons.people,
              color: _theme.colorScheme.onPrimary,
              size: 72,
            ),
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}
