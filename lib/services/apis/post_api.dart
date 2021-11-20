import 'package:erobot_mobile/app/data/models/post_list_model.dart';
import 'package:erobot_mobile/app/data/models/post_model.dart';
import 'package:erobot_mobile/services/base_apis/base_resource_api.dart';

class PostApi extends BaseResourceOwnerApi<Post> {
  Future<dynamic> fetchAllPosts() async {
    var result = await super.fetchAll(
      queryParameters: {
        'included': 'images,author',
      },
    );
    return result;
  }

  @override
  String get nameInUrl => "posts";

  @override
  objectTransformer(Map<String, dynamic> json) {
    return Post.fromJson(json);
  }

  @override
  itemsTransformer(Map<String, dynamic> json) {
    return PostList(
      items: buildItems(json),
      meta: buildMeta(json),
      links: buildLinks(json),
    );
  }
}
