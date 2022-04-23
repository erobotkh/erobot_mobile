import 'package:erobot_mobile/models/list_member/list_member_model.dart';
import 'package:erobot_mobile/models/list_member/member_model.dart';
import 'package:erobot_mobile/services/base_apis/base_resource_owner_api.dart';
import 'package:logger/logger.dart';

class ListMemberApi extends BaseResourceOwnerApi<MemberModel> {
  @override
  String get nameInUrl => "members";

  Future<dynamic> fetchAllMembers({String? page}) async {
    var result = await super.fetchAll(
      queryParameters: {
        'included': 'socials,team',
      },
    );
    return result;
  }

  @override
  bool get useJapx => true;

  @override
  itemsTransformer(Map<String, dynamic> json) {
    return ListMemberModel(
      items: buildItems(json),
      meta: buildMeta(json),
      links: buildLinks(json),
    );
  }

  @override
  objectTransformer(Map<String, dynamic> json) {
    return MemberModel.fromJson(json);
  }
}
