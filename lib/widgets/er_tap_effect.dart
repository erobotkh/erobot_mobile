import 'package:flutter/material.dart';

enum ErTapEffectType {
  touchableOpacity,
  scaleDown,
}

class ErTapEffect extends StatefulWidget {
  ErTapEffect({
    Key? key,
    required this.child,
    this.onTap,
    this.onTapDown,
    this.onTapUp,
    this.duration = const Duration(milliseconds: 100),
    this.vibrate = false,
    this.behavior,
    this.effects = const [
      ErTapEffectType.touchableOpacity,
    ],
  }) : super(key: key);

  final Widget child;
  final List<ErTapEffectType> effects;
  final void Function()? onTap;
  final Duration duration;
  final bool vibrate;
  final HitTestBehavior? behavior;

  final void Function()? onTapUp;
  final void Function()? onTapDown;

  @override
  State<ErTapEffect> createState() => _ErTapEffectState();
}

class _ErTapEffectState extends State<ErTapEffect> with SingleTickerProviderStateMixin {
  static double scaleActive = 0.98;
  static double opacityActive = 0.2;

  late AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(vsync: this, duration: widget.duration);
    super.initState();
  }

  void onTapDown() {
    controller.forward();
    if (widget.onTapDown != null) {
      widget.onTapDown!();
    }
  }

  void onTapUp() {
    controller.reverse();
    if (widget.onTap != null) {
      widget.onTap!();
    } else if (widget.onTapUp != null) {
      widget.onTapUp!();
    }
  }

  Animation<double> get animation => Tween<double>(begin: 1, end: scaleActive).animate(controller);
  Animation<double> get animation2 => Tween<double>(begin: 1, end: opacityActive).animate(controller);

  @override
  Widget build(BuildContext context) {
    if (widget.onTap != null) {
      assert(widget.onTapDown == null && widget.onTapUp == null);
    }
    if (widget.onTapDown != null || widget.onTapUp != null) {
      assert(widget.onTap == null);
      assert(widget.onTapDown != null);
      assert(widget.onTapUp != null);
    }

    if (widget.onTap != null || widget.onTapUp != null) {
      return GestureDetector(
        behavior: widget.behavior,
        onTapDown: (detail) => onTapDown(),
        onTapUp: (detail) => onTapUp(),
        child: buildChild(animation, animation2),
      );
    } else {
      return buildChild(animation, animation2);
    }
  }

  Widget buildChild(
    Animation<double> animation,
    Animation<double> animation2,
  ) {
    return AnimatedBuilder(
      child: widget.child,
      animation: controller,
      builder: (context, child) {
        Widget result = child ?? const SizedBox();
        for (var effect in widget.effects) {
          switch (effect) {
            case ErTapEffectType.scaleDown:
              result = ScaleTransition(scale: animation, child: result);
              break;
            case ErTapEffectType.touchableOpacity:
              result = Opacity(opacity: animation2.value, child: result);
              break;
          }
        }
        return result;
      },
    );
  }
}
