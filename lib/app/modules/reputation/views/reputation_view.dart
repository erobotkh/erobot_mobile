import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/reputation_controller.dart';

class ReputationView extends GetView<ReputationController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ReputationView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'ReputationView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
