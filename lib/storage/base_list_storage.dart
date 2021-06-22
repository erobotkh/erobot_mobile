import 'dart:convert';

import 'package:erobot/storage/share_preference_storage.dart';

abstract class BaseListStorage extends SharePreferenceStorage {
  Future<List<dynamic>?> readList() async {
    String? string = await super.read();
    if (string == null) return null;
    List<dynamic> list = jsonDecode(string);
    return list;
  }

  Future<void> writeList(List<dynamic> value) async {
    String string = jsonEncode(value);
    await super.write(string);
  }

  Future<void> addToList(dynamic value) async {
    List<dynamic> list = await this.readList() ?? [];
    list.removeWhere((element) => element == value);
    list.add(value);
    await this.writeList(list);
  }

  Future<void> removeFromList(dynamic value) async {
    List<dynamic> list = await this.readList() ?? [];
    list.removeWhere((element) => element == value);
    await this.writeList(list);
  }
}
