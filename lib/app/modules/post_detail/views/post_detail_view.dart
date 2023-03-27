import 'package:erobot_mobile/constants/config_constant.dart';
import 'package:erobot_mobile/helpers/date_helper.dart';
import 'package:erobot_mobile/models/post_model.dart';
import 'package:erobot_mobile/widgets/er_image_viewer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

import 'package:get/get.dart';

import '../controllers/post_detail_controller.dart';

class PostDetailView extends GetView<PostDetailController> {
  @override
  Widget build(BuildContext context) {
    final double expandedHeight = MediaQuery.of(context).size.width;
    controller.postModel = ModalRoute.of(context)?.settings.arguments as PostModel;

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
        onTap: (index) => controller.onTapBottomNav(index),
        items: List.generate(controller.getListIcons().length, (index) {
          var icon = controller.getListIcons()[index];
          return BottomNavigationBarItem(
            icon: Icon(icon),
            label: "",
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
                  controller.postModel?.title ?? 'Title',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: ConfigConstant.margin0),
                Wrap(
                  children: [
                    Text(
                      controller.postModel?.author?.fullNameI ?? 'Author Name',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
                    ),
                    Text(' - '),
                    Text(
                      DateHelper.yMMd(context, DateTime.tryParse(controller.postModel?.createdAt ?? '')),
                      style: Theme.of(context).textTheme.bodyMedium,
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
              data: controller.getDesc() ?? '',
            ),
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
          controller.isShow.value ? controller.postModel?.title ?? '' : '',
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
                  images: controller.getImages() ?? [],
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
            children: List.generate(controller.getImages()?.length ?? 0, (index) {
              return Image.network(
                controller.getImages()?.first ?? '',
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
