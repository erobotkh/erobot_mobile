import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:erobot/config/config_constant.dart';

class CardEducation extends StatelessWidget {
  final String profile;
  final String username;
  final String datepost;
  // final Image poster;
  final String caption;
  const CardEducation({
    Key? key,
    required this.profile,
    required this.username,
    required this.datepost,
    // required this.poster,
    required this.caption,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: ConfigConstant.margin1,
        vertical: ConfigConstant.margin0,
      ),
      width: MediaQuery.of(context).size.width,
      height: 400,
      color: Theme.of(context).colorScheme.surface,
      alignment: Alignment.topLeft,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 25,
                        backgroundImage: AssetImage(profile),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 2,
                        alignment: Alignment.topLeft,
                        padding: EdgeInsets.symmetric(
                            horizontal: ConfigConstant.margin1),
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                username,
                                style: TextStyle(
                                  color: _theme.colorScheme.onSurface,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                datepost,
                                style: TextStyle(
                                  color: _theme.colorScheme.secondary,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    print("icon share");
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.share,
                      color: _theme.colorScheme.onSurface,
                      size: 25,
                    ),
                  ),
                ),
              ],
            ),
          ),
          InkWell(
            onTap: () {
              print("card_education");
            },
            child: Container(
              // padding: EdgeInsets.symmetric(
              //   vertical: ConfigConstant.margin2,
              // ),

              child: Column(
                children: [
                  Container(
                    height: 200,
                    child: Image.asset(
                      "assets/images/image.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: ConfigConstant.margin1,
                      left: ConfigConstant.margin1,
                      right: ConfigConstant.margin1,
                    ),
                    child: Text(
                      caption,
                      style: TextStyle(
                        color: _theme.colorScheme.secondary,
                        fontSize: 16,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(
              left: ConfigConstant.margin1,
              right: ConfigConstant.margin2 * 1.2,
              top: ConfigConstant.margin1,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Row(
                    children: [
                      Text("1"),
                      IconButton(
                        onPressed: () {
                          print("comment icon");
                          showBottomSheet(
                              context: context,
                              builder: (BuildContext context) {
                                return Container(
                                  height: MediaQuery.of(context).size.height,
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Comment",
                                      style:
                                          Theme.of(context).textTheme.headline3,
                                    ),
                                  ),
                                );
                              });
                        },
                        icon: Icon(
                          Icons.message,
                          color: _theme.colorScheme.onSurface,
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    print("btn learn");
                  },
                  child: Text(
                    "Learn",
                    style: TextStyle(
                      color: _theme.colorScheme.onSurface,
                      fontSize: 16,
                      fontFamily: 'OpenSans',
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
