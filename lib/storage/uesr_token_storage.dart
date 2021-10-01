import 'package:erobot/storage/share_preference_storage.dart';

class UserTokenStorage extends SharePreferenceStorage {
  @override
  String get key => "userToken";
}
