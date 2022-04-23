import 'package:erobot_mobile/constants/config_constant.dart';
import 'package:flutter/material.dart';

class ERLoading extends StatelessWidget {
  const ERLoading({Key? key, this.loading = true}) : super(key: key);

  final bool loading;
  @override
  Widget build(BuildContext context) {
    if (loading) {
      return Container(
        alignment: Alignment.center,
        height: 100,
        width: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(ConfigConstant.radius2),
          color: Theme.of(context).colorScheme.surface,
        ),
        child: CircularProgressIndicator(),
      );
    } else {
      return Text("Loaded");
    }
  }
}

class ERCircularLoading extends StatelessWidget {
  const ERCircularLoading({
    Key? key,
    required this.loading,
    this.elevation = 1.0,
  }) : super(key: key);

  final bool loading;
  final double elevation;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(accentColor: Theme.of(context).colorScheme.primary),
      child: AnimatedOpacity(
        duration: ConfigConstant.fadeDuration,
        opacity: loading ? 1 : 0,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Transform.scale(
              scale: 0.6,
              child: Material(
                elevation: elevation,
                color: Theme.of(context).colorScheme.surface,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(kToolbarHeight),
                ),
                child: Container(
                  padding: const EdgeInsets.all(ConfigConstant.margin2),
                  child: CircularProgressIndicator(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
