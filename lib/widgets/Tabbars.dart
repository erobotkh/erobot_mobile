import 'package:erobot/constant/theme_constant.dart';
import 'package:flutter/material.dart';

class Tabbars extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        gradient: ThemeConstant.redGradient,
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            Container(
              width: 110,
              height: 50,
              alignment: Alignment.center,
              child: Text(
                "ROBOT",
                style: _theme.textTheme.button,
              ),
            ),
            Container(
              width: 110,
              height: 50,
              alignment: Alignment.center,
              child: Text(
                "CODING",
                style: _theme.textTheme.button,
              ),
            ),
            Container(
              width: 110,
              height: 50,
              alignment: Alignment.center,
              child: Text(
                "EDUCATION",
                style: _theme.textTheme.button,
              ),
            ),
            Container(
              width: 110,
              height: 50,
              alignment: Alignment.center,
              child: Text(
                "EXPERIENCE",
                style: _theme.textTheme.button,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
