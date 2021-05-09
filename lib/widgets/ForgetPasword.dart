import 'package:flutter/material.dart';

class ForgetPassword extends StatelessWidget {
  final String name;

  const ForgetPassword({Key? key, required this.name}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    return Center(
      child: Text(
        name,
        style: _theme.textTheme.caption,
      ),
    );
  }
}
