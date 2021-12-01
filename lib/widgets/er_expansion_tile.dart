import 'package:erobot_mobile/configs/config_constant.dart';
import 'package:erobot_mobile/widgets/er_tap_effect.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class ERExpansionTile extends StatefulWidget {
  final String title;
  final String subtitle;
  final String img;
  final String? textBody;
  final String? textNamefb;
  final String? textNameIg;
  final String? textNameTg;
  final void Function()? onTap;
  final bool expandable;
  final String? linkIg;
  final String? linkTele;
  final String? linkFb;

  const ERExpansionTile({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.img,
    this.onTap,
    this.textBody,
    this.textNamefb,
    this.textNameIg,
    this.textNameTg,
    this.expandable = true,
    this.linkIg,
    this.linkTele,
    this.linkFb,
  }) : super(key: key);

  @override
  _ERExpansionTileState createState() => _ERExpansionTileState();
}

class _ERExpansionTileState extends State<ERExpansionTile> {
  bool _hide = true;
  bool isExpanded = false;

  Future<void> _launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
        headers: <String, String>{'my_header_key': 'my_header_value'},
      );
    } else {
      throw 'Could not launch $url';
    }
  }

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
              borderRadius: BorderRadius.circular(_hide ? ConfigConstant.radius1 : 0),
            ),
            child: ErTapEffect(
              onTap: () {
                if (widget.onTap != null) widget.onTap!();
              },
              behavior: HitTestBehavior.translucent,
              child: IgnorePointer(
                ignoring: !widget.expandable,
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
                  subtitle: Text(
                    widget.subtitle,
                    style: _theme.textTheme.caption?.copyWith(color: _theme.colorScheme.secondary),
                  ),
                  trailing: Icon(
                    _hide ? Icons.chevron_right : Icons.keyboard_arrow_down,
                    color: _theme.colorScheme.secondary,
                  ),
                  children: [
                    if (widget.expandable)
                      Container(
                        padding: EdgeInsets.only(
                            left: ConfigConstant.margin2,
                            right: ConfigConstant.margin2,
                            bottom: ConfigConstant.margin2),
                        child: Column(
                          children: [
                            Container(
                              child: Text(
                                widget.textBody ?? "",
                                style: _theme.textTheme.bodyText2,
                              ),
                            ),
                            SizedBox(
                              height: ConfigConstant.margin2,
                            ),
                            Container(
                              child: Row(
                                children: [
                                  ErTapEffect(
                                    onTap: () => setState(() {
                                      _launchInBrowser("${widget.linkIg}");
                                    }),
                                    child: Container(
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
                                            widget.textNameIg ?? "",
                                            style: _theme.textTheme.caption,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: ConfigConstant.margin2,
                                  ),
                                  ErTapEffect(
                                    onTap: () => setState(() {
                                      _launchInBrowser("${widget.linkTele}");
                                    }),
                                    child: Container(
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
                                            widget.textNamefb ?? "",
                                            style: _theme.textTheme.caption,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: ConfigConstant.margin2,
                                  ),
                                  ErTapEffect(
                                    onTap: () => setState(() {
                                      _launchInBrowser("${widget.linkFb}");
                                    }),
                                    child: Container(
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
                                            widget.textNameTg ?? "",
                                            style: _theme.textTheme.caption,
                                          ),
                                        ],
                                      ),
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
            ),
          ),
        ],
      ),
    );
  }
}