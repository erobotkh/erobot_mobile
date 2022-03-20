import 'package:erobot_mobile/models/comment_model.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/comment_controller.dart';

class CommentView extends GetView<CommentController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Row(
              children: [
                const SizedBox(width: 16),
                Text('Comment: ${controller.totalComments}'),
                const Spacer(),
                IconButton(
                  onPressed: () => Get.back(),
                  icon: Icon(Icons.close),
                ),
              ],
            ),
            // Comments list section
            Expanded(
              child: ListView.builder(
                itemCount: controller.totalComments,
                itemBuilder: (context, index) {
                  return commentTile(controller.comments[index]);
                },
              ),
            ),
            Container(
              height: 4,
              color: Colors.black26,
            ),
            buildCommentField
          ],
        ),
      ),
    );
  }

  Widget commentTile(CommentModel comment) {
    return Column(
      children: [
        ListTile(
          contentPadding: EdgeInsets.symmetric(
            horizontal: 16,
          ),
          leading: SizedBox(
            width: 40,
            height: 40,
            child: CircleAvatar(
              backgroundImage: NetworkImage(comment.user.profileImage!),
            ),
          ),
          title: Text(comment.user.fullNameI),
          subtitle: Text(comment.time),
          trailing: InkWell(
            onTap: () => showMenus(),
            child: Icon(
              Icons.more_vert,
              color: Get.iconColor,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 70, right: 26, bottom: 10),
          child: Text(comment.content),
        ),
      ],
    );
  }

  Widget get buildCommentField => Container(
        color: Get.theme.scaffoldBackgroundColor,
        height: 66,
        padding: EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 40,
              height: 40,
              child: CircleAvatar(
                backgroundImage: NetworkImage(controller.comments.first.user.profileImage!),
              ),
            ),
            const SizedBox(width: 18),
            Expanded(
              child: TextField(
                autofocus: controller.isOpenedPage,
                onTap: () => controller.onTapTextFiled(),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  hintText: 'Write a comment',
                ),
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.send),
            ),
          ],
        ),
      );

  void showMenus() {
    Get.bottomSheet(
      SingleChildScrollView(
        child: Column(
          children: [
            space,
            buildMenu('EDIT', () {
              print('EDIT');
            }),
            buildMenu('DELETE', () {
              print('DELETE');
            }),
            buildMenu('CANCEL', () => Get.back()),
            space,
          ],
        ),
      ),
      backgroundColor: Get.theme.scaffoldBackgroundColor,
    );
  }

  Widget buildMenu(String text, Function() onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 56,
        alignment: Alignment.center,
        child: Text(text),
      ),
    );
  }

  Widget get space => SizedBox(height: 15);
}
