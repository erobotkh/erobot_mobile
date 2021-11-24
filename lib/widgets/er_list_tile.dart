import 'package:erobot_mobile/constants/config_constant.dart';
import 'package:flutter/material.dart';

class ErListTile extends StatelessWidget {
  const ErListTile({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.leadingIconData,
    this.onTap,
  }) : super(key: key);

  final String title;
  final String subtitle;
  final IconData leadingIconData;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          contentPadding: EdgeInsets.only(left: ConfigConstant.margin1),
          leading: AspectRatio(
            aspectRatio: 1,
            child: Icon(
              leadingIconData,
              color: Theme.of(context).colorScheme.onBackground,
            ),
          ),
          title: Text(title),
          subtitle: Text(subtitle),
          onTap: onTap,
        ),
        Divider(
          indent: ConfigConstant.margin2,
          height: 1,
        ),
      ],
    );
  }
}
