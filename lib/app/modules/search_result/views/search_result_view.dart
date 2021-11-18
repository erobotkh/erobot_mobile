import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/search_result_controller.dart';

class SearchResultView extends GetView<SearchResultController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SearchResultView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'SearchResultView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
