import 'package:erobot/widgets/E_Listview.dart';
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
        Listtile(
          title: 'PNC Event',
          subtitle: '19th Jul, 2019',
          img: 'assets/images/1.jpg',
        ),
        Listtile(
          title: 'Smart Event',
          subtitle: '19th Jul, 2018',
          img: 'assets/images/1.jpg',
        ),
        Listtile(
          title: 'STEM Event',
          subtitle: '19th Jul, 2017',
          img: 'assets/images/1.jpg',
        ),
        Listtile(
          title: 'Jane Warren',
          subtitle: '19th Jul, 2016',
          img: 'assets/images/1.jpg',
        ),
        Listtile(
          title: 'Morris Henry',
          subtitle: '19th Jul, 2015',
          img: 'assets/images/1.jpg',
        ),
        Listtile(
          title: 'Irma Flores',
          subtitle: '19th Jul, 2014',
          img: 'assets/images/1.jpg',
        ),
      ],
    );
  }
}
