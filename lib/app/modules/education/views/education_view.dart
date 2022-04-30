import 'package:erobot_mobile/app/routes/app_pages.dart';
import 'package:erobot_mobile/mixins/loading.dart';
import 'package:erobot_mobile/models/post_model.dart';
import 'package:erobot_mobile/app/modules/education/local_widgets/education_card.dart';
import 'package:erobot_mobile/constants/config_constant.dart';
import 'package:erobot_mobile/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import '../controllers/education_controller.dart';

class EducationView extends GetView with Loading {
  @override
  Widget build(BuildContext context) {
    Get.put(EducationController());
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
    return GetBuilder<EducationController>(builder: (controller) {
      List<PostModel> items = controller.postListModel?.value.items ?? [];

      return LazyLoadScrollView(
        onEndOfPage: () {
          controller.loadMore();
        },
        scrollOffset: 100,
        child: RefreshIndicator(
          onRefresh: () async {
            await controller.loadList();
          },
          child: ListView.builder(
            padding: ConfigConstant.layoutPadding,
            itemCount: items.length + 1,
            itemBuilder: (context, index) {
              if (index == items.length) {
                return Transform.translate(
                  offset: Offset(0.0, -ConfigConstant.margin1),
                  child: ERCircularLoading(loading: controller.isLoading?.value == true),
                );
              }
              PostModel post = items[index];
              return EducationCard(
                post: post,
                onPressedLearn: () {
                  Get.toNamed(
                    Routes.POST_DETAIL,
                    arguments: post,
                  );
                },
              );
            },
          ),
        ),
      );
    });
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
          onPressed: () {
            Get.toNamed(Routes.SEARCH);
          },
        ),
      ],
      // bottom: PreferredSize(
      //   preferredSize: const Size.fromHeight(48),
      //   child: Container(
      //     color: Theme.of(context).colorScheme.primary,
      //     child: TabBar(
      //       isScrollable: true,
      //       controller: DefaultTabController.of(context),
      //       indicatorColor: Colors.transparent,
      //       tabs: List.generate(
      //         length,
      //         (index) {
      //           return Tab(
      //             child: Text(
      //               title[index].toUpperCase(),
      //             ),
      //           );
      //         },
      //       ),
      //     ),
      //   ),
      // ),
    );
  }
}
