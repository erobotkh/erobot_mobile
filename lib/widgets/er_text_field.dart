import 'package:erobot/widgets/er_tap_effect.dart';
import 'package:flutter/material.dart';

class ERTextField extends StatelessWidget {
  const ERTextField({
    Key? key,
    this.controller,
    this.password = false,
    this.hidePassword = true,
    this.keyboardType,
    this.labelText,
    this.hintLabel,
    this.onHidePassword,
    this.onChange,
    this.onSubmitted,
  }) : super(key: key);

  final TextEditingController? controller;
  final bool password;
  final bool hidePassword;
  final TextInputType? keyboardType;
  final String? labelText;
  final String? hintLabel;
  final void Function()? onHidePassword;
  final void Function(String)? onChange;
  final void Function(String)? onSubmitted;

  @override
  Widget build(BuildContext context) {
    InputDecoration inputDecoration = InputDecoration(
      hintStyle: Theme.of(context).textTheme.bodyText1,
      labelText: labelText,
      labelStyle: Theme.of(context).textTheme.caption,
      suffixIcon: password ? buildSuffixIcon(context) : null,
    );

    return TextField(
      controller: controller,
      obscureText: password && hidePassword,
      keyboardType: TextInputType.text,
      decoration: inputDecoration,
      onChanged: onChange,
      onSubmitted: onSubmitted,
    );
  }

  Widget buildSuffixIcon(BuildContext context) {
    return ERTapEffect(
      child: Icon(
        hidePassword ? Icons.visibility_off_rounded : Icons.visibility,
        color: Theme.of(context).colorScheme.onPrimary.withOpacity(0.5),
        size: 20,
      ),
      onTap: onHidePassword ?? () {},
    );
  }
}
