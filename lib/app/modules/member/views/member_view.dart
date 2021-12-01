import 'package:erobot_mobile/constants/config_constant.dart';
import 'package:erobot_mobile/widgets/widgets.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/member_controller.dart';

class MemberView extends GetView<MemberController> {
  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    return Scaffold(
      backgroundColor: _theme.colorScheme.background,
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: _theme.colorScheme.surface,
        title: Text(
          'Members',
          style: _theme.textTheme.headline6,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.only(
          top: ConfigConstant.margin1,
        ),
        children: [
          ERExpansionTile(
            title: 'Morn Mey',
            subtitle: 'Team leader since 2021',
            img: 'assets/images/1.jpg',
            onTap: () {},
            textNamefb: 'Morn Mey',
            textNameTg: 'Morn Mey',
            textNameIg: 'Morn Mey',
            textBody:
            'I Love robot 📋✏️️ Lorem ipsum dolor sit amet, consectetur adipiscing elit. Amet diam gravida sed sagittis eu. Rhoncus ultricies gravida amet, fringilla scelerisque vitae. ❤️',
            linkIg: "",
            linkTele: "https://t.me/mornmey",
            linkFb: "https://www.facebook.com/profile.php?id=100033543979146",
          ),
          ERExpansionTile(
            title: 'Non Sinat',
            subtitle: 'Organizer since 2021',
            img: 'assets/images/1.jpg',
            onTap: () {},
            textNamefb: 'Non Sinat',
            textNameTg: 'Non Sinat',
            textNameIg: 'Non Sinat',
            textBody:
            'I Love robot 📋✏️️ Lorem ipsum dolor sit amet, consectetur adipiscing elit. Amet diam gravida sed sagittis eu. Rhoncus ultricies gravida amet, fringilla scelerisque vitae. ❤️',
            linkIg: "https://t.me/SinatNon",
            linkTele: "https://t.me/SinatNon",
            linkFb: "https://www.facebook.com/profile.php?id=100069673140786",
          ),
          ERExpansionTile(
            title: 'Choem Thea',
            subtitle: 'Organizer since 2021',
            img: 'assets/images/1.jpg',
            onTap: () {},
            textNameTg: 'Choem Thea',
            textBody:
            'I Love robot 📋✏️️ Lorem ipsum dolor sit amet, consectetur adipiscing elit. Amet diam gravida sed sagittis eu. Rhoncus ultricies gravida amet, fringilla scelerisque vitae. ❤️',
            textNameIg: 'Choem Thea',
            textNamefb: 'Choem Thea',
            linkIg: "",
            linkTele: "",
            linkFb: "",
          ),
          ERExpansionTile(
            title: 'Chen Darot',
            subtitle: 'Organizer since 2021',
            img: 'assets/images/1.jpg',
            onTap: () {},
            textNameIg: 'Chen Darot',
            textNamefb: 'Chen Darot',
            textNameTg: 'Chen Darot',
            textBody:
            'I Love robot 📋✏️️ Lorem ipsum dolor sit amet, consectetur adipiscing elit. Amet diam gravida sed sagittis eu. Rhoncus ultricies gravida amet, fringilla scelerisque vitae. ❤️',
            linkIg: "",
            linkTele: "",
            linkFb: "",
          ),
        ],
      ),
    );
  }
}
