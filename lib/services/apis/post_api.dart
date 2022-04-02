import 'package:erobot_mobile/models/post_list_model.dart';
import 'package:erobot_mobile/models/post_model.dart';
import 'package:erobot_mobile/services/base_apis/base_resource_owner_api.dart';

class PostApi extends BaseResourceOwnerApi<PostModel> {
  Future<dynamic> fetchAllPosts({String? page}) async {
    var result = await super.fetchAll(
      queryParameters: {
        'included': 'images,author',
        'page': page,
      },
    );
    return result;
  }

  @override
  String get nameInUrl => "posts";

  @override
  objectTransformer(Map<String, dynamic> json) {
    return PostModel.fromJson(json);
  }

  @override
  itemsTransformer(Map<String, dynamic> json) {
    return PostListModel(
      items: buildItems(json),
      meta: buildMeta(json),
      links: buildLinks(json),
    );
  }
}
