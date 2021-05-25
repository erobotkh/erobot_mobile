import 'package:flutter/material.dart';

class Email extends StatelessWidget {
  final String name;

  const Email({Key? key, required this.name}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    return Container(
      height: 56,
      child: TextField(
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          hintStyle: _theme.textTheme.bodyText1
              ?.copyWith(color: _theme.colorScheme.onSurface),
          labelText: name,
          labelStyle: _theme.textTheme.caption
              ?.copyWith(color: _theme.colorScheme.secondary),
        ),
      ),
    );
  }
}
