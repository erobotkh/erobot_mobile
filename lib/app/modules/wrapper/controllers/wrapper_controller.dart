import 'package:erobot_mobile/configs/tab_bar_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WrapperController extends GetxController {
  RxInt selectedIndex = 0.obs;

  void switchIndex(int index) {
    if (index == selectedIndex.abs()) {
      NavigatorState? currentState = TabBarConfig.navigationKeyAt(index).currentState;
      currentState?.popUntil((route) => route.isFirst);
    } else {
      selectedIndex.value = index;
    }
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
