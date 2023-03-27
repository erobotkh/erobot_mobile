import 'package:erobot_mobile/app/modules/iot_connection_setting/controllers/iot_controller.dart';
import 'package:erobot_mobile/app/modules/joystick/controllers/joystick_controller.dart';
import 'package:erobot_mobile/app/modules/joystick/widgets/widgets.dart';
import 'package:erobot_mobile/app/routes/app_pages.dart';
import 'package:erobot_mobile/constants/config_constant.dart';
import 'package:erobot_mobile/mixins/toast.dart';
import 'package:erobot_mobile/services/iot/base_iot_service.dart';
import 'package:erobot_mobile/widgets/er_joystick.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class JoystickView extends GetView<JoystickController> with Toast {
  IotController get iot => Get.find<IotController>();

  Future<void> sendAMessage(String? message) async {
    if (message == null) return;
    if (iot.lastMessage == message) return;

    print("${DateTime.now().millisecond}: $message");
    await iot.write(message);
    showToast(message);
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeRight,
        DeviceOrientation.landscapeLeft,
      ]);
    });
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.surface,
        child: Text("P"),
        onPressed: () => sendAMessage("P"),
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
        title: 'Joystick',
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
      body: Padding(
        padding: EdgeInsets.all(ConfigConstant.margin2),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(width: ConfigConstant.objectHeight1),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  buildJoystick(),
                  const SizedBox(),
                  PadButtons(
                    onLeft: () => sendAMessage("C"),
                    onRight: () => sendAMessage("A"),
                    onUp: () => sendAMessage("W"),
                    onDown: () => sendAMessage("S"),
                    onTapUp: () => sendAMessage("S"),
                  ),
                  // CircularSlider(),
                ],
              ),
            ),
            buildServo(context),
          ],
        ),
      ),
    );
  }

  Widget buildJoystick() {
    return ErJoystick(
      interval: Duration.zero,
      size: 144,
      onSpecificDirectionChanged: (ErJoystickDirection? direction) {
        String? text;
        switch (direction) {
          case ErJoystickDirection.Top:
            text = "T";
            break;
          case ErJoystickDirection.TopRight:
            text = "W";
            break;
          case ErJoystickDirection.Right:
            text = "R";
            break;
          case ErJoystickDirection.BottomRight:
            text = "M";
            break;
          case ErJoystickDirection.Bottom:
            text = "B";
            break;
          case ErJoystickDirection.BottomLeft:
            text = "H";
            break;
          case ErJoystickDirection.Left:
            text = "L";
            break;
          case ErJoystickDirection.TopLeft:
            text = "V";
            break;
          case ErJoystickDirection.Stop:
            text = "S";
            break;
          default:
            text = null;
            break;
        }
        sendAMessage(text);
      },
    );
  }

  Widget buildServo(BuildContext context) {
    return Obx(() {
      return Container(
        width: 400,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Servo: '),
            Expanded(
              child: SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  activeTrackColor: Theme.of(context).colorScheme.primaryContainer,
                  inactiveTrackColor: Theme.of(context).colorScheme.secondary,
                  thumbColor: Theme.of(context).colorScheme.primary,
                  trackShape: RectangularSliderTrackShape(),
                  trackHeight: 2,
                ),
                child: Slider(
                  value: controller.servoSpeed.value.toDouble(),
                  min: 0,
                  max: 5,
                  divisions: 5,
                  onChanged: (value) {
                    controller.servoSpeed.value = value.toInt();
                  },
                ),
              ),
            ),
            Text('${controller.servoSpeed.value}'),
          ],
        ),
      );
    });
  }
}
