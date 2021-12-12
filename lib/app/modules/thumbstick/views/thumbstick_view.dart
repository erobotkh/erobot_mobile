import 'package:erobot_mobile/app/modules/joystick/widgets/widgets.dart';
import 'package:erobot_mobile/constants/config_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../controllers/thumbstick_controller.dart';

class ThumbstickView extends GetView<ThumbstickController> {
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
        title: 'Thumbstick',
        color: Colors.blue,
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
          padding: const EdgeInsets.all(ConfigConstant.margin2),
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
                      onLeft: () => print('onLeft'),
                      onRight: () => print('onRight'),
                      onUp: () => print('onUp'),
                      onDown: () => print('onDown'),
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
      ),
    );
  }
}
