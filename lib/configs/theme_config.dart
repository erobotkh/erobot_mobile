import 'package:erobot_mobile/constants/config_constant.dart';
import 'package:erobot_mobile/constants/theme_constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ThemeConfig {
  final bool isDarkMode;
  ThemeConfig(this.isDarkMode);

  ThemeData get themeData {
    final scheme = isDarkMode ? ThemeConstant.darkScheme : ThemeConstant.lightScheme;
    return ThemeData(
      primaryColor: scheme.primary,
      scaffoldBackgroundColor: scheme.background,
      dividerColor: scheme.onBackground.withOpacity(0.25),
      splashColor: Colors.transparent,
      appBarTheme: AppBarTheme(
        backgroundColor: scheme.surface,
        centerTitle: false,
        elevation: 0.0,
        iconTheme: IconThemeData(color: scheme.onPrimary),
        titleTextStyle: ThemeConstant.textTheme.titleLarge?.copyWith(color: scheme.onPrimary),
        foregroundColor: scheme.onPrimary,
      ),
      iconTheme: IconThemeData(color: scheme.onBackground),
      // splashFactory:
      // InkRipple.splashFactory, //
      // InkSplash.splashFactory,
      indicatorColor: scheme.onPrimary,
      textTheme: ThemeConstant.textTheme.apply(
        bodyColor: scheme.onSurface,
        displayColor: scheme.onSurface.withOpacity(0.54),
        decorationColor: scheme.onSurface.withOpacity(0.54),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: scheme.onPrimary,
          backgroundColor: scheme.primary,
          disabledForegroundColor: scheme.onSurface.withOpacity(0.38),
        ),
      ),
      progressIndicatorTheme: ProgressIndicatorThemeData(color: scheme.onPrimary),
      dialogTheme: DialogTheme(
        backgroundColor: scheme.background,
        titleTextStyle: TextStyle(color: scheme.onBackground),
        contentTextStyle: TextStyle(color: scheme.onBackground),
      ),
      inputDecorationTheme: InputDecorationTheme(
        labelStyle: TextStyle(color: scheme.onBackground.withOpacity(0.5)),
        helperStyle: TextStyle(color: scheme.onBackground.withOpacity(0.5)),
        hintStyle: TextStyle(color: scheme.onBackground.withOpacity(0.5)),
        border: UnderlineInputBorder(
          borderRadius: ConfigConstant.circlarRadiusTop1,
          borderSide: BorderSide(
            color: scheme.onBackground,
            width: 2,
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderRadius: ConfigConstant.circlarRadiusTop1,
          borderSide: BorderSide(
            color: scheme.primary,
            width: 2,
          ),
        ),
      ),
      cupertinoOverrideTheme: CupertinoThemeData(
        textTheme: CupertinoTextThemeData(),
      ),
      colorScheme: scheme.copyWith(background: scheme.background),
    );
  }
}
