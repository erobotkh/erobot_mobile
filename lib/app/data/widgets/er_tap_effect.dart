import 'package:erobot_mobile/constants/config_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum ErTapEffectType {
  touchableOpacity,
  scaleDown,
}

class ErTapEffect extends GetView<_ErTapEffectController> {
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

  final double scaleActive = 0.98;
  final double opacityActive = 0.2;

  @override
  Widget build(BuildContext context) {
    final animation = Tween<double>(begin: 1, end: scaleActive).animate(controller.controller);
    final animation2 = Tween<double>(begin: 1, end: opacityActive).animate(controller.controller);

    void onTapCancel() => controller.controller.reverse();
    void onTapDown() => controller.controller.forward();
    void onTapUp() => controller.controller.reverse().then((value) => onTap!());

    if (onTap != null) {
      return GestureDetector(
        behavior: behavior,
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
      child: child,
      animation: controller.controller,
      builder: (context, child) {
        Widget result = child ?? const SizedBox();
        for (var effect in effects) {
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

class _ErTapEffectController extends GetxController with SingleGetTickerProviderMixin {
  late AnimationController controller;

  @override
  void onInit() {
    controller = AnimationController(vsync: this, duration: ConfigConstant.fadeDuration);
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    controller.dispose();
    super.onClose();
  }
}
