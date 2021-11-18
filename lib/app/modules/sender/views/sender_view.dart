import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/sender_controller.dart';

class SenderView extends GetView<SenderController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SenderView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'SenderView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
