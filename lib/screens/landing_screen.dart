import 'package:erobot/config/tab_bar_config.dart';
import 'package:erobot/screens/app_bar_main_screen.dart';
import 'package:flutter/material.dart';

class LandingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Text('Home'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Theme.of(context).unselectedWidgetColor,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: 0,
        type: BottomNavigationBarType.fixed,
        onTap: (int index) {
          // switchTab(index, notifier);
        },
        backgroundColor: Theme.of(context).colorScheme.surface,
        items: [
          BottomNavigationBarItem(
            label: 'HOme',
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: 'Educ',
            icon: Icon(Icons.school),
          ),
        ],
        elevation: 0.0,
      ),
    );
  }
}
