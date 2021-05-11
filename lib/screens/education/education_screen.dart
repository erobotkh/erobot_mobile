import 'package:erobot/widgets/Card_education.dart';
import 'package:erobot/widgets/Tabbars.dart';
import 'package:flutter/material.dart';

class EducationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    return Scaffold(
      backgroundColor: _theme.colorScheme.background,
      appBar: AppBar(
        backgroundColor: _theme.colorScheme.background,
        elevation: 0,
        title: Text(
          "Education",
          style: _theme.textTheme.headline6,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
            ),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Tabbars(),
              SizedBox(
                height: 20,
              ),
              CardEducation(
                radiusimg: 21,
                avatarimg: "",
                username: "Annette Cooper",
                datepost: "30 Fri, 2021",
                poseter: "",
                caption:
                    "How to build ball shooter with something that I don't know, just text test",
                comment: 1,
              ),
              CardEducation(
                radiusimg: 21,
                avatarimg: "",
                username: "Annette Cooper",
                datepost: "30 Fri, 2021",
                poseter: "",
                caption:
                    "How to build ball shooter with something that I don't know, just text test",
                comment: 1,
              )
            ],
          ),
        ),
      ),
    );
  }
}
