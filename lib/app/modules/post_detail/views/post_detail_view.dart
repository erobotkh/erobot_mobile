import 'package:erobot_mobile/constants/config_constant.dart';
import 'package:erobot_mobile/widgets/er_image_viewer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

import 'package:get/get.dart';

import '../controllers/post_detail_controller.dart';

class PostDetailView extends GetView<PostDetailController> {
  @override
  Widget build(BuildContext context) {
    final double expandedHeight = MediaQuery.of(context).size.width;
    return Scaffold(
      body: CustomScrollView(
        slivers: [buildAppBarWidget(expandedHeight, context), buildBody(context)],
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: false,
        unselectedItemColor: Theme.of(context).colorScheme.onSurface,
        selectedItemColor: Theme.of(context).colorScheme.onSurface,
        backgroundColor: Theme.of(context).colorScheme.surface,
        items: List.generate(controller.getListIcons().length, (index) {
          var icon = controller.getListIcons()[index];
          return BottomNavigationBarItem(
            icon: Icon(icon),
            label: "WOWO",
          );
        }),
      ),
    );
  }

  SliverList buildBody(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          Container(
            color: Theme.of(context).colorScheme.surface,
            padding: const EdgeInsets.all(ConfigConstant.margin2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Test title wowowo",
                  style: Theme.of(context).textTheme.headline6,
                ),
                const SizedBox(height: ConfigConstant.margin0),
                Wrap(
                  children: [
                    Text(
                      "Suy Kosal",
                      style: Theme.of(context).textTheme.bodyText2?.copyWith(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      " - 19 Jun 2020",
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                  ],
                )
              ],
            ),
          ),
          const SizedBox(height: ConfigConstant.margin1),
          Container(
            color: Theme.of(context).colorScheme.surface,
            padding: const EdgeInsets.all(ConfigConstant.margin2),
            child: MarkdownBody(
              data: controller.getDesc(),
            ),
            // child: Center(
            //   child: Text(
            //     controller.getDesc(),
            //     style: Theme.of(context).textTheme.bodyText2,
            //   ),
            // ),
          ),
        ],
      ),
    );
  }

  SliverAppBar buildAppBarWidget(double expandedHeight, BuildContext context) {
    return SliverAppBar(
      elevation: 0,
      expandedHeight: expandedHeight,
      collapsedHeight: kToolbarHeight,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: false,
        title: Text(
          controller.isShow.value ? "title" : '',
        ),
        background: GestureDetector(
          onTap: () {
            showModalBottomSheet(
              context: context,
              useRootNavigator: true,
              isScrollControlled: true,
              backgroundColor: Colors.black,
              barrierColor: Colors.transparent,
              builder: (context) {
                return ImageViewer(
                  images: controller.getImages(),
                  statusBarHeight: MediaQuery.of(context).padding.top,
                  currentImageIndex: controller.pageController.page?.toInt() ?? 0,
                  onPageChanged: (index) {
                    controller.pageController.animateToPage(
                      index,
                      duration: ConfigConstant.duration,
                      curve: Curves.easeIn,
                    );
                  },
                );
              },
            );
          },
          child: buildImageContainer(context),
        ),
      ),
    );
  }

  Stack buildImageContainer(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: double.infinity,
          width: double.infinity,
          child: PageView(
            controller: controller.pageController,
            children: List.generate(controller.getImages().length, (index) {
              return Image.network(
                controller.getImages()[0],
                fit: BoxFit.cover,
              );
            }),
          ),
        ),
        IgnorePointer(
          ignoring: true,
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Theme.of(context).colorScheme.surface,
                  Theme.of(context).colorScheme.surface.withOpacity(0.0),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
