import 'package:erobot/widgets/er_tap_effect.dart';
import 'package:flutter/material.dart';

class ERTextField extends StatelessWidget {
  const ERTextField({
    Key? key,
    this.controller,
    this.password = false,
    this.showPassword = false,
    this.keyboardType,
    this.labelText,
    this.hintLabel,
    this.onPressed,
  }) : super(key: key);

  final TextEditingController? controller;
  final bool password;
  final bool showPassword;
  final TextInputType? keyboardType;
  final String? labelText;
  final String? hintLabel;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: password,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        hintStyle: Theme.of(context).textTheme.bodyText1,
        labelText: labelText,
        labelStyle: Theme.of(context).textTheme.caption,
        suffixIcon: password ? buildSuffixIcon(context) : null,
      ),
    );
  }

  Widget buildSuffixIcon(BuildContext context) {
    return ERTapEffect(
      child: Icon(
        showPassword ? Icons.visibility : Icons.visibility_off_rounded,
        color: Theme.of(context).colorScheme.onPrimary.withOpacity(0.5),
        size: 20,
      ),
      onTap: onPressed ?? () {},
    );
  }
}
