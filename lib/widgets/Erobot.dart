import 'package:erobot/constant/theme_constant.dart';
import 'package:flutter/material.dart';

class Erobot extends StatelessWidget {
  final String text;
  final String name;

  const Erobot({Key? key, required this.text, required this.name})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    return AspectRatio(
      aspectRatio: 375 / 96,
      child: Container(
        decoration: BoxDecoration(
          gradient: ThemeConstant.redGradient,
        ),
        child: Padding(
          padding: const EdgeInsets.only(right: 40, top: 10),
          child: Column(
            children: [
              ListTile(
                  title: Text(
                    name,
                    style: _theme.textTheme.bodyText1,
                  ),
                  subtitle: Text(
                    text,
                    style: _theme.textTheme.caption?.copyWith(
                      color: _theme.colorScheme.onPrimary.withOpacity(0.5),
                    ),
                  ),
                  trailing: Stack(
                    alignment: Alignment.bottomLeft,
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.people,
                          color: _theme.colorScheme.onPrimary,
                          size: 82,
                        ),
                        onPressed: () {},
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
