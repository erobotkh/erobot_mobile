import 'package:erobot_mobile/constants/config_constant.dart';
import 'package:flutter/material.dart';

class PadButtons extends StatelessWidget {
  final void Function()? onLeft;
  final void Function()? onUp;
  final void Function()? onRight;
  final void Function()? onDown;

  const PadButtons({
    Key? key,
    this.onLeft,
    this.onUp,
    this.onRight,
    this.onDown,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 168,
      width: 168,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildPadButton(
            context: context,
            icon: Icons.keyboard_arrow_left,
            onTap: onLeft,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildPadButton(
                context: context,
                icon: Icons.keyboard_arrow_up,
                onTap: onUp,
              ),
              _buildPadButton(
                context: context,
                icon: Icons.keyboard_arrow_down,
                onTap: onDown,
              ),
            ],
          ),
          _buildPadButton(
            context: context,
            icon: Icons.keyboard_arrow_right,
            onTap: onRight,
          ),
        ],
      ),
    );
  }

  _buildPadButton({
    required BuildContext context,
    required IconData icon,
    void Function()? onTap,
  }) {
    return Container(
      width: 56,
      height: 56,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        icon: Icon(
          icon,
          size: ConfigConstant.iconSize2,
          color: Colors.white,
        ),
        onPressed: onTap,
      ),
    );
  }
}
