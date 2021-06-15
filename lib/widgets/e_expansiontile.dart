import 'package:erobot/config/config_constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ExpanSionTile extends StatefulWidget {
  final String title;
  final String subTitle;
  final String img;
  final String textBody;
  final String textNamefb;
  final String textNameIg;
  final String textNameTg;
  final Function onTap;

  const ExpanSionTile(
      {Key? key,
      required this.title,
      required this.subTitle,
      required this.img,
      required this.onTap,
      required this.textBody,
      required this.textNamefb,
      required this.textNameIg,
      required this.textNameTg})
      : super(key: key);

  @override
  _ExpanSionTileState createState() => _ExpanSionTileState();
}

class _ExpanSionTileState extends State<ExpanSionTile> {
  bool _hide = true;
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.only(
          left: _hide ? ConfigConstant.margin2 : 0,
          right: _hide ? ConfigConstant.margin2 : 0,
          bottom: ConfigConstant.margin1),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: _theme.colorScheme.surface,
              borderRadius:
                  BorderRadius.circular(_hide ? ConfigConstant.radius1 : 0),
            ),
            child: ExpansionTile(
              leading: CircleAvatar(
                radius: 20,
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage(widget.img),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              title: Text(
                widget.title,
                style: _theme.textTheme.bodyText2,
              ),
              subtitle: Text(widget.subTitle,
                  style: _theme.textTheme.caption
                      ?.copyWith(color: _theme.colorScheme.secondary)),
              trailing: Icon(
                _hide ? Icons.chevron_right : Icons.keyboard_arrow_down,
                color: _theme.colorScheme.secondary,
              ),
              children: [
                Container(
                  padding: EdgeInsets.only(
                      left: ConfigConstant.margin2,
                      right: ConfigConstant.margin2,
                      bottom: ConfigConstant.margin2),
                  child: Column(
                    children: [
                      Container(
                        child: Text(
                          widget.textBody,
                          style: _theme.textTheme.bodyText2,
                        ),
                      ),
                      SizedBox(
                        height: ConfigConstant.margin2,
                      ),
                      Container(
                        child: Row(
                          children: [
                            Container(
                              child: Row(
                                children: [
                                  Icon(
                                    FontAwesomeIcons.instagram,
                                    color: Color(0xFFEBAB4E),
                                    size: 16,
                                  ),
                                  SizedBox(
                                    width: ConfigConstant.margin0,
                                  ),
                                  Text(
                                    widget.textNameIg,
                                    style: _theme.textTheme.caption,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: ConfigConstant.margin2,
                            ),
                            Container(
                              child: Row(
                                children: [
                                  Icon(
                                    FontAwesomeIcons.telegram,
                                    color: Color(0xFF40B3E0),
                                    size: 16,
                                  ),
                                  SizedBox(
                                    width: ConfigConstant.margin0,
                                  ),
                                  Text(
                                    widget.textNamefb,
                                    style: _theme.textTheme.caption,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: ConfigConstant.margin2,
                            ),
                            Container(
                              child: Row(
                                children: [
                                  Icon(
                                    FontAwesomeIcons.facebook,
                                    color: Color(0xFF0094FF),
                                    size: 16,
                                  ),
                                  SizedBox(
                                    width: ConfigConstant.margin0,
                                  ),
                                  Text(
                                    widget.textNameTg,
                                    style: _theme.textTheme.caption,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
              onExpansionChanged: (isExpanded) {
                setState(() {
                  _hide = !_hide;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
