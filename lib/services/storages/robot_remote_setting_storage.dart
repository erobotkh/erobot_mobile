import 'package:erobot_mobile/services/base_storages/map_preference_storage.dart';

class RobotRemoteSettingStorage extends MapPreferenceStorage<String, dynamic> {
  @override
  String get key => "RobotRemoteSettingStorage";

  RobotRemoteSettingStorage._privateConstructor();
  static final RobotRemoteSettingStorage instance = RobotRemoteSettingStorage._privateConstructor();
}
