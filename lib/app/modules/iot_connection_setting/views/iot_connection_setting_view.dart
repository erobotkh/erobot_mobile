import 'package:erobot_mobile/mixins/toast.dart';
import 'package:erobot_mobile/services/iot/base_iot_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/iot_connection_setting_controller.dart';

class IotConnectionSettingView extends GetView<IotConnectionSettingController> with Toast {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('IotConnectionSettingView'),
        centerTitle: true,
      ),
      body: ListView(
        children: buildIotServicesList(),
      ),
    );
  }

  List<Widget> buildIotServicesList() {
    return [
      for (var service in controller.services)
        Obx(() {
          return RadioListTile(
            title: Text(service.name),
            subtitle: Text(service.subtitle),
            value: service.value,
            groupValue: controller.groupValue.value,
            onChanged: (value) async {
              controller.groupValue.value = service.value;
              if (controller.baseIotService == null) {
                BaseIotService? iotService = await controller.getIotService(service.routeName);
                if (iotService != null) {
                  controller.baseIotService = iotService;
                  showToast("Connected");
                  Get.back(result: iotService);
                }
              }
            },
          );
        }),
    ];
  }
}
