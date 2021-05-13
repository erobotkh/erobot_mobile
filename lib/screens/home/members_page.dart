import 'package:erobot/widgets/Listview.dart';
import 'package:flutter/material.dart';

class MembersPage extends StatefulWidget {
  @override
  _MembersPageState createState() => _MembersPageState();
}

class _MembersPageState extends State<MembersPage> {
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

  _buildBody(ThemeData _theme, BuildContext context) {
    return ListView(
      children: [
        Listtile(
          title: 'Johnny Watson',
          subtitle: 'Team leader since 2019',
          img: 'assets/images/1.jpg',
        ),
        Listtile(
          title: 'Annette Cooper',
          subtitle: 'Organizer since 2019',
          img: 'assets/images/1.jpg',
        ),
        Listtile(
          title: 'Arthur Bell',
          subtitle: 'Organizer since 2019',
          img: 'assets/images/1.jpg',
        ),
        Listtile(
          title: 'Jane Warren',
          subtitle: 'Organizer since 2019',
          img: 'assets/images/1.jpg',
        ),
        Listtile(
          title: 'Morris Henry',
          subtitle: 'Organizer since 2019',
          img: 'assets/images/1.jpg',
        ),
        Listtile(
          title: 'Irma Flores',
          subtitle: 'Organizer since 2019',
          img: 'assets/images/1.jpg',
        ),
      ],
    );
  }
}
