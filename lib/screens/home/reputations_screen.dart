import 'package:erobot/config/config_constant.dart';
import 'package:erobot/widgets/e_back_button.dart';
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
        leading: EBackButton(),
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
              return Column(
                children: [
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: Container(
                      height: ConfigConstant.objectHeight2,
                      width: ConfigConstant.objectHeight2,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: NetworkImage(
                            'https://i.pinimg.com/originals/ae/ec/c2/aeecc22a67dac7987a80ac0724658493.jpg',
                          ),
                        ),
                      ),
                    ),
                    title: Text(
                      'PNC Event',
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    subtitle: Text(
                      '19th Jul, 2018',
                      style: Theme.of(context).textTheme.caption!.copyWith(
                          color: Theme.of(context).colorScheme.secondary),
                    ),
                    trailing: IconButton(
                      icon: Icon(
                        Icons.keyboard_arrow_right,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      onPressed: () {},
                    ),
                  ),
                  if (index != 5)
                    Divider(
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
