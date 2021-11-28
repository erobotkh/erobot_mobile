import 'package:erobot_mobile/app/routes/app_pages.dart';
import 'package:erobot_mobile/constants/theme_constant.dart';
import 'package:erobot_mobile/services/iot/base_iot_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IotConnectionSettingController extends GetxController {
  BaseIotService? baseIotService;

  Future<BaseIotService?> getIotService(String routeName) async {
    await Get.toNamed(routeName)?.then((value) {
      if (value is BaseIotService) {
        baseIotService = value;
      }
    });
    return baseIotService;
  }

  final Map<String, _IotSeviceModel> _servicesMap = {
    'flutter_bluetooth_serial': _IotSeviceModel(
      name: 'Bluetooth',
      subtitle: 'flutter_bluetooth_serial',
      iconData: Icons.bluetooth,
      iconBackgroundColor: ThemeConstant.blueGradient.colors.first,
      value: 'flutter_bluetooth_serial',
      routeName: Routes.BLUETOOTH_LIST,
    ),
    'mqtt_client': _IotSeviceModel(
      name: 'MQTT',
      subtitle: 'mqtt_client',
      iconData: Icons.wifi,
      iconBackgroundColor: ThemeConstant.purpleGradient.colors.first,
      value: 'mqtt_client',
      routeName: Routes.BLUETOOTH_LIST,
    ),
  };

  List<_IotSeviceModel> get services {
    return _servicesMap.entries.map((e) => e.value).toList();
  }

  Rx<String> groupValue = ''.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}

class _IotSeviceModel {
  final String name;
  final String subtitle;
  final IconData iconData;
  final Color iconBackgroundColor;
  final String value;
  final String routeName;

  _IotSeviceModel({
    required this.name,
    required this.subtitle,
    required this.iconData,
    required this.iconBackgroundColor,
    required this.value,
    required this.routeName,
  });
}
