import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/education_controller.dart';

class EducationView extends GetView<EducationController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('EducationView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'EducationView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
