import 'package:erobot_mobile/models/post_model.dart';
import 'package:erobot_mobile/constants/config_constant.dart';
import 'package:flutter/material.dart';

class EducationCard extends StatelessWidget {
  const EducationCard({
    Key? key,
    required this.info,
  }) : super(key: key);

  final PostModel info;

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
              (info.author?.firstName ?? "") + " " + (info.author?.lastName ?? ""),
              style: Theme.of(context).textTheme.bodyText2,
            ),
            subtitle: Text(
              info.createdAt ?? "",
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
            child: info.images?.isNotEmpty == true
                ? Image.network(
                    info.images?.first.url ?? "",
                    fit: BoxFit.cover,
                  )
                : SizedBox(),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: ConfigConstant.margin1,
              horizontal: ConfigConstant.margin2,
            ),
            child: Text(
              info.body ?? "",
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
                Text(info.commentCount.toString()),
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
