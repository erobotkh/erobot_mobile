import 'package:erobot_mobile/services/base_apis/base_resource_owner_api.dart';

class PostReactionApi extends BaseResourceOwnerApi {
  toggleReaction({required String postId}) {
    return super.update(id: "$postId/reactions", queryParameters: {'type': "love"}, body: {});
  }

  @override
  String get nameInUrl => "posts";

  @override
  objectTransformer(Map<String, dynamic> json) {
    return json;
  }
}
