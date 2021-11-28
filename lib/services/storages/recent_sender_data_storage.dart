import 'package:erobot_mobile/services/base_storages/list_preference_storage.dart';

class RecentSenderDataStorage extends ListPreferenceStorage<String> {
  @override
  String get key => "RecentSenderDataStorage";

  RecentSenderDataStorage._privateConstructor();
  static final RecentSenderDataStorage instance = RecentSenderDataStorage._privateConstructor();
}
