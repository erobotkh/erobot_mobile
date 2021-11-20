import 'package:flutter/material.dart';

enum ErTapEffectType {
  touchableOpacity,
  scaleDown,
}

class ErTapEffect extends StatefulWidget {
  ErTapEffect({
    Key? key,
    required this.child,
    required this.onTap,
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

  @override
  State<ErTapEffect> createState() => _ErTapEffectState();
}

class _ErTapEffectState extends State<ErTapEffect> with SingleTickerProviderStateMixin {
  final double scaleActive = 0.98;
  final double opacityActive = 0.2;

  late AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(vsync: this, duration: widget.duration);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final animation = Tween<double>(begin: 1, end: scaleActive).animate(controller);
    final animation2 = Tween<double>(begin: 1, end: opacityActive).animate(controller);

    void onTapCancel() => controller.reverse();
    void onTapDown() => controller.forward();
    void onTapUp() => controller.reverse().then((value) => widget.onTap!());

    if (widget.onTap != null) {
      return GestureDetector(
        behavior: widget.behavior,
        onTapDown: (detail) => onTapDown(),
        onTapUp: (detail) => onTapUp(),
        onTapCancel: () => onTapCancel(),
        child: buildChild(animation, animation2),
      );
    } else {
      return buildChild(animation, animation2);
    }
  }

  AnimatedBuilder buildChild(
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
