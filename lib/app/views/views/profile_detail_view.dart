import 'package:flutter/material.dart';

import 'package:get/get.dart';

class ProfileDetailView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ProfileDetailView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'ProfileDetailView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
