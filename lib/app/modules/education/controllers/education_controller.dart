import 'package:erobot_mobile/models/post_list_model.dart';
import 'package:erobot_mobile/services/apis/post_api.dart';
import 'package:get/get.dart';

class EducationController extends GetxController {
  final count = 0.obs;
  Rx<PostListModel>? postListModel;

  @override
  void onInit() {
    super.onInit();
    postListModel = PostListModel().obs;
    PostApi().fetchAllPosts().then((value) {
      postListModel?.value = value;
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
