import 'package:erobot_mobile/app/modules/comment/views/comment_view.dart';
import 'package:erobot_mobile/app/modules/education/controllers/education_controller.dart';
import 'package:erobot_mobile/mixins/loading.dart';
import 'package:erobot_mobile/models/post_model.dart';
import 'package:erobot_mobile/services/apis/post_reaction_api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PostDetailController extends GetxController with Loading {
  final count = 0.obs;
  late final PageController pageController;
  PostModel? postModel;
  final isShow = true.obs;

  toggleReaction(String postId) async {
    var api = PostReactionApi();
    var eduController = Get.put(EducationController());
    showLoading();
    await api.toggleReaction(postId: postId);
    hideLoading();

    if (api.success()) {
      print("Reaction success");
      await eduController.loadList();
    } else {
      print("error");
    }
    update();
  }

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
      Icons.favorite_outline,
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
        toggleReaction(postModel?.id ?? '');
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
