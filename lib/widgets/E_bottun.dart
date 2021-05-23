import 'package:erobot/config/config_constant.dart';
import 'package:erobot/constant/theme_constant.dart';
import 'package:flutter/material.dart';

class BottunLogin extends StatelessWidget {
  final String name;
  final String onTap;

  const BottunLogin({Key? key, required this.name, required this.onTap})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(16),
      child: AspectRatio(
        aspectRatio: 343 / 48,
        child: InkWell(
          onTap: () {
            onTap;
          },
          child: Container(
            decoration: BoxDecoration(
              gradient: ThemeConstant.redGradient,
              border: Border.all(
                  color: _theme.colorScheme.onPrimary.withOpacity(0.3)),
              borderRadius: BorderRadius.circular(ConfigConstant.radius1),
            ),
            child: Center(
              child: Text(
                name,
                style: _theme.textTheme.button,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
