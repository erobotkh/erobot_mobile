import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/account_detail_controller.dart';

class AccountDetailView extends GetView<AccountDetailController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AccountDetailView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'AccountDetailView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
