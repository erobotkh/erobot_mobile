import 'package:erobot/widgets/e_expansiontile.dart';
import 'package:flutter/material.dart';

class ReputationsPage extends StatefulWidget {
  @override
  _ReputationsPageState createState() => _ReputationsPageState();
}

class _ReputationsPageState extends State<ReputationsPage> {
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
        'Reputations',
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

  _buildBody(ThemeData _theme, BuildContext context) {
    return ListView(
      children: [
        ExpanSionTile(
          title: 'Johnny Watson',
          subTitle: 'Team leader since 2019',
          img: 'assets/images/1.jpg',
          onTap: () {},
          textNamefb: '',
          textNameTg: '',
          textNameIg: '',
          textBody: '',
        ),
        ExpanSionTile(
          title: 'Annette Cooper',
          subTitle: 'Organizer since 2019',
          img: 'assets/images/1.jpg',
          onTap: () {},
          textNamefb: '',
          textNameTg: '',
          textNameIg: '',
          textBody: '',
        ),
        ExpanSionTile(
          title: 'Arthur Bell',
          subTitle: 'Organizer since 2019',
          img: 'assets/images/1.jpg',
          onTap: () {},
          textNamefb: '',
          textNameTg: '',
          textNameIg: '',
          textBody: '',
        ),
        ExpanSionTile(
          title: 'Jane Warren',
          subTitle: 'Organizer since 2019',
          img: 'assets/images/1.jpg',
          onTap: () {},
          textNamefb: '',
          textNameTg: '',
          textNameIg: '',
          textBody: '',
        ),
        ExpanSionTile(
          title: 'Morris Henry',
          subTitle: 'Organizer since 2019',
          img: 'assets/images/1.jpg',
          onTap: () {},
          textNamefb: '',
          textNameTg: '',
          textNameIg: '',
          textBody: '',
        ),
        ExpanSionTile(
          title: 'Irma Flores',
          subTitle: 'Organizer since 2019',
          img: 'assets/images/1.jpg',
          onTap: () {},
          textNamefb: '',
          textNameTg: '',
          textNameIg: '',
          textBody: '',
        ),
      ],
    );
  }
}
