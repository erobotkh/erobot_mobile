import 'package:erobot_mobile/models/list_member/list_member_model.dart';
import 'package:erobot_mobile/services/apis/list_member_api.dart';
import 'package:get/get.dart';

class MemberController extends GetxController {
  Rx<ListMemberModel>? memberListModel;

  @override
  void onInit() {
    super.onInit();
    memberListModel = ListMemberModel().obs;
    ListMemberApi().fetchAllMembers().then((value) {
      memberListModel?.value = value;
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
