import 'dart:core';
import 'package:erobot/constant/theme_constant.dart';
import 'package:flutter/material.dart';

class ErAlertDailog extends StatelessWidget {
  final String title;
  final Widget? content;
  final String back;
  final String continuee;
  final VoidCallback? onPressedBack;
  final VoidCallback? onPressedContinue;

  const ErAlertDailog({
    Key? key,
    required this.title,
    required this.content,
    required this.back,
    required this.continuee,
    required this.onPressedBack,
    required this.onPressedContinue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        title,
        textAlign: TextAlign.center,
        style: ThemeConstant.textTheme.headline6?.copyWith(
          color: ThemeConstant.lightScheme.onSurface,
        ),
      ),
      content: content,
      actions: [
        FlatButton(
          onPressed: onPressedBack,
          child: Text(
            back,
            style: ThemeConstant.textTheme.button?.copyWith(
              color: ThemeConstant.lightScheme.onSurface,
            ),
          ),
        ),
        FlatButton(
          onPressed: onPressedContinue,
          child: Text(
            continuee,
            style: ThemeConstant.textTheme.button?.copyWith(
              color: ThemeConstant.lightScheme.onSurface,
            ),
          ),
        ),
      ],
      elevation: 0.0,
      backgroundColor: ThemeConstant.lightScheme.surface,
    );
  }
}
