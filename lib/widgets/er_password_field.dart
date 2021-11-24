import 'package:erobot_mobile/widgets/er_text_field.dart';
import 'package:erobot_mobile/constants/config_constant.dart';
import 'package:flutter/material.dart';

class ErPasswordField extends StatefulWidget {
  const ErPasswordField({
    Key? key,
    this.onChanged,
    this.onSubmitted,
  }) : super(key: key);

  final void Function(String value)? onChanged;
  final void Function(String value)? onSubmitted;

  @override
  _ErPasswordFieldState createState() => _ErPasswordFieldState();
}

class _ErPasswordFieldState extends State<ErPasswordField> {
  late bool obscureText;

  @override
  void initState() {
    obscureText = true;
    super.initState();
  }

  String? get labelText => "Password";
  TextInputAction? get textInputAction => TextInputAction.go;
  TextInputType? get keyboardType => TextInputType.visiblePassword;

  @override
  Widget build(BuildContext context) {
    return ErTextField(
      labelText: labelText,
      textInputAction: textInputAction,
      keyboardType: keyboardType,
      onChanged: widget.onChanged,
      onSubmitted: widget.onSubmitted,
      obscureText: obscureText,
      maxLines: 1,
      suffix: buildSuffix(),
    );
  }

  Widget? buildSuffix() {
    return IconButton(
      color: Theme.of(context).colorScheme.onBackground,
      icon: AnimatedCrossFade(
        crossFadeState: obscureText ? CrossFadeState.showSecond : CrossFadeState.showFirst,
        duration: ConfigConstant.fadeDuration,
        secondChild: const Icon(Icons.visibility_off),
        firstChild: const Icon(Icons.visibility),
      ),
      onPressed: () {
        setState(() {
          obscureText = !obscureText;
        });
      },
    );
  }
}
