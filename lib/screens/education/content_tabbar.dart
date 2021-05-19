import 'package:erobot/widgets/Card_education.dart';
import 'package:flutter/material.dart';

class EducationPage extends StatefulWidget {
  @override
  _EducationPageState createState() => _EducationPageState();
}

class _EducationPageState extends State<EducationPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            CardEducation(
              profile: "assets/images/image.png",
              username: "Annette Cooper",
              datepost: "31 Fri, 2021",
              caption:
                  "How to build ball shooter with something that I don't know , just text test",
            ),
            CardEducation(
              profile: "assets/images/image.png",
              username: "Annette Cooper",
              datepost: "31 Fri, 2021",
              caption:
                  "How to build ball shooter with something that I don't know , just text test",
            ),
            CardEducation(
              profile: "assets/images/image.png",
              username: "Annette Cooper",
              datepost: "31 Fri, 2021",
              caption:
                  "How to build ball shooter with something that I don't know , just text test",
            ),
            CardEducation(
              profile: "assets/images/image.png",
              username: "Annette Cooper",
              datepost: "31 Fri, 2021",
              caption:
                  "How to build ball shooter with something that I don't know , just text test",
            ),
            CardEducation(
              profile: "assets/images/image.png",
              username: "Annette Cooper",
              datepost: "31 Fri, 2021",
              caption:
                  "How to build ball shooter with something that I don't know , just text test",
            ),
          ],
        ),
      ),
    );
  }
}
