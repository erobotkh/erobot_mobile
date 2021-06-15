import 'package:erobot/config/config_constant.dart';
import 'package:erobot/widgets/e_expansiontile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MembersExpanedScreen extends StatefulWidget {
  @override
  _MembersExpanedScreenState createState() => _MembersExpanedScreenState();
}

class _MembersExpanedScreenState extends State<MembersExpanedScreen> {
  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    return Scaffold(
      backgroundColor: _theme.colorScheme.background,
      appBar: _buildAppBar(_theme, context),
      body: _buildBody(_theme, context),
    );
  }

  _buildAppBar(ThemeData _theme, BuildContext context) {
    return AppBar(
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
    );
  }

  _buildBody(
    ThemeData _theme,
    BuildContext context,
  ) {
    return ListView(
      padding: EdgeInsets.only(
        top: ConfigConstant.margin1,
      ),
      children: [
        ExpanSionTile(
          title: 'Morn Mey',
          subTitle: 'Team leader since 2021',
          img: 'assets/images/1.jpg',
          onTap: () {},
          textNamefb: 'Morn Mey',
          textNameTg: 'Morn Mey',
          textNameIg: 'Morn Mey',
          textBody:
              'I Love robot 📋✏️️ Lorem ipsum dolor sit amet, consectetur adipiscing elit. Amet diam gravida sed sagittis eu. Rhoncus ultricies gravida amet, fringilla scelerisque vitae. ❤️',
        ),
        ExpanSionTile(
          title: 'Non Sinat',
          subTitle: 'Organizer since 2021',
          img: 'assets/images/1.jpg',
          onTap: () {},
          textNamefb: 'Non Sinat',
          textNameTg: 'Non Sinat',
          textNameIg: 'Non Sinat',
          textBody:
              'I Love robot 📋✏️️ Lorem ipsum dolor sit amet, consectetur adipiscing elit. Amet diam gravida sed sagittis eu. Rhoncus ultricies gravida amet, fringilla scelerisque vitae. ❤️',
        ),
        ExpanSionTile(
          title: 'Choem Thea',
          subTitle: 'Organizer since 2021',
          img: 'assets/images/1.jpg',
          onTap: () {},
          textNameTg: 'Choem Thea',
          textBody:
              'I Love robot 📋✏️️ Lorem ipsum dolor sit amet, consectetur adipiscing elit. Amet diam gravida sed sagittis eu. Rhoncus ultricies gravida amet, fringilla scelerisque vitae. ❤️',
          textNameIg: 'Choem Thea',
          textNamefb: 'Choem Thea',
        ),
        ExpanSionTile(
          title: 'Chen Darot',
          subTitle: 'Organizer since 2021',
          img: 'assets/images/1.jpg',
          onTap: () {},
          textNameIg: 'Chen Darot',
          textNamefb: 'Chen Darot',
          textNameTg: 'Chen Darot',
          textBody:
              'I Love robot 📋✏️️ Lorem ipsum dolor sit amet, consectetur adipiscing elit. Amet diam gravida sed sagittis eu. Rhoncus ultricies gravida amet, fringilla scelerisque vitae. ❤️',
        ),
      ],
    );
  }
}
