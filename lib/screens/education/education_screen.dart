import 'package:erobot/config/config_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'content_tabbar.dart';

class EducationScreen extends StatefulWidget {
  @override
  _EducationScreenState createState() => _EducationScreenState();
}

class _EducationScreenState extends State<EducationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.dark,
        backgroundColor: Theme.of(context).colorScheme.background,
        title: Text("Education"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
          ),
        ],
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: DefaultTabController(
        length: 6,
        child: Column(
          children: [
            Container(
              constraints: BoxConstraints(maxHeight: 150.0),
              margin: EdgeInsets.only(bottom: ConfigConstant.margin1),
              child: Material(
                color: Colors.red,
                child: TabBar(
                  indicator: UnderlineTabIndicator(borderSide: BorderSide.none),
                  isScrollable: true,
                  tabs: [
                    Tab(
                      child: Text(
                        "ROBOT",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    Tab(
                      child: Text(
                        "CODING",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    Tab(
                      child: Text(
                        "EDUCATION",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    Tab(
                      child: Text(
                        "EXPERIENCE",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    Tab(
                      child: Text(
                        "ROBOT",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    Tab(
                      child: Text(
                        "ROBOT",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  EducationPage(),
                  Container(
                    width: 100,
                    height: 100,
                    color: Colors.black,
                  ),
                  EducationPage(),
                  Container(
                    width: 100,
                    height: 100,
                    color: Colors.black,
                  ),
                  EducationPage(),
                  Container(
                    width: 100,
                    height: 100,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
