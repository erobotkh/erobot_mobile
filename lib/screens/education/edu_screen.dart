import 'package:erobot/config/config_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'local_widgets/edu_card.dart';

class EduScreen extends HookWidget {
  @override
  Widget build(BuildContext context) {
    List<String> title = [
      'Robot',
      'Coding',
      'Education',
      'Experiences',
    ];
    final length = title.length;
    TabController tabController = useTabController(initialLength: length);

    return DefaultTabController(
      length: length,
      child: Scaffold(
        appBar: _buildAppBar(
          length: length,
          title: title,
          tabController: tabController,
        ),
        body: _buildBody(
          context: context,
          tabController: tabController,
          length: length,
        ),
      ),
    );
  }

  _buildBody({
    required BuildContext context,
    required TabController tabController,
    required int length,
  }) {
    return TabBarView(
      controller: tabController,
      children: List.generate(
        length,
        (index) {
          return SingleChildScrollView(
            padding: EdgeInsets.all(ConfigConstant.margin2),
            child: Column(
              children: List.generate(
                8,
                (index) => EduCard(context: context),
              ),
            ),
          );
        },
      ),
    );
  }

  AppBar _buildAppBar({
    required List<String> title,
    required int length,
    required TabController tabController,
  }) {
    return AppBar(
      title: Text('Education'),
      actions: [
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () => print('search'),
        ),
      ],
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(48),
        child: Container(
          color: Colors.red,
          child: TabBar(
            isScrollable: true,
            controller: tabController,
            indicatorColor: Colors.transparent,
            tabs: List.generate(
              length,
              (index) {
                return Tab(
                  child: Text(
                    title[index].toUpperCase(),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
