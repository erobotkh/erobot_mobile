import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

abstract class BasePreferenceStorage<T> {
  String get key;

  Future<T?> read() async {
    return box.read(key);
  }

  Future<void> write(T value) async {
    return box.write(key, value);
  }

  Future<void> remove() async {
    return box.remove(key);
  }

  VoidCallback listen(ValueSetter callback) {
    return box.listenKey(key, callback);
  }

  final GetStorage box = GetStorage();
}
