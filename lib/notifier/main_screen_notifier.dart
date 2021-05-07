import 'package:erobot/config/tab_bar_config.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MainScreenNotifier extends ChangeNotifier {
  int selectedIndex = 0;

  void switchIndex(int index) {
    if (index == selectedIndex) {
      return TabBarConfig.navigationKeyAt(index).currentState?.popUntil((route) => route.isFirst);
    }

    selectedIndex = index;
    notifyListeners();
  }
}

final mainScreenNotifier = ChangeNotifierProvider<MainScreenNotifier>((ref) => MainScreenNotifier());
