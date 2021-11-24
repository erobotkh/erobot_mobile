import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/ball_shooter_controller.dart';

class BallShooterView extends GetView<BallShooterController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BallShooterView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'BallShooterView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
