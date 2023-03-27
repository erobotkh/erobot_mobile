import 'package:erobot_mobile/app/routes/app_pages.dart';
import 'package:erobot_mobile/constants/config_constant.dart';
import 'package:erobot_mobile/models/ui_model/remoter_button_model.dart';
import 'package:erobot_mobile/widgets/er_back_button.dart';
import 'package:erobot_mobile/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:get/get.dart';

import '../controllers/ir_remoter_controller.dart';

class IrRemoterView extends GetView<IrRemoterController> {
  @override
  Widget build(BuildContext context) {
    List<RemotterButtonModel> remoteButtonList = RemotterButtonModel.getButtonList(context);
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        leading: ErBackButton(),
        automaticallyImplyLeading: true,
        title: Text(
          'IR Remoter',
        ),
        actions: [
          Container(
            height: ConfigConstant.objectHeight2,
            width: ConfigConstant.objectHeight2,
            child: ErTapEffect(
              child: Icon(Icons.bluetooth),
              onTap: () => Get.toNamed(Routes.BLUETOOTH_LIST),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 72.0,
          vertical: 16,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/channel.png'),
            MasonryGridView.count(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 3,
              itemCount: remoteButtonList.length,
              mainAxisSpacing: 12,
              itemBuilder: (BuildContext context, int index) {
                RemotterButtonModel remoteButton = remoteButtonList[index];
                return Column(
                  children: [
                    Text(
                      remoteButton.showLabel ? remoteButton.label : '',
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                    ErTapEffect(
                      onTap: remoteButton.onTap,
                      child: Container(
                        width: ConfigConstant.objectHeight3,
                        height: ConfigConstant.objectHeight3,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: remoteButton.color,
                        ),
                        child: remoteButton.child,
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 1,
        backgroundColor: Theme.of(context).colorScheme.surface,
        child: Icon(
          Icons.settings,
          color: Theme.of(context).colorScheme.onSurface,
          size: ConfigConstant.iconSize2,
        ),
        onPressed: () {
          Get.toNamed(Routes.SETTING_IR_REMOTER);
        },
      ),
    );
  }
}
