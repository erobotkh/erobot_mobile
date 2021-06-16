import 'package:erobot/screens/accounts/login_screen.dart';
import 'package:erobot/screens/send_page/sender_screen.dart';
import 'package:flutter/material.dart';
import 'screens/home/home_screen.dart';

class AppRouter {
  static const String HOME = '/';
  static const String EDUCATION = '/educations';
  static const String ACCOUNT = '/account';

  static Map<String, Route<dynamic>> routeConfigs() {
    Map<String, Route<dynamic>> dataSets = {
      '$HOME': MaterialPageRoute(builder: (context) => HomeScreen()),
      '$EDUCATION': MaterialPageRoute(builder: (context) => EducationScreen()),
      '$ACCOUNT': MaterialPageRoute(builder: (context) => AccountScreen()),
    };
    return dataSets;
  }

  static Route<dynamic>? generateRoute(RouteSettings settings) {
    var name = safeName(settings.name ?? "");
    Map<String, Route<dynamic>> mappingRoutes = routeConfigs();
    return mappingRoutes[name];
  }

  static String safeName(String name) {
    Map<String, Route<dynamic>> mappingRoutes = routeConfigs();
    return mappingRoutes.containsKey(name) ? name : defaultRoute();
  }

  static String defaultRoute() {
    return HOME;
  }
}
