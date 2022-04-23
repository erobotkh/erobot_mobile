import 'package:erobot_mobile/mixins/loading.dart';
import 'package:erobot_mobile/models/list_member/list_member_model.dart';
import 'package:erobot_mobile/services/apis/list_member_api.dart';
import 'package:get/get.dart';

class MemberController extends GetxController with Loading {
  Rx<ListMemberModel>? memberListModel;
  Rx<bool>? isLoading;

  loadMore() async {
    ListMemberModel newList = ListMemberModel();
    if (memberListModel!.value.hasLoadMore()) {
      print('Fetching ...');
      setLoading(true);
      newList = await ListMemberApi().fetchAllMembers(page: memberListModel?.value.links?.getPageNumber().next);
      memberListModel?.value.add(newList);
      setLoading(false);
    }
    update();
  }

  load() async {
    memberListModel = ListMemberModel().obs;
    showLoading();
    await ListMemberApi().fetchAllMembers().then((value) {
      hideLoading();
      memberListModel?.value = value;
    });
    update();
  }

  setLoading(bool loading) {
    isLoading = loading.obs;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    load();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
