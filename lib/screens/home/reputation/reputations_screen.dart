import 'package:erobot/config/config_constant.dart';
import 'package:erobot/screens/home/reputation/reputation_detail_screen.dart';
import 'package:erobot/widgets/er_back_button.dart';
import 'package:erobot/widgets/er_profile_image.dart';
import 'package:flutter/material.dart';

class ReputationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        automaticallyImplyLeading: false,
        elevation: 0.5,
        brightness: Brightness.dark,
        leading: ERBackButton(),
        title: Text('Reputations'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () => print('search'),
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
          left: ConfigConstant.margin2,
          top: ConfigConstant.margin2,
          bottom: ConfigConstant.margin2,
        ),
        child: Column(
          children: List.generate(
            6,
            (index) {
              Map<String, String> reputations = {
                'title': 'PNC Event',
                'date': '19th Jul, 2018',
                'image': 'https://i.pinimg.com/originals/ae/ec/c2/aeecc22a67dac7987a80ac0724658493.jpg',
              };
              return Column(
                children: [
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: ERProfileImage(
                      image: reputations['image'] ?? '',
                    ),
                    title: Text(
                      reputations['title'] ?? '',
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    subtitle: Text(
                      reputations['date'] ?? '',
                      style:
                          Theme.of(context).textTheme.caption!.copyWith(color: Theme.of(context).colorScheme.secondary),
                    ),
                    trailing: IconButton(
                      icon: Icon(
                        Icons.keyboard_arrow_right,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      onPressed: () {},
                    ),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => ReputationDetailScreen(
                            title: reputations['title'] ?? '',
                          ),
                        ),
                      );
                    },
                  ),
                  if (index != 5)
                    Divider(
                      height: 0,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
