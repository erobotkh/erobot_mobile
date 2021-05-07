import 'package:erobot/config/tab_bar_config.dart';
import 'package:erobot/notifier/main_screen_notifier.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AppBarMainScreen extends ConsumerWidget {
  const AppBarMainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, watch) {
    final notifier = watch(mainScreenNotifier);
    return WillPopScope(
      onWillPop: () {
        return willPopNavigation(notifier.selectedIndex);
      },
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
          TextEditingController().clear();
        },
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: body(notifier.selectedIndex),
          bottomNavigationBar: bottomNavigation(context, notifier),
        ),
      ),
    );
  }

  Widget bottomNavigation(BuildContext context, MainScreenNotifier notifier) {
    return BottomNavigationBar(
      selectedItemColor: Theme.of(context).colorScheme.primary,
      unselectedItemColor: Theme.of(context).colorScheme.secondary,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      currentIndex: notifier.selectedIndex,
      type: BottomNavigationBarType.fixed,
      onTap: (int index) {
        switchTab(index, notifier);
      },
      backgroundColor: Theme.of(context).colorScheme.onSurface,
      items: TabBarConfig.bottomNavigationBarItems(),
      elevation: 0.0,
    );
  }

  void switchTab(int index, MainScreenNotifier notifier) {
    if (index == notifier.selectedIndex) {
      TabBarConfig.navigationKeyAt(index)
          .currentState
          ?.popUntil((route) => route.isFirst);
    } else {
      notifier.switchIndex(index);
    }
  }

  Future<bool> willPopNavigation(notifier) async {
    final isFirstRouteInCurrentTab =
        !await TabBarConfig.navigationKeyAt(notifier.selectedIndex)
            .currentState!
            .maybePop();
    if (isFirstRouteInCurrentTab) {
      if (notifier.selectedIndex != 0) {
        switchTab(0, notifier);
        return false;
      }
    }
    // let system handle back button if we're on the first route
    return isFirstRouteInCurrentTab;
  }

  Widget body(int defaultIndex) {
    return IndexedStack(
      index: defaultIndex,
      children: TabBarConfig.navigationScreens(),
    );
  }
}
