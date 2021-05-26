import 'package:erobot/config/config_constant.dart';
import 'package:erobot/screens/home/ball_shooter/local_widget/pad_bottons.dart';
import 'package:erobot/screens/home/ball_shooter/local_widget/customer_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'ball_shooter/local_widget/circular_slider.dart';

class ArduinoCarScreen extends HookWidget {
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
        onPressed: () {
          print('setting');
        },
      ),
      appBar: CustomerAppBar(
        title: 'Arduino Car',
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    PadButtons(
                      onLeft: () => print('onLeft'),
                      onRight: () => print('onRight'),
                      onUp: () => print('onUp'),
                      onDown: () => print('onDown'),
                    ),
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
