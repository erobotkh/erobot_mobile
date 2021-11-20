import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/profile_detail_controller.dart';

class ProfileDetailView extends GetView<ProfileDetailController> {
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
