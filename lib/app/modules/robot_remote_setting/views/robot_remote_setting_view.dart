import 'package:erobot_mobile/app/modules/thumbstick/controllers/thumbstick_controller.dart';
import 'package:erobot_mobile/constants/config_constant.dart';
import 'package:erobot_mobile/mixins/toast.dart';
import 'package:erobot_mobile/widgets/er_back_button.dart';
import 'package:erobot_mobile/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

class RobotRemoteSettingView extends StatefulWidget {
  const RobotRemoteSettingView({Key? key}) : super(key: key);

  @override
  State<RobotRemoteSettingView> createState() => _RobotRemoteSettingViewState();
}

class _RobotRemoteSettingViewState extends State<RobotRemoteSettingView> with Toast {
  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
    super.initState();
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    ThumbstickController thumbstickController = Get.put(ThumbstickController());
    return Scaffold(
      appBar: AppBar(
        title: Text('Setting'),
        leading: ErBackButton(),
        elevation: 1,
      ),
      body: Form(
        key: _formKey,
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
              value: thumbstickController.remoteRobot?.moveFront ?? '',
              onSaved: (value) {
                print('SET front value: $value');
                if (value != null) {
                  thumbstickController.remoteRobot?.moveFront = value;
                } else {
                  return;
                }
              },
            ),
            buildSettingButton(
              context,
              label: "Move left",
              icon: Icons.keyboard_arrow_left,
              value: thumbstickController.remoteRobot?.moveLeft ?? '',
              onSaved: (value) {
                if (value != null) {
                  thumbstickController.remoteRobot?.moveLeft = value;
                } else {
                  return;
                }
              },
            ),
            buildSettingButton(
              context,
              label: "Move back",
              icon: Icons.keyboard_arrow_down,
              value: thumbstickController.remoteRobot?.moveBack ?? '',
              onSaved: (value) {
                if (value != null) {
                  thumbstickController.remoteRobot?.moveBack = value;
                } else {
                  return;
                }
              },
            ),
            buildSettingButton(
              context,
              label: "Move right",
              icon: Icons.keyboard_arrow_right,
              value: thumbstickController.remoteRobot?.moveRight ?? '',
              onSaved: (value) {
                if (value != null) {
                  thumbstickController.remoteRobot?.moveRight = value;
                } else {
                  return;
                }
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_formKey.currentState?.validate() == true) {
            _formKey.currentState?.save();
            thumbstickController.updateConfig(thumbstickController.remoteRobot);
            showToast('Saved');
          }
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
    required Function(String?) onSaved,
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
          onSaved: onSaved,
        ),
      ),
    );
  }
}
