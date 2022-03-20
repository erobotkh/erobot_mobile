import 'package:erobot_mobile/app/modules/comment/views/comment_view.dart';
import 'package:erobot_mobile/models/post_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PostDetailController extends GetxController {
  //TODO: Implement PostDetailController

  final count = 0.obs;
  late final PageController pageController;
  PostModel? postModel;
  final isShow = true.obs;

  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    pageController.dispose();
  }

  String? getDesc() {
    return postModel?.body;
  }

  List<String>? getImages() {
    return postModel?.images?.map((e) => e.url ?? '').toList();
  }

  List<IconData> getListIcons() {
    List<IconData> icons = [
      Icons.favorite,
      Icons.message,
      Icons.share,
      Icons.bookmark,
      Icons.more_vert,
    ];
    return icons;
  }

  void onTapBottomNav(int index) {
    switch (index) {
      case 0:
        print('Like');
        break;
      case 1:
        _showComment();
        break;
      case 2:
        print('Share');
        break;
      case 3:
        print('Save');
        break;
      default:
        print('More');
        break;
    }
  }

  void _showComment() {
    Get.bottomSheet(
      CommentView(),
    );
  }
}
