import 'package:erobot_mobile/app/routes/app_pages.dart';
import 'package:erobot_mobile/constants/theme_constant.dart';
import 'package:flutter/material.dart';

class HomeCardModel {
  String title;
  String subTitle;
  IconData? icon;
  Gradient? background;
  bool isSmall;
  String route;

  HomeCardModel({
    this.title = '',
    this.subTitle = '',
    this.icon,
    this.background,
    this.isSmall = true,
    required this.route,
  });

  static List<HomeCardModel> card() {
    return [
      HomeCardModel(
        title: 'Sender',
        subTitle: 'Send string to arduino robot via Bluetooth',
        icon: Icons.keyboard,
        background: ThemeConstant.greenGradient,
        isSmall: false,
        route: Routes.SENDER,
      ),
      HomeCardModel(
        title: 'Joystick',
        subTitle: 'Servo, Speed, Shoot',
        icon: Icons.gps_fixed,
        background: ThemeConstant.redGradient,
        route: Routes.JOYSTICK,
      ),
      HomeCardModel(
        title: 'IR Remoter',
        subTitle: 'Vitual IR Remoter',
        icon: Icons.settings_remote,
        background: ThemeConstant.orangeGradient,
        isSmall: false,
        route: Routes.IR_REMOTER,
      ),
      HomeCardModel(
        title: 'Thumbstick',
        subTitle: 'Servo & Speed',
        icon: Icons.gamepad,
        background: ThemeConstant.blueGradient,
        route: Routes.THUMBSTICK,
      ),
      HomeCardModel(
        title: 'Erobot’s Member',
        subTitle: 'See all our memberand info',
        icon: Icons.people,
        background: ThemeConstant.purpleGradient,
        route: Routes.MEMBER,
      ),
      HomeCardModel(
        title: 'Our reputation',
        subTitle: 'Upcoming event infoand more',
        icon: Icons.stars,
        background: ThemeConstant.greenGradient,
        route: Routes.REPUTATION,
      ),
    ];
  }
}
