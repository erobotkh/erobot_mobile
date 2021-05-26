import 'package:flutter/material.dart';

class EBackButton extends StatelessWidget {
  const EBackButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      icon: Icon(Icons.arrow_back),
      onPressed: () => Navigator.pop(context),
    );
  }
}
