import 'package:erobot_mobile/configs/tab_bar_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/wrapper_controller.dart';

class WrapperView extends GetView<WrapperController> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
          TextEditingController().clear();
        },
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: body(),
          bottomNavigationBar: bottomNavigation(context),
        ),
      ),
    );
  }

  Widget bottomNavigation(BuildContext context) {
    return Obx(() {
      return BottomNavigationBar(
        selectedItemColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Theme.of(context).colorScheme.secondary,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        currentIndex: controller.selectedIndex.abs(),
        type: BottomNavigationBarType.fixed,
        onTap: (int index) {
          controller.switchIndex(index);
        },
        backgroundColor: Theme.of(context).colorScheme.onSurface,
        items: TabBarConfig.bottomNavigationBarItems(),
        elevation: 0.0,
      );
    });
  }

  Widget body() {
    return Obx(() {
      return IndexedStack(
        index: controller.selectedIndex.abs(),
        children: TabBarConfig.navigationScreens(),
      );
    });
  }
}
