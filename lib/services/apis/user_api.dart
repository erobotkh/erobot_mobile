import 'package:erobot_mobile/models/user_model.dart';
import 'package:erobot_mobile/services/base_apis/base_resource_owner_api.dart';

class UserApi extends BaseResourceOwnerApi<UserModel> {
  @override
  bool get useJapx => true;

  @override
  String get nameInUrl => "user";

  @override
  objectTransformer(Map<String, dynamic> json) {
    return UserModel.fromJson(json);
  }
}
