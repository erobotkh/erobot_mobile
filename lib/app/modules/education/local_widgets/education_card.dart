import 'package:erobot_mobile/constants/config_constant.dart';
import 'package:flutter/material.dart';

class EducationCard extends StatelessWidget {
  const EducationCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: ConfigConstant.margin2),
      margin: EdgeInsets.only(bottom: ConfigConstant.margin1),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: ConfigConstant.circlarRadius1,
        boxShadow: ConfigConstant.boxShadows0,
      ),
      child: Wrap(
        children: [
          ListTile(
            leading: Container(
              height: ConfigConstant.objectHeight2,
              width: ConfigConstant.objectHeight2,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue,
                image: DecorationImage(
                  image: NetworkImage(
                    'https://i.pinimg.com/originals/ae/ec/c2/aeecc22a67dac7987a80ac0724658493.jpg',
                  ),
                ),
              ),
            ),
            title: Text(
              'Johny Waston',
              style: Theme.of(context).textTheme.bodyText2,
            ),
            subtitle: Text(
              '30 Fri, 2020',
              style: Theme.of(context).textTheme.caption!.copyWith(color: Theme.of(context).colorScheme.secondary),
            ),
            trailing: IconButton(
              icon: Icon(
                Icons.share,
                color: Theme.of(context).colorScheme.onSurface,
              ),
              onPressed: () {},
            ),
          ),
          AspectRatio(
            aspectRatio: 344 / 194,
            child: Image.network(
              'https://www.the-diy-life.com/wp-content/uploads/2020/07/Obstacle-Avoiding-Robot-Car-Using-An-Arduino-Uno.jpg',
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: ConfigConstant.margin1,
              horizontal: ConfigConstant.margin2,
            ),
            child: Text(
              'How to build ball shooter with something that I don’t know, just test text',
              style: Theme.of(context).textTheme.bodyText2!.copyWith(color: Theme.of(context).colorScheme.secondary),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: ConfigConstant.margin2,
            ),
            child: Row(
              children: [
                Text('10'),
                IconButton(
                  icon: Icon(
                    Icons.comment,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                  onPressed: () => print('comment'),
                ),
                Expanded(child: SizedBox()),
                TextButton(
                  child: Text(
                    'LEARN',
                    style: Theme.of(context).textTheme.button,
                  ),
                  onPressed: () {
                    print('learn');
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
