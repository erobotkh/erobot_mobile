import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import 'constant/theme_constant.dart';
import 'screens/home.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // locale: context.locale,
      // localizationsDelegates: context.localizationDelegates,
      // supportedLocales: context.supportedLocales,
      home: HomePage(),
      theme: ThemeConstant.theme,
      debugShowCheckedModeBanner: false,
    );
  }
}