import 'package:erobot_mobile/constants/config_constant.dart';
import 'package:flutter/material.dart';

class ErTextField extends StatefulWidget {
  const ErTextField({
    Key? key,
    this.controller,
    this.value,
    this.labelText,
    this.hintText,
    this.maxLines,
    this.minLines,
    this.prefix,
    this.suffix,
    this.fillColor,
    this.onChanged,
    this.onSubmitted,
    this.obscureText = false,
    this.autocorrect = true,
    this.keyboardType,
    this.textInputAction,
    this.borderSide,
    this.onTap,
    this.hintColor,
    this.margin,
  }) : super(key: key);

  final BorderSide? borderSide;
  final TextEditingController? controller;
  final String? value;
  final String? labelText;
  final String? hintText;
  final int? maxLines;
  final int? minLines;
  final Widget? suffix;
  final Widget? prefix;
  final Color? fillColor;
  final Color? hintColor;
  final bool obscureText;
  final void Function(String value)? onChanged;
  final void Function(String value)? onSubmitted;
  final bool autocorrect;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final void Function()? onTap;
  final EdgeInsets? margin;

  @override
  _ErTextFieldState createState() => _ErTextFieldState();
}

class _ErTextFieldState extends State<ErTextField> {
  late TextEditingController controller;
  late bool readOnly;

  @override
  void initState() {
    controller = widget.controller ?? TextEditingController(text: widget.value ?? "");
    readOnly = widget.onTap != null;
    super.initState();
  }

  @override
  void dispose() {
    if (widget.controller != null) controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      margin: widget.margin ?? const EdgeInsets.only(bottom: ConfigConstant.margin0),
      child: TextField(
        keyboardAppearance: colorScheme.brightness,
        keyboardType: widget.keyboardType,
        textInputAction: widget.textInputAction,
        controller: widget.controller ?? controller,
        onChanged: widget.onChanged,
        onSubmitted: widget.onSubmitted,
        autocorrect: widget.autocorrect,
        obscureText: widget.obscureText,
        decoration: buildInputDecoration(colorScheme),
        maxLines: widget.maxLines,
        minLines: widget.minLines,
        onTap: widget.onTap,
        readOnly: readOnly,
      ),
    );
  }

  InputDecoration buildInputDecoration(ColorScheme colorScheme) {
    return InputDecoration(
      labelText: widget.labelText,
      hintText: widget.hintText,
      fillColor: widget.fillColor ?? colorScheme.background,
      filled: true,
      hintStyle: TextStyle(color: widget.hintColor),
      labelStyle: Theme.of(context).textTheme.bodyText2,
      border: UnderlineInputBorder(
        borderRadius: ConfigConstant.circlarRadiusTop1,
        borderSide: widget.borderSide ?? BorderSide(color: colorScheme.primary),
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 8.0),
      suffixIcon: widget.suffix,
      prefix: widget.prefix,
    );
  }
}
