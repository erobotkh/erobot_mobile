import 'package:erobot/screens/app_bar_main_screen.dart';
import 'package:flutter/material.dart';
import 'constant/theme_constant.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AppBarMainScreen(),
      theme: ThemeConstant.theme,
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: child ?? const SizedBox(),
        );
      },
    );
  }
}
