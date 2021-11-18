import 'package:erobot_mobile/services/base_storages/base_preference_storage.dart';

abstract class BoolPreferenceStorage extends BasePreferenceStorage<bool> {
  Future<void> toggle() async {
    final bool current = await read() == true;
    return write(!current);
  }
}
