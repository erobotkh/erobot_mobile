import 'package:erobot_mobile/app/data/widgets/er_text_field.dart';
import 'package:flutter/material.dart';

class ErEmailField extends ErTextField {
  const ErEmailField({
    Key? key,
    void Function(String value)? onChanged,
    void Function(String value)? onSubmitted,
  }) : super(key: key, onChanged: onChanged, onSubmitted: onSubmitted);

  @override
  String? get labelText => "Email";

  @override
  bool get autocorrect => false;

  @override
  TextInputAction? get textInputAction => TextInputAction.next;

  @override
  TextInputType? get keyboardType => TextInputType.emailAddress;
}
