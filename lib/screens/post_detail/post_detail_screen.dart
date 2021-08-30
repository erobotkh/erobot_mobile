import 'package:erobot/config/config_constant.dart';
import 'package:erobot/screens/home/reputation/local_widgets/image_viewer.dart';
import 'package:erobot/widgets/er_back_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class PostDetailScreen extends HookWidget {
  const PostDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pageController = usePageController();
    final double expandedHeight = MediaQuery.of(context).size.width;
    final isShow = useState(false);

    List<String> images = [
      'https://pbs.twimg.com/media/Ey9OPzOWYAkX57L.jpg',
      'https://pbs.twimg.com/media/EvBGPQXXAAMuKvz.jpg',
      'https://e00-marca.uecdn.es/assets/multimedia/imagenes/2018/05/03/15253818363726.jpg',
      'https://pbs.twimg.com/media/Ey9OPzOWYAkX57L.jpg',
    ];

    String descriptions =
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Amet diam gravida sed sagittis eu. Rhoncus ultricies gravida amet, fringilla scelerisque vitae, vestibulum ligula pharetra. In semper elit morbi duis egestas ipsum scelerisque viverra.. In semper elit morbi duis egestas ipsum scelerisque viverra. Massa sed eget nunc, aliquam semper massa vestibulum. Cancel because of Covid 19.';

    List<IconData> icons = [
      Icons.favorite,
      Icons.message,
      Icons.share,
      Icons.bookmark,
      Icons.more_vert,
    ];

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: false,
        unselectedItemColor: Theme.of(context).colorScheme.onSurface,
        selectedItemColor: Theme.of(context).colorScheme.onSurface,
        backgroundColor: Theme.of(context).colorScheme.surface,
        items: List.generate(
          5,
          (index) => BottomNavigationBarItem(
            icon: Icon(icons[index]),
            label: "WOWO",
          ),
        ),
      ),
      body: CustomScrollView(
        // controller: scrollController,
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
                isShow.value ? "title" : '',
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
                child: Stack(
                  children: [
                    Container(
                      height: double.infinity,
                      width: double.infinity,
                      child: Image.network(
                        images[0],
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
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  color: Theme.of(context).colorScheme.surface,
                  padding: const EdgeInsets.all(ConfigConstant.margin2),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Test title wowowo",
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      const SizedBox(height: ConfigConstant.margin0),
                      Wrap(
                        children: [
                          Text(
                            "Suy Kosal",
                            style: Theme.of(context).textTheme.bodyText2?.copyWith(fontWeight: FontWeight.w600),
                          ),
                          Text(
                            " - 19 Jun 2020",
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(height: ConfigConstant.margin1),
                Container(
                  color: Theme.of(context).colorScheme.surface,
                  padding: const EdgeInsets.all(ConfigConstant.margin2),
                  child: Text(
                    descriptions,
                    style: Theme.of(context).textTheme.bodyText2,
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
