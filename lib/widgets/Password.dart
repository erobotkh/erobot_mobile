import 'package:flutter/material.dart';

class Password extends StatelessWidget {
  final String text;
  final String name;

  const Password({Key? key, required this.text, required this.name})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    bool _hide = true;
    final _theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.all(16),
      child: TextField(
        obscureText: _hide,
        autocorrect: true,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          // hintText: text,
          hintStyle: _theme.textTheme.bodyText1,
          labelText: name,
          labelStyle: _theme.textTheme.caption,
        ),
      ),
    );
  }
}
