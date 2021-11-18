import 'package:erobot_mobile/app/modules/education/local_widgets/education_card.dart';
import 'package:erobot_mobile/constants/config_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/education_controller.dart';

class EducationView extends GetView<EducationController> {
  @override
  Widget build(BuildContext context) {
    List<String> title = [
      'Robot',
      'Coding',
      'Education',
      'Experiences',
    ];
    int length = title.length;
    return DefaultTabController(
      length: length,
      child: Scaffold(
        appBar: _buildAppBar(
          length: length,
          title: title,
          context: context,
        ),
        body: _buildBody(
          context: context,
          length: length,
        ),
      ),
    );
  }

  Widget _buildBody({
    required BuildContext context,
    required int length,
  }) {
    return TabBarView(
      controller: DefaultTabController.of(context),
      children: List.generate(
        length,
        (index) {
          return ListView.builder(
            padding: ConfigConstant.layoutPadding,
            itemCount: 8,
            itemBuilder: (context, index) {
              return EducationCard();
            },
          );
        },
      ),
    );
  }

  AppBar _buildAppBar({
    required List<String> title,
    required int length,
    required BuildContext context,
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
        preferredSize: const Size.fromHeight(48),
        child: Container(
          color: Theme.of(context).colorScheme.primary,
          child: TabBar(
            isScrollable: true,
            controller: DefaultTabController.of(context),
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
