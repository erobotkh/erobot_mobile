import 'package:erobot/app_router.dart';
import 'package:erobot/config/tab_bar_config_item.dart';
import 'package:erobot/screens/accounts/login_screen.dart';
import 'package:erobot/screens/education/edu_screen.dart';
import 'package:erobot/screens/home/home_screen.dart';
import 'package:flutter/material.dart';


class TabBarConfig {
  static List<TabBarConfigItem> items = [
    TabBarConfigItem(
      title: 'Home',
      icon: Icons.games,
      path: AppRouter.HOME,
      screen: HomeScreen(),
      key: GlobalKey<NavigatorState>(),
      activeIcon: Icons.games,
    ),
    TabBarConfigItem(
      title: 'Educations',
      icon: Icons.school,
      path: AppRouter.EDUCATION,
      screen: EduScreen(),
      key: GlobalKey<NavigatorState>(),
      activeIcon: Icons.school,
    ),
    TabBarConfigItem(
      title: 'Account',
      icon: Icons.account_circle,
      path: AppRouter.ACCOUNT,
      screen: AccountScreen(),
      key: GlobalKey<NavigatorState>(),
      activeIcon: Icons.account_circle,
    ),
  ];

  static Widget screenAt(int index) {
    return TabBarConfig.items[index].screen;
  }

  static GlobalKey<NavigatorState> navigationKeyAt(int index) {
    return TabBarConfig.items[index].key;
  }

  static List<BottomNavigationBarItem> bottomNavigationBarItems() {
    return List.generate(items.length, (index) {
      return BottomNavigationBarItem(
        label: items[index].title,
        icon: Icon(items[index].icon),
        activeIcon: Icon(
          items[index].activeIcon,
        ),
      );
    });
  }

  static List<Widget> navigationScreens([int selectedIndex = 0]) {
    return TabBarConfig.items.map((e) {
      Widget item = Navigator(
        key: e.key,
        onGenerateRoute: (routeSettings) {
          return MaterialPageRoute(
            builder: (context) => e.screen,
          );
        },
      );
      return item;
    }).toList();
  }
}
