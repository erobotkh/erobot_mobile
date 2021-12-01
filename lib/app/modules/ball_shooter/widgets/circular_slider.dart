import 'package:erobot_mobile/configs/config_constant.dart';
import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class CircularSlider extends StatelessWidget {
  final Color? color;
  final void Function()? onTap;
  final IconData? icon;

  const CircularSlider({
    this.color,
    this.onTap,
    this.icon,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SleekCircularSlider(
      appearance: _buildSliderAppearance(context),
      innerWidget: (value) {
        return _buildInnerWidget(value, context);
      },
      initialValue: 0,
      min: 0,
      max: 5,
      onChange: (value) {
        print(value);
      },
    );
  }

  Stack _buildInnerWidget(double value, BuildContext context) {
    return Stack(
      children: [
        Transform.translate(
          child: Text('Speed: ${value.toInt()}'),
          offset: Offset(8, -6),
        ),
        Center(
          child: Container(
            height: ConfigConstant.objectHeight5,
            width: ConfigConstant.objectHeight5,
            decoration: BoxDecoration(
              color: color ?? Theme.of(context).colorScheme.primary,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: Icon(
                icon ?? Icons.gps_fixed,
                size: ConfigConstant.iconSize4,
                color: Theme.of(context).colorScheme.onSurface,
              ),
              onPressed: () {
                print('shoot.....');
              },
            ),
          ),
        ),
      ],
    );
  }

  CircularSliderAppearance _buildSliderAppearance(BuildContext context) {
    return CircularSliderAppearance(
      startAngle: 90,
      angleRange: 180,
      counterClockwise: true,
      customColors: CustomSliderColors(
        trackColor: Theme.of(context).colorScheme.onSurface,
        progressBarColor: color ?? Theme.of(context).colorScheme.primary,
      ),
      customWidths: CustomSliderWidths(
        progressBarWidth: 10,
      ),
    );
  }
}
