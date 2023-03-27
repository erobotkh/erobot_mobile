import 'package:erobot_mobile/app/modules/home/controllers/home_controller.dart';
import 'package:erobot_mobile/app/routes/app_pages.dart';
import 'package:erobot_mobile/constants/config_constant.dart';
import 'package:erobot_mobile/models/home_card_model.dart';
import 'package:erobot_mobile/widgets/er_tap_effect.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:decorated_icon/decorated_icon.dart';
import 'package:get/get.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    List<HomeCardModel> _homeCard = HomeCardModel.card();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        centerTitle: false,
        title: Text('Erobot'),
        actions: [
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: () => Get.toNamed(Routes.MEMBER),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: ConfigConstant.margin2,
          vertical: ConfigConstant.margin1,
        ),
        child: MasonryGridView.count(
          itemCount: _homeCard.length,
          mainAxisSpacing: ConfigConstant.margin1,
          crossAxisSpacing: ConfigConstant.margin1,
          crossAxisCount: 2,
          itemBuilder: (context, index) {
            return _buildHomeCard(
              _homeCard[index],
              context,
            );
          },
        ),
      ),
    );
  }

  ErTapEffect _buildHomeCard(HomeCardModel card, BuildContext context) {
    return ErTapEffect(
      onTap: () => Get.toNamed(card.route),
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
              color: Theme.of(context).colorScheme.onPrimary.withOpacity(0.3),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Wrap(
                  children: [
                    Text(
                      card.title,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    Text(
                      card.subTitle,
                      style: TextStyle(
                        fontSize: 12,
                        color: Theme.of(context).colorScheme.onSurface.withOpacity(0.5),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.bottomRight,
                child: DecoratedIcon(
                  card.icon ?? Icons.keyboard,
                  size: ConfigConstant.iconSize5,
                  shadows: [
                    BoxShadow(
                      offset: Offset(-0.5, 0.5),
                      blurRadius: 10,
                      color: Theme.of(context).colorScheme.background.withOpacity(0.2),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
