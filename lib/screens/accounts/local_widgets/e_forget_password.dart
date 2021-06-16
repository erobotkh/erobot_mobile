import 'package:erobot/config/config_constant.dart';
import 'package:flutter/material.dart';

class ForgetPassword extends StatelessWidget {
  final String name;
  final String onTap;

  const ForgetPassword({Key? key, required this.name, required this.onTap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.only(right: ConfigConstant.margin2),
      alignment: Alignment.centerRight,
      child: InkWell(
        onTap: () {
          // onTap;
        },
        child: Text(name, style: _theme.textTheme.caption?.copyWith(color: _theme.colorScheme.secondaryVariant)),
      ),
    );
  }
}
