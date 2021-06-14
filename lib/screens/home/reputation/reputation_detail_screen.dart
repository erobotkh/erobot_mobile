import 'package:erobot/config/config_constant.dart';
import 'package:erobot/widgets/er_back_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:page_indicator/page_indicator.dart';

import 'local_widgets/image_viewer.dart';

class ReputationDetailScreen extends HookWidget {
  final String title;
  const ReputationDetailScreen({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scrollController = useScrollController();
    final pageController = usePageController();
    final double expandedHeight = MediaQuery.of(context).size.width;
    final isShow = useState(false);

    List<String> images = [
      'https://pbs.twimg.com/media/Ey9OPzOWYAkX57L.jpg',
      'https://pbs.twimg.com/media/EvBGPQXXAAMuKvz.jpg',
      'https://e00-marca.uecdn.es/assets/multimedia/imagenes/2018/05/03/15253818363726.jpg',
      'https://pbs.twimg.com/media/Ey9OPzOWYAkX57L.jpg',
      'https://pbs.twimg.com/media/EvBGPQXXAAMuKvz.jpg',
      'https://e00-marca.uecdn.es/assets/multimedia/imagenes/2018/05/03/15253818363726.jpg',
      'https://expertphotography.com/wp-content/uploads/2017/05/portrait-photography-1.jpg'
    ];
    String desc =
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Amet diam gravida sed sagittis eu. Rhoncus ultricies gravida amet, fringilla scelerisque vitae, vestibulum ligula pharetra. In semper elit morbi duis egestas ipsum scelerisque viverra.. In semper elit morbi duis egestas ipsum scelerisque viverra. Massa sed eget nunc, aliquam semper massa vestibulum. Cancel because of Covid 19.';

    scrollController.addListener(() {
      if (scrollController.offset >= expandedHeight)
        isShow.value = true;
      else
        isShow.value = false;
    });

    return Scaffold(
      body: CustomScrollView(
        controller: scrollController,
        slivers: [
          SliverAppBar(
            leading: ERBackButton(),
            elevation: 0,
            expandedHeight: expandedHeight,
            collapsedHeight: kToolbarHeight,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: false,
              title: Text(
                isShow.value ? title : '',
              ),
              background: GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    useRootNavigator: true,
                    isScrollControlled: true,
                    backgroundColor: Colors.black,
                    barrierColor: Colors.transparent,
                    builder: (context) {
                      return ImageViewer(
                        images: images,
                        statusBarHeight: MediaQuery.of(context).padding.top,
                        currentImageIndex: pageController.page!.toInt(),
                        onPageChanged: (index) {
                          pageController.animateToPage(
                            index,
                            duration: ConfigConstant.duration,
                            curve: Curves.easeIn,
                          );
                        },
                      );
                    },
                  );
                },
                child: PageIndicatorContainer(
                  padding: const EdgeInsets.only(bottom: ConfigConstant.margin2),
                  shape: IndicatorShape.roundRectangleShape(
                    size: const Size(8, 8),
                    cornerSize: Size.square(4),
                  ),
                  indicatorColor: Theme.of(context).colorScheme.surface,
                  indicatorSelectorColor: Theme.of(context).colorScheme.onSurface,
                  length: images.length,
                  child: PageView(
                    controller: pageController,
                    onPageChanged: (index) {},
                    children: List.generate(images.length, (index) {
                      return Stack(
                        children: [
                          Container(
                            height: double.infinity,
                            width: double.infinity,
                            child: Image.network(
                              images[index],
                              fit: BoxFit.cover,
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Theme.of(context).colorScheme.surface,
                                  Theme.of(context).colorScheme.surface.withOpacity(0.0),
                                ],
                              ),
                            ),
                          )
                        ],
                      );
                    }),
                  ),
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                buildReputationProfile(context),
                buildDescription(context, desc),
                buildInforCard(
                  context: context,
                  title: 'Paticipated Members',
                  subtitle: '10 members',
                  onTap: () => print('Members'),
                ),
                buildInforCard(
                  context: context,
                  title: 'Robots',
                  subtitle: '11 robots',
                  onTap: () => print('Robots'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Padding buildInforCard({
    required BuildContext context,
    String? title,
    String? subtitle,
    void Function()? onTap,
  }) {
    return Padding(
      padding: EdgeInsets.only(
        left: ConfigConstant.margin2,
        right: ConfigConstant.margin2,
        bottom: ConfigConstant.margin2,
      ),
      child: ClipRRect(
        borderRadius: ConfigConstant.circlarRadius1,
        child: ListTile(
          tileColor: Theme.of(context).colorScheme.surface,
          shape: RoundedRectangleBorder(borderRadius: ConfigConstant.circlarRadius2),
          title: Text(
            title ?? '',
            style: Theme.of(context).textTheme.bodyText2,
          ),
          subtitle: Text(
            subtitle ?? '',
            style: Theme.of(context).textTheme.caption,
          ),
          trailing: Icon(
            Icons.keyboard_arrow_right,
            color: Theme.of(context).colorScheme.onSurface,
          ),
          onTap: onTap,
        ),
      ),
    );
  }

  Container buildDescription(BuildContext context, String desc) {
    return Container(
      margin: EdgeInsets.all(ConfigConstant.margin2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Description',
            style: Theme.of(context).textTheme.subtitle2,
          ),
          SizedBox(height: ConfigConstant.margin0),
          Text(
            desc,
            style: Theme.of(context).textTheme.bodyText2,
          ),
        ],
      ),
    );
  }

  ListTile buildReputationProfile(BuildContext context) {
    return ListTile(
      tileColor: Theme.of(context).colorScheme.surface,
      horizontalTitleGap: ConfigConstant.margin1,
      contentPadding: EdgeInsets.symmetric(
        vertical: ConfigConstant.margin1,
        horizontal: ConfigConstant.margin1,
      ),
      leading: Container(
        height: ConfigConstant.objectHeight3,
        width: ConfigConstant.objectHeight3,
        decoration: BoxDecoration(
          color: Colors.black,
          shape: BoxShape.circle,
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(
              'https://www.passerellesnumeriques.org/wp-content/uploads/2016/03/pn-logo.png',
            ),
          ),
        ),
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.headline6,
      ),
      subtitle: Text(
        '19 Jun 2020',
        style: Theme.of(context).textTheme.bodyText2,
      ),
    );
  }
}
