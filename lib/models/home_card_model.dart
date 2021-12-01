import 'package:erobot_mobile/app/modules/ball_shooter/views/ball_shooter_view.dart';
import 'package:erobot_mobile/app/modules/ir_remoter/views/ir_remoter_view.dart';
import 'package:erobot_mobile/app/modules/member/views/member_view.dart';
import 'package:erobot_mobile/app/modules/reputation/views/reputation_view.dart';
import 'package:erobot_mobile/app/modules/sender/views/sender_view.dart';
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

  static getCards() => [
    HomeCardModel(
      title: 'Sender',
      subTitle: 'Send string to arduino robot via Bluetooth',
      icon: Icons.keyboard,
      background: ThemeConstant.greenGradient,
      isSmall: false,
      route: Routes.SENDER,
    ),
    HomeCardModel(
      title: 'Ball Shooter',
      subTitle: 'Servo, Speed, Shoot',
      icon: Icons.gps_fixed,
      background: ThemeConstant.orangeGradient,
      route: Routes.BALL_SHOOTER,
    ),
    HomeCardModel(
      title: 'IR Remoter',
      subTitle: 'Vitual IR Remoter',
      icon: Icons.settings_remote,
      background: ThemeConstant.redGradient,
      isSmall: false,
      route: Routes.IR_REMOTER,
    ),
    HomeCardModel(
      title: 'Arduino Car',
      subTitle: 'Servo & Speed',
      icon: Icons.gamepad,
      background: ThemeConstant.blueGradient,
      route: Routes.IR_REMOTER,
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