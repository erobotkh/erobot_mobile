import 'package:flutter/material.dart';

class Listtile extends StatelessWidget {
  final String title;
  final String subtitle;
  final String img;

  const Listtile(
      {Key? key,
      required this.title,
      required this.subtitle,
      required this.img})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    return Container(
      child: Column(
        children: [
          InkWell(
            child: ListTile(
              leading: CircleAvatar(
                radius: 20,
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage(img),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              title: Text(
                title,
                style: _theme.textTheme.bodyText2,
              ),
              subtitle: Text(subtitle,
                  style: _theme.textTheme.caption
                      ?.copyWith(color: _theme.colorScheme.secondary)),
              trailing: Icon(
                Icons.arrow_forward_ios_rounded,
                size: 15,
                color: _theme.colorScheme.secondary,
              ),
            ),
            onTap: (){},
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Divider(
              color: _theme.colorScheme.onPrimary,
            ),
          ),
        ],
      ),
    );
  }
}
