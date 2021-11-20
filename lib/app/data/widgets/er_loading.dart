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
