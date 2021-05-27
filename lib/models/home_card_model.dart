import 'package:erobot/constant/theme_constant.dart';
import 'package:erobot/screens/home/arduino_car_screen.dart';
import 'package:erobot/screens/home/ball_shooter/ballshooter_screen.dart';
import 'package:erobot/screens/home/ir_remoter_screen.dart';
import 'package:erobot/screens/home/members_screen.dart';
import 'package:erobot/screens/home/reputations_screen.dart';
import 'package:erobot/screens/home/sender_screen.dart';
import 'package:flutter/material.dart';

class HomeCardModel {
  String title;
  String subTitle;
  IconData? icon;
  Gradient? background;
  bool isSmall;
  Widget screen;

  HomeCardModel({
    this.title = '',
    this.subTitle = '',
    this.icon,
    this.background,
    this.isSmall = true,
    required this.screen,
  });

  static getCards() => [
        HomeCardModel(
          title: 'Sender',
          subTitle: 'Send string to arduino robot via Bluetooth',
          icon: Icons.keyboard,
          background: ThemeConstant.greenGradient,
          isSmall: false,
          screen: SenderScreen(),
        ),
        HomeCardModel(
          title: 'Ball Shooter',
          subTitle: 'Servo, Speed, Shoot',
          icon: Icons.gps_fixed,
          background: ThemeConstant.orangeGradient,
          screen: BallShooterScreen(),
        ),
        HomeCardModel(
          title: 'IR Remoter',
          subTitle: 'Vitual IR Remoter',
          icon: Icons.settings_remote,
          background: ThemeConstant.redGradient,
          isSmall: false,
          screen: IRRemoterScreen(),
        ),
        HomeCardModel(
          title: 'Arduino Car',
          subTitle: 'Servo & Speed',
          icon: Icons.gamepad,
          background: ThemeConstant.blueGradient,
          screen: ArduinoCarScreen(),
        ),
        HomeCardModel(
          title: 'Erobot’s Member',
          subTitle: 'See all our memberand info',
          icon: Icons.people,
          background: ThemeConstant.purpleGradient,
          screen: MemberScreen(),
        ),
        HomeCardModel(
          title: 'Our reputation',
          subTitle: 'Upcoming event infoand more',
          icon: Icons.stars,
          background: ThemeConstant.greenGradient,
          screen: ReputationScreen(),
        ),
      ];
}
