import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/profile_wrapper_controller.dart';

class ProfileWrapperView extends GetView<ProfileWrapperController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ProfileWrapperView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'ProfileWrapperView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
