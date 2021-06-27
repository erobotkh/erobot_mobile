import 'package:flutter/material.dart';

class ThemeConstant {
  static ThemeData theme = ThemeData(
    colorScheme: lightScheme,
    textTheme: textTheme,
    scaffoldBackgroundColor: lightScheme.background,
    appBarTheme: AppBarTheme(
      elevation: 0.5,
      centerTitle: false,
      color: lightScheme.surface,
      brightness: Brightness.dark,
      actionsIconTheme: IconThemeData(
        color: lightScheme.onSurface,
      ),
      textTheme: textTheme.copyWith(
        headline6: textTheme.headline6,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: UnderlineInputBorder(borderSide: BorderSide(color: lightScheme.secondary)),
      focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: lightScheme.secondary)),
    ),
  );

  static const Gradient greenGradient = LinearGradient(
    colors: [
      Color(0xFF4CAF50),
      Color(0xFF388E3C),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const Gradient orangeGradient = LinearGradient(
    colors: [
      Color(0xFFFF9800),
      Color(0xFFF57C00),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const Gradient blueGradient = LinearGradient(
    colors: [
      Color(0xFF2196F3),
      Color(0xFF1976D2),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const Gradient redGradient = LinearGradient(
    colors: [
      Color(0xFFF44336),
      Color(0xFFD32F2F),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const Gradient purpleGradient = LinearGradient(
    colors: [
      Color(0xFF9C27B0),
      Color(0xFF7B1FA2),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const Gradient greyGradient = LinearGradient(
    colors: [
      Color(0xFF607D8B),
      Color(0xFF455A64),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const ColorScheme lightScheme = ColorScheme(
    primary: Color(0xFFD30101),
    primaryVariant: Color(0xFF990000),
    secondary: Color(0xFF8B9299),
    secondaryVariant: Color(0xFFBFBFBF),
    background: Color(0xFF161F28),
    surface: Color(0xFF172634),
    error: Color(0xFFB00020),
    onPrimary: Color(0xFFFFFFFF),
    onSecondary: Color(0xFF000000),
    onBackground: Color(0xFF000000),
    onSurface: Color(0xFFFFFFFF),
    onError: Color(0xFFFFFFFF),
    brightness: Brightness.light,
  );

  static TextTheme get textTheme => TextTheme(
        headline1: TextStyle(
          fontSize: 95,
          fontWeight: FontWeight.w300,
          letterSpacing: -1.5,
          fontFamily: 'OpenSans',
        ),
        headline2: TextStyle(
          fontSize: 59,
          fontWeight: FontWeight.w300,
          letterSpacing: -0.5,
          fontFamily: 'OpenSans',
        ),
        headline3: TextStyle(
          fontSize: 48,
          fontWeight: FontWeight.w400,
          fontFamily: 'OpenSans',
        ),
        headline4: TextStyle(
          fontSize: 34,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.25,
          fontFamily: 'OpenSans',
        ),
        headline5: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w400,
          fontFamily: 'OpenSans',
        ),
        headline6: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.15,
          fontFamily: 'OpenSans',
        ),
        subtitle1: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.15,
          fontFamily: 'OpenSans',
        ),
        subtitle2: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.1,
          fontFamily: 'OpenSans',
        ),
        bodyText1: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.5,
          fontFamily: 'OpenSans',
        ),
        bodyText2: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.25,
          fontFamily: 'OpenSans',
        ),
        button: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          letterSpacing: 1.25,
          fontFamily: 'OpenSans',
        ),
        caption: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.4,
          fontFamily: 'OpenSans',
        ),
        overline: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w400,
          letterSpacing: 1.5,
          fontFamily: 'OpenSans',
        ),
      ).apply(
        displayColor: lightScheme.onSurface,
        bodyColor: lightScheme.onSurface,
        decorationColor: lightScheme.onSurface,
      );
}
