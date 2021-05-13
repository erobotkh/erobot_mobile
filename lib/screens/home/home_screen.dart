import 'package:erobot/screens/home/members_page.dart';
import 'package:erobot/screens/home/reputations_page.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
                onPressed: () {
                  Navigator.of(context, rootNavigator: true).push(
                    MaterialPageRoute(
                      builder: (context) => MembersPage(),
                    ),
                  );
                },
                child: Text('Members')),
            TextButton(
              onPressed: () {
                Navigator.of(context, rootNavigator: true).push(
                  MaterialPageRoute(
                    builder: (context) => ReputationsPage(),
                  ),
                );
              },
              child: Text('Reputations'),
            ),
          ],
        ),
      ),
    );
  }
}
