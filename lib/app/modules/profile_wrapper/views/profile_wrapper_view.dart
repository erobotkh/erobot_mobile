import 'package:erobot_mobile/app/data/widgets/er_loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/profile_wrapper_controller.dart';

class ProfileWrapperView extends GetView<ProfileWrapperController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ERLoading(),
      ),
    );
  }
}
