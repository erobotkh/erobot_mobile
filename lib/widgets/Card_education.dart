import 'package:erobot/notifier/main_screen_notifier.dart';
import 'package:flutter/material.dart';

import 'package:erobot/constant/theme_constant.dart';

class CardEducation extends StatelessWidget {
  final avatarimg;
  final double radiusimg;
  final String username;
  final String datepost;
  final poseter;
  final String caption;
  final int comment;

  const CardEducation({
    Key? key,
    required this.radiusimg,
    required this.avatarimg,
    required this.username,
    required this.datepost,
    required this.poseter,
    required this.caption,
    required this.comment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);

    return Container(
      height: 402,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 1),
      decoration: BoxDecoration(
        color: Color.fromARGB(23, 38, 52, 1),
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Row(
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        child: CircleAvatar(
                          radius: radiusimg,
                          child: Image.network(avatarimg),
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Container(
                        // alignment: Alignment.topLeft,
                        child: Column(
                          children: [
                            Container(
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  username,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    color: _theme.colorScheme.onSurface,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              alignment: Alignment.topLeft,
                              margin: EdgeInsets.only(right: 28),
                              child: Text(
                                datepost,
                                style: TextStyle(
                                  color: _theme.colorScheme.secondary,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.share,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 200,
            // color: Colors.blue,
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Image.network(poseter),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Text(
              caption,
              textAlign: TextAlign.justify,
              maxLines: 2,
              // textWidthBasis: TextWidthBasis.longestLine,
              overflow: TextOverflow.ellipsis,
              softWrap: false,
              style: TextStyle(
                color: _theme.colorScheme.secondary,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        // ignore: unnecessary_brace_in_string_interps
                        "${comment}",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.message,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    print("learn");
                  },
                  child: Text(
                    "Learn",
                    style: _theme.textTheme.button,
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
