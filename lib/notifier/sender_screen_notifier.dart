import 'package:erobot/storage/sender_recent_storage.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SenderScreenNotifier extends ChangeNotifier {
  late SenderRecentStorage storage;
  SenderScreenNotifier() {
    storage = SenderRecentStorage();
  }

  List<dynamic>? recent;
  Future<void> load() async {
    recent = await storage.readList();
    notifyListeners();
  }

  Future<void> addToList(String value) async {
    await storage.addToList(value);
    load();
  }

  Future<void> removeFromList(String value) async {
    await storage.removeFromList(value);
    load();
  }
}

final senderScreenNotifier = ChangeNotifierProvider.autoDispose<SenderScreenNotifier>(
  (ref) {
    return SenderScreenNotifier()..load();
  },
);
