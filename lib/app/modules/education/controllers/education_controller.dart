import 'package:bot_toast/bot_toast.dart';
import 'package:erobot_mobile/mixins/loading.dart';
import 'package:erobot_mobile/models/post_list_model.dart';
import 'package:erobot_mobile/services/apis/post_api.dart';
import 'package:erobot_mobile/widgets/er_loading.dart';
import 'package:get/get.dart';

class EducationController extends GetxController with Loading {
  Rx<PostListModel>? postListModel;
  Rx<bool>? isLoading;

  loadMore() async {
    PostListModel newList = PostListModel();
    if (postListModel!.value.hasLoadMore()) {
      print('Fetching ...');
      setLoading(true);
      newList = await PostApi().fetchAllPosts(page: postListModel?.value.links?.getPageNumber().next);
      postListModel?.value.add(newList);
      setLoading(false);
    }
    update();
  }

  loadList() async {
    postListModel = PostListModel().obs;
    showLoading();
    await PostApi().fetchAllPosts().then((value) {
      postListModel?.value = value;
    });
    hideLoading();
    update();
  }

  setLoading(bool loading) {
    isLoading = loading.obs;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    loadList();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
