import 'package:erobot_mobile/app/modules/iot_connection_setting/controllers/iot_controller.dart';
import 'package:erobot_mobile/app/modules/joystick/widgets/widgets.dart';
import 'package:erobot_mobile/app/routes/app_pages.dart';
import 'package:erobot_mobile/constants/config_constant.dart';
import 'package:erobot_mobile/mixins/toast.dart';
import 'package:erobot_mobile/services/iot/base_iot_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../controllers/thumbstick_controller.dart';

class ThumbstickView extends GetView<ThumbstickController> with Toast {
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeRight,
        DeviceOrientation.landscapeLeft,
      ]);
    });
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.surface,
        child: Icon(
          Icons.settings,
          color: Theme.of(context).colorScheme.onSurface,
        ),
        onPressed: () => Get.toNamed(Routes.ROBOT_REMOTE_SETTING),
      ),
      appBar: CustomAppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
            SystemChrome.setPreferredOrientations([
              DeviceOrientation.portraitUp,
              DeviceOrientation.portraitDown,
            ]);
          },
        ),
        title: 'Thumbstick',
        color: Colors.blue,
        action: [
          IconButton(
            icon: Icon(
              Icons.bluetooth,
              color: Colors.white,
            ),
            onPressed: () {
              Get.toNamed(Routes.IOT_CONNECTION_SETTING)?.then((value) async {
                if (value is BaseIotService) {
                  iot.setService(value);
                }
              });
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  PadButtons(
                    onTapUp: () => sendAMessage("S"),
                    onLeft: () => sendAMessage(controller.moveLeft.value),
                    onRight: () => sendAMessage(controller.moveRight.value),
                    onUp: () => sendAMessage(controller.moveFront.value),
                    onDown: () => sendAMessage(controller.moveBack.value),
                  ),
                  const SizedBox(),
                  CircularSlider(
                    color: Colors.blue,
                    icon: Icons.flash_on,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  IotController get iot => Get.find<IotController>();

  Future<void> sendAMessage(String? message) async {
    print(message);
    if (message == null) return;
    if (iot.lastMessage == message) return;

    print("${DateTime.now().millisecond}: $message");
    await iot.write(message);
    showToast(message);
  }
}
