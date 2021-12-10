import 'package:erobot_mobile/constants/config_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import '../controllers/ball_shooter_controller.dart';

import '../widgets/widgets.dart';

class BallShooterView extends GetView<BallShooterController> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.surface,
        child: Icon(
          Icons.settings,
          color: Theme.of(context).colorScheme.onSurface,
        ),
        onPressed: () {
          print('setting');
        },
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
        title: 'Ball Shooter',
        action: [
          IconButton(
            icon: Icon(
              Icons.bluetooth,
              color: Colors.white,
            ),
            onPressed: () => print('bluetooth'),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(ConfigConstant.margin2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    PadButtons(
                      onLeft: () => print('onLeft'),
                      onRight: () => print('onRight'),
                      onUp: () => print('onUp'),
                      onDown: () => print('onDown'),
                    ),
                    CircularSlider(),
                  ],
                ),
              ),
              Obx(() {
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
                            activeTrackColor: Theme.of(context).colorScheme.primaryVariant,
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
              }),
            ],
          ),
        ),
      ),
    );
  }
}
