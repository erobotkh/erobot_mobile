import 'package:erobot/config/config_constant.dart';
import 'package:erobot/models/home_card_model.dart';
import 'package:erobot/screens/home/members_expaned_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:decorated_icon/decorated_icon.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<HomeCardModel> _homeCard = HomeCardModel.getCards();
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        brightness: Brightness.dark,
        backgroundColor: Theme.of(context).colorScheme.surface,
        centerTitle: false,
        title: Text('Erobot'),
        actions: [
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: () {
              Navigator.of(context,rootNavigator: true).push(MaterialPageRoute(
                  builder: (context) => MembersExpanedScreen()));
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: ConfigConstant.margin2,
          vertical: ConfigConstant.margin1,
        ),
        child: StaggeredGridView.countBuilder(
          crossAxisCount: 4,
          itemCount: _homeCard.length,
          staggeredTileBuilder: (int index) => StaggeredTile.fit(2),
          mainAxisSpacing: ConfigConstant.margin1,
          crossAxisSpacing: ConfigConstant.margin1,
          itemBuilder: (BuildContext context, int index) {
            var card = _homeCard[index];
            return InkWell(
              onTap: card.onTap,
              child: AspectRatio(
                aspectRatio: card.isSmall ? 167 / 126 : 167.5 / 200,
                child: Container(
                  padding: EdgeInsets.only(
                    top: ConfigConstant.margin2,
                    left: ConfigConstant.margin2,
                    right: ConfigConstant.margin2,
                  ),
                  decoration: BoxDecoration(
                    gradient: card.background,
                    borderRadius: ConfigConstant.circlarRadius1,
                    border: Border.all(
                      width: 1,
                      color: Theme.of(context)
                          .colorScheme
                          .onPrimary
                          .withOpacity(0.3),
                    ),
                  ),
                  child: Stack(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            card.title,
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                          Text(
                            card.subTitle,
                            style: TextStyle(
                              fontSize: 12,
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSurface
                                  .withOpacity(0.5),
                            ),
                          ),
                        ],
                      ),
                      Positioned(
                        bottom: card.isSmall
                            ? -ConfigConstant.margin2
                            : ConfigConstant.margin2,
                        right: 0,
                        child: DecoratedIcon(
                          card.icon ?? Icons.keyboard,
                          size: ConfigConstant.iconSize5,
                          shadows: [
                            BoxShadow(
                              offset: Offset(-0.5, 0.5),
                              blurRadius: 10,
                              color: Theme.of(context)
                                  .colorScheme
                                  .background
                                  .withOpacity(0.2),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
