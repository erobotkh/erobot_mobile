import 'package:erobot/storage/bool_preference_storage.dart';

class ThemeModeStorage extends BoolPreference {
  
  @override
  String get key {
    return 'isDarkMode';
  }
}
