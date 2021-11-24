import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/ir_remoter_controller.dart';

class IrRemoterView extends GetView<IrRemoterController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('IrRemoterView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'IrRemoterView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
