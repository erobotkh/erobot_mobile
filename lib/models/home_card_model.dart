import 'package:erobot/constant/theme_constant.dart';
import 'package:flutter/material.dart';

class HomeCardModel {
  String title;
  String subTitle;
  IconData? icon;
  Gradient? background;
  bool isSmall;
  Function()? onTap;

  HomeCardModel({
    this.title = '',
    this.subTitle = '',
    this.icon,
    this.background,
    this.isSmall = true,
    this.onTap,
  });

  static getCards() => [
        HomeCardModel(
          title: 'Sender',
          subTitle: 'Send string to arduino robot via Bluetooth',
          icon: Icons.keyboard,
          background: ThemeConstant.greenGradient,
          isSmall: false,
        ),
        HomeCardModel(
          title: 'Ball Shooter',
          subTitle: 'Servo, Speed, Shoot',
          icon: Icons.gps_fixed,
          background: ThemeConstant.orangeGradient,
        ),
        HomeCardModel(
          title: 'IR Remoter',
          subTitle: 'Vitual IR Remoter',
          icon: Icons.settings_remote,
          background: ThemeConstant.redGradient,
          isSmall: false,
        ),
        HomeCardModel(
          title: 'Arduino Car',
          subTitle: 'Servo & Speed',
          icon: Icons.gamepad,
          background: ThemeConstant.blueGradient,
        ),
        HomeCardModel(
          title: 'Erobot’s Member',
          subTitle: 'See all our memberand info',
          icon: Icons.people,
          background: ThemeConstant.purpleGradient,
        ),
        HomeCardModel(
          title: 'Our reputation',
          subTitle: 'Upcoming event infoand more',
          icon: Icons.stars,
          background: ThemeConstant.greenGradient,
        ),
      ];
}
