import 'package:erobot_mobile/models/base/base_list_model.dart';
import 'package:erobot_mobile/models/base/links_model.dart';
import 'package:erobot_mobile/models/base/meta_model.dart';
import 'package:erobot_mobile/models/list_member/member_model.dart';

class ListMemberModel extends BaseListModel<MemberModel> {
  ListMemberModel({
    List<MemberModel>? items,
    MetaModel? meta,
    LinksModel? links,
  }) : super(items: items, meta: meta, links: links);
}
