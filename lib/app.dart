import 'package:erobot/screens/app_bar_main_screen.dart';
import 'package:flutter/material.dart';

import 'constant/theme_constant.dart';
import 'screens/landing_screen.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:
          // LandingScreen()
          AppBarMainScreen()
          ,
      theme: ThemeConstant.theme,
      debugShowCheckedModeBanner: false,
    );
  }
}
