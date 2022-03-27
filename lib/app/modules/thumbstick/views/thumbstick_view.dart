import 'package:erobot_mobile/app/modules/iot_connection_setting/controllers/iot_controller.dart';
import 'package:erobot_mobile/app/modules/joystick/widgets/widgets.dart';
import 'package:erobot_mobile/app/modules/thumbstick/controllers/thumbstick_controller.dart';
import 'package:erobot_mobile/app/routes/app_pages.dart';
import 'package:erobot_mobile/mixins/toast.dart';
import 'package:erobot_mobile/services/iot/base_iot_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ThumbstickView extends StatefulWidget {
  const ThumbstickView({Key? key}) : super(key: key);

  @override
  State<ThumbstickView> createState() => _ThumbstickViewState();
}

class _ThumbstickViewState extends State<ThumbstickView> with Toast {
  late ThumbstickController thumbstickController;
  late IotController iot;

  @override
  void initState() {
    thumbstickController = Get.put(ThumbstickController());
    iot = Get.put(IotController());

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
    super.initState();
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                    onLeft: () => sendAMessage(thumbstickController.remoteRobot?.moveLeft),
                    onRight: () => sendAMessage(thumbstickController.remoteRobot?.moveRight),
                    onUp: () => sendAMessage(thumbstickController.remoteRobot?.moveFront),
                    onDown: () => sendAMessage(thumbstickController.remoteRobot?.moveBack),
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

  Future<void> sendAMessage(String? message) async {
    if (message == null) return;
    if (iot.lastMessage == message) return;

    await iot.write(message);
    showToast(message);
  }
}
