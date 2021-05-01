import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    ProviderScope(
      child: App(),
    )
  );
}

// class AppLocalization extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return EasyLocalization(
//       startLocale: Locale("km"),
//       supportedLocales: [
//         Locale('en'),
//         Locale('km'),
//       ],
//       path: "assets/translations",
//       useOnlyLangCode: true,
//       fallbackLocale: Locale('en'),
//       child: App(),
//     );
//   }
// }