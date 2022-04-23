import 'package:bot_toast/bot_toast.dart';
import 'package:erobot_mobile/configs/theme_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/routes/app_pages.dart';

class App extends StatelessWidget {
  const App({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final botToastBuilder = BotToastInit();
    return GetMaterialApp(
      title: "Application",
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.WRAPPER,
      getPages: AppPages.routes,
      theme: ThemeConfig(false).themeData,
      builder: (context, child) {
        child = botToastBuilder(context, child);
        return GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: child,
        );
      },
      navigatorObservers: [BotToastNavigatorObserver()],
    );
  }
}
