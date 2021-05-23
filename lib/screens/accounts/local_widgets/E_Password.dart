import 'package:flutter/material.dart';

class Password extends StatefulWidget {
  final String text;
  final String name;

  const Password({Key? key, required this.text, required this.name})
      : super(key: key);

  @override
  _PasswordState createState() => _PasswordState();
}

class _PasswordState extends State<Password> {
  bool _hide = true;
  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.all(16),
      child: TextField(
        obscureText: _hide,
        autocorrect: true,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          // hintText: text,
          hintStyle: _theme.textTheme.bodyText1
              ?.copyWith(color: _theme.colorScheme.onSurface),
          labelText: widget.name,
          labelStyle: _theme.textTheme.caption
              ?.copyWith(color: _theme.colorScheme.secondary),
          suffixIcon: IconButton(
            icon: Icon(
              _hide ? Icons.visibility : Icons.visibility_off_rounded,
              color: _theme.colorScheme.onPrimary.withOpacity(0.5),
              size: 20,
            ),
            onPressed: () {
              setState(() {
                _hide = !_hide;
              });
            },
          ),
        ),
      ),
    );
  }
}
