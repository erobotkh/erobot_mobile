import 'package:erobot_mobile/app/modules/education/views/education_view.dart';
import 'package:erobot_mobile/app/modules/home/views/home_view.dart';
import 'package:erobot_mobile/app/modules/profile_wrapper/views/profile_wrapper_view.dart';
import 'package:erobot_mobile/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

class TabBarConfig {
  static List<TabBarConfigItem> items = [
    TabBarConfigItem(
      title: 'Home',
      icon: Icons.games,
      path: Routes.HOME,
      screen: HomeView(),
      key: GlobalKey<NavigatorState>(),
      activeIcon: Icons.games,
    ),
    TabBarConfigItem(
      title: 'Educations',
      icon: Icons.school,
      path: Routes.EDUCATION,
      screen: EducationView(),
      key: GlobalKey<NavigatorState>(),
      activeIcon: Icons.school,
    ),
    TabBarConfigItem(
      title: 'Account',
      icon: Icons.account_circle,
      path: Routes.PROFILE_WRAPPER,
      screen: ProfileWrapperView(),
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

class TabBarConfigItem {
  String title;
  IconData icon;
  IconData activeIcon;
  String path;
  Widget screen;
  GlobalKey<NavigatorState> key;

  TabBarConfigItem({
    required this.title,
    required this.icon,
    required this.path,
    required this.screen,
    required this.key,
    required this.activeIcon,
  });
}
