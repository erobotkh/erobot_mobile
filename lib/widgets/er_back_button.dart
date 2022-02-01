import 'package:erobot_mobile/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ErBackButton extends StatelessWidget {
  const ErBackButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ErTapEffect(
      child: Icon(Icons.arrow_back),
      onTap: () => Navigator.pop(context),
    );
  }
}
