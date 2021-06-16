import 'package:flutter/material.dart';

class DontHaveAcc extends StatelessWidget {
  final String name;
  final String onTap;

  const DontHaveAcc({Key? key, required this.name, required this.onTap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    return Center(
      child: InkWell(
        onTap: () {
          // onTap;
        },
        child: Text(name, style: _theme.textTheme.caption?.copyWith(color: _theme.colorScheme.secondaryVariant)),
      ),
    );
  }
}
