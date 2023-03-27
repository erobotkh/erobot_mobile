import 'package:erobot_mobile/constants/theme_constant.dart';
import 'package:flutter/material.dart';

class AuthHeaderWidget extends StatelessWidget {
  const AuthHeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            style: _theme.textTheme.bodyLarge,
          ),
          subtitle: Text(
            'Member will have access privilege to see post, oportunity, and team reputation.',
            style: _theme.textTheme.bodySmall?.copyWith(
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
