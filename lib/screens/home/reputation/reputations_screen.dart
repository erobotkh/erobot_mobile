import 'package:erobot/config/config_constant.dart';
import 'package:erobot/screens/home/reputation/reputation_detail_screen.dart';
import 'package:erobot/widgets/er_expansion_tile.dart';
import 'package:erobot/widgets/er_back_button.dart';
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
      body: ListView(
        padding: EdgeInsets.only(
          top: ConfigConstant.margin1,
        ),
        children: [
          ERExpansionTile(
            title: 'Morn Mey',
            subtitle: 'Team leader since 2021',
            img: 'assets/images/1.jpg',
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return ReputationDetailScreen(title: "WOWO");
                  },
                ),
              );
            },
            expandable: false,
            textNamefb: 'Morn Mey',
            textNameTg: 'Morn Mey',
            textNameIg: 'Morn Mey',
            textBody:
                'I Love robot 📋✏️️ Lorem ipsum dolor sit amet, consectetur adipiscing elit. Amet diam gravida sed sagittis eu. Rhoncus ultricies gravida amet, fringilla scelerisque vitae. ❤️',
          ),
          ERExpansionTile(
            title: 'Non Sinat',
            subtitle: 'Organizer since 2021',
            img: 'assets/images/1.jpg',
            onTap: () {},
            textNamefb: 'Non Sinat',
            textNameTg: 'Non Sinat',
            textNameIg: 'Non Sinat',
            textBody:
                'I Love robot 📋✏️️ Lorem ipsum dolor sit amet, consectetur adipiscing elit. Amet diam gravida sed sagittis eu. Rhoncus ultricies gravida amet, fringilla scelerisque vitae. ❤️',
          ),
        ],
      ),
    );
  }
}
