import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:erobot_mobile/constants/config_constant.dart';
import 'package:erobot_mobile/models/ui_model/remoter_button_model.dart';
import 'package:erobot_mobile/widgets/er_back_button.dart';
import 'package:erobot_mobile/widgets/widgets.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/setting_ir_remoter_controller.dart';

class SettingIrRemoterView extends GetView<SettingIrRemoterController> {
  @override
  Widget build(BuildContext context) {
    List<RemotterButtonModel> remoteButtonList = RemotterButtonModel.getButtonList(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        leading: ErBackButton(),
        title: Text('Setting IR Remoter'),
      ),
      body: Container(
        color: Theme.of(context).colorScheme.surface,
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: ConfigConstant.margin2, vertical: ConfigConstant.margin2),
          children: [
            // SizedBox(height: ConfigConstant.objectHeight1),
            Text('All Devices'),
            SizedBox(height: ConfigConstant.margin1),
            Divider(height: 0),
            Column(
              children: List.generate(
                remoteButtonList.length,
                (index) {
                  RemotterButtonModel remoteButton = remoteButtonList[index];
                  return Column(
                    children: [
                      ErTapEffect(
                        child: ListTile(
                          title: Text(remoteButton.label.toString()),
                          trailing: Icon(
                            Icons.keyboard_arrow_right,
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                        ),
                        onTap: () {
                          showTextInputDialog(
                            context: context,
                            title: 'Set words for sending',
                            message: 'You should type to determind it is send to robot',
                            textFields: [
                              DialogTextField(),
                            ],
                          );
                        },
                      ),
                      Divider(height: 0),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
