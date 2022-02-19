import 'package:erobot_mobile/app/modules/thumbstick/controllers/thumbstick_controller.dart';
import 'package:erobot_mobile/constants/config_constant.dart';
import 'package:erobot_mobile/mixins/toast.dart';
import 'package:erobot_mobile/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';

import '../controllers/robot_remote_setting_controller.dart';

class RobotRemoteSettingView extends GetView<RobotRemoteSettingController> with Toast {
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeRight,
        DeviceOrientation.landscapeLeft,
      ]);
    });

    return Scaffold(
      appBar: AppBar(
        title: Text('Robot Remote SettingView'),
        centerTitle: true,
        elevation: 1,
      ),
      body: SafeArea(
        child: GridView(
          padding: EdgeInsets.symmetric(vertical: ConfigConstant.margin2),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisExtent: 56,
            mainAxisSpacing: ConfigConstant.margin2,
            crossAxisSpacing: ConfigConstant.margin2,
          ),
          children: [
            buildSettingButton(
              context,
              label: "Move front",
              icon: Icons.keyboard_arrow_up,
              value: thumbstickController.moveFront.value,
            ),
            buildSettingButton(
              context,
              label: "Move left",
              icon: Icons.keyboard_arrow_left,
              value: thumbstickController.moveLeft.value,
            ),
            buildSettingButton(
              context,
              label: "Move back",
              icon: Icons.keyboard_arrow_down,
              value: thumbstickController.moveBack.value,
            ),
            buildSettingButton(
              context,
              label: "Move right",
              icon: Icons.keyboard_arrow_right,
              value: thumbstickController.moveRight.value,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showToast('Saved');
        },
        child: Icon(Icons.save),
      ),
    );
  }

  ListTile buildSettingButton(
    BuildContext context, {
    required String label,
    required String value,
    required IconData icon,
  }) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: ConfigConstant.margin2),
      tileColor: Theme.of(context).colorScheme.surface,
      leading: Container(
        height: 24,
        width: 24,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onSurface,
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          size: 18,
          color: Theme.of(context).colorScheme.surface,
        ),
      ),
      title: Text(label),
      trailing: Container(
        width: 56,
        child: ErTextField(
          textAlign: TextAlign.center,
          maxLines: 1,
          value: value,
          validator: (value) {
            if (value?.isEmpty == true) {
              return 'required';
            } else {
              return null;
            }
          },
        ),
      ),
    );
  }

  ThumbstickController get thumbstickController => Get.find<ThumbstickController>();
}
