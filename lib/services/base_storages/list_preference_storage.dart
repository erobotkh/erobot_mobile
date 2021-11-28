import 'dart:convert';
import 'package:erobot_mobile/services/base_storages/base_preference_storage.dart';

abstract class ListPreferenceStorage<T> extends BasePreferenceStorage<String> {
  Future<void> writeList(List<T> value) async {
    return await super.write(jsonEncode(value));
  }

  Future<List<T>?> readList() async {
    String? value = await super.read();
    if (value == null) return null;
    try {
      List<dynamic> result = jsonDecode(value);
      return result.whereType<T>().toList();
    } catch (e) {
      return null;
    }
  }
}
