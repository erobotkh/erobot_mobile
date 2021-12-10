import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/thumbstick_controller.dart';

class ThumbstickView extends GetView<ThumbstickController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ThumbstickView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'ThumbstickView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
