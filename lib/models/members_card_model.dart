import 'package:erobot/constant/theme_constant.dart';
import 'package:flutter/material.dart';

class MembersCardModel {
  String img;
  String title;
  String subTitle;
  IconData? icon;
  Function()? onTap;

  MembersCardModel({
    this.img = '',
    this.title = '',
    this.subTitle = '',
    this.icon,
    this.onTap,
  });

  static getCards() => [
    MembersCardModel(
      title: 'Johnny Watson',
      subTitle: 'Team leader since 2019',
      img: 'assets/images/1.jpg',
    ),
    MembersCardModel(
      title: 'Johnny Watson',
      subTitle: 'Team leader since 2019',
      img: 'assets/images/1.jpg',
    ),
    MembersCardModel(
      title: 'Annette Cooper',
      subTitle: 'Organizer since 2019',
      img: 'assets/images/1.jpg',
    ),
    MembersCardModel(
      title: 'Arthur Bell',
      subTitle: 'Organizer since 2019',
      img: 'assets/images/1.jpg',
    ),
    MembersCardModel(
      title: 'Jane Warren',
      subTitle: 'Organizer since 2019',
      img: 'assets/images/1.jpg',
    ),
    MembersCardModel(
      title: 'Morris Henry',
      subTitle: 'Organizer since 2019',
      img: 'assets/images/1.jpg',
    ),
    MembersCardModel(
      title: 'Irma Flores',
      subTitle: 'Organizer since 2019',
      img: 'assets/images/1.jpg',
    ),
  ];
}
