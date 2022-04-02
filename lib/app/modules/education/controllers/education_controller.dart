import 'package:erobot_mobile/models/post_list_model.dart';
import 'package:erobot_mobile/services/apis/post_api.dart';
import 'package:get/get.dart';

class EducationController extends GetxController {
  Rx<PostListModel>? postListModel;

  loadMore() async {
    print('fetching...');
    PostListModel newList = PostListModel();
    newList = await PostApi().fetchAllPosts(page: postListModel?.value.links?.getPageNumber().next);
    postListModel?.value.add(newList);
    postListModel?.refresh();
  }

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
}
