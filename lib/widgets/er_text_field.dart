import 'package:erobot_mobile/constants/config_constant.dart';
import 'package:flutter/material.dart';

class ErTextField extends StatefulWidget {
  const ErTextField({
    Key? key,
    this.obscureText = false,
    this.autocorrect = true,
    this.maxLines,
    this.minLines,
    this.value,
    this.labelText,
    this.hintText,
    this.fillColor,
    this.hintColor,
    this.margin,
    this.borderSide,
    this.border,
    this.focusedBorder,
    this.keyboardType,
    this.controller,
    this.textInputAction,
    this.textAlign,
    this.suffix,
    this.suffixIcon,
    this.prefix,
    this.prefixIcon,
    this.onChanged,
    this.onSubmitted,
    this.onSaved,
    this.validator,
    this.onTap,
  }) : super(key: key);

  final bool obscureText;
  final bool autocorrect;
  final int? maxLines;
  final int? minLines;
  final String? value;
  final String? labelText;
  final String? hintText;
  final Color? fillColor;
  final Color? hintColor;

  final EdgeInsets? margin;
  final BorderSide? borderSide;
  final InputBorder? border;
  final InputBorder? focusedBorder;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final TextInputAction? textInputAction;
  final TextAlign? textAlign;

  final Widget? suffix;
  final Widget? suffixIcon;
  final Widget? prefix;
  final Widget? prefixIcon;

  final void Function(String value)? onChanged;
  final void Function(String value)? onSubmitted;
  final void Function(String? value)? onSaved;
  final String? Function(String?)? validator;
  final void Function()? onTap;

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
      child: TextFormField(
        textAlign: widget.textAlign ?? TextAlign.start,
        keyboardType: widget.keyboardType,
        textInputAction: widget.textInputAction,
        controller: widget.controller ?? controller,
        onChanged: widget.onChanged,
        onFieldSubmitted: widget.onSubmitted,
        autocorrect: widget.autocorrect,
        obscureText: widget.obscureText,
        decoration: buildInputDecoration(colorScheme),
        maxLines: widget.maxLines,
        minLines: widget.minLines,
        onTap: widget.onTap,
        readOnly: readOnly,
        validator: widget.validator,
        onSaved: widget.onSaved,
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
      focusedBorder: widget.focusedBorder,
      border: widget.border ??
          UnderlineInputBorder(
            borderRadius: ConfigConstant.circlarRadiusTop1,
            borderSide: widget.borderSide ?? BorderSide(color: colorScheme.primary),
          ),
      contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 8.0),
      suffix: widget.suffix,
      suffixIcon: widget.suffixIcon,
      prefix: widget.prefix,
      prefixIcon: widget.prefixIcon,
    );
  }
}
