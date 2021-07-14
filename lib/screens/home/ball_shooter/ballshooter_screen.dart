import 'package:erobot/config/config_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'local_widgets/circular_slider.dart';
import 'local_widgets/custom_app_bar.dart';
import 'local_widgets/pad_bottons.dart';

class BallShooterScreen extends HookWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
    final servoSpeed = useState<int>(0);
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
          padding: const EdgeInsets.all(ConfigConstant.margin2),
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
              _buildServoSpeedSlider(context, servoSpeed),
            ],
          ),
        ),
      ),
    );
  }

  Container _buildServoSpeedSlider(BuildContext context, ValueNotifier<int> servoSpeed) {
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
                value: servoSpeed.value.toDouble(),
                min: 0,
                max: 5,
                divisions: 5,
                onChanged: (value) {
                  servoSpeed.value = value.toInt();
                },
              ),
            ),
          ),
          Text('${servoSpeed.value}'),
        ],
      ),
    );
  }
}
