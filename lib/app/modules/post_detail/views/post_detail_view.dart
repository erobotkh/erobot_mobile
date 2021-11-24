import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/post_detail_controller.dart';

class PostDetailView extends GetView<PostDetailController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PostDetailView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'PostDetailView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
