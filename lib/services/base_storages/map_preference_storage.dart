import 'dart:convert';
import 'package:erobot_mobile/services/base_storages/base_preference_storage.dart';

abstract class MapPreferenceStorage<T, U> extends BasePreferenceStorage<String> {
  Future<void> writeMap(Map<T, U> value) async {
    await super.write(jsonEncode(value));
  }

  Future<Map<T, U>?> readMap() async {
    String? value = await super.read();
    if (value == null) return null;
    try {
      Map<T, U> result = jsonDecode(value);
      return result;
    } catch (e) {
      return null;
    }
  }
}
