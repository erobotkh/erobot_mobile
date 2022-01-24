import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchController extends GetxController {
  final count = 0.obs;
  final textController = TextEditingController();
  RxBool isHistory = true.obs;

  updateResultIcon() {
    if (textController.text.isNotEmpty) {
      isHistory.value = false;
    } else {
      isHistory.value = true;
    }
    update();
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
  void onClose() {}
  void increment() => count.value++;
}
