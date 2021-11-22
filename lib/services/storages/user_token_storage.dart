import 'package:erobot_mobile/app/data/models/user_token_model.dart';
import 'package:erobot_mobile/services/base_storages/map_preference_storage.dart';

class UserTokenStorage extends MapPreferenceStorage<String, dynamic> {
  @override
  String get key => "UserTokenStorage";

  Future<UserTokenModel?> getCurrentUserToken() async {
    Map<String, dynamic>? json = await readMap();
    if (json != null) {
      return UserTokenModel.fromJson(json);
    }
  }
}
