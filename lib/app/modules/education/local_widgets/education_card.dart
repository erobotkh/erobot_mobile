import 'package:erobot_mobile/helpers/date_helper.dart';
import 'package:erobot_mobile/models/post_model.dart';
import 'package:erobot_mobile/constants/config_constant.dart';
import 'package:erobot_mobile/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class EducationCard extends StatelessWidget {
  const EducationCard({
    Key? key,
    required this.info,
    this.onPressedLearn,
  }) : super(key: key);

  final PostModel info;
  final void Function()? onPressedLearn;

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
                    info.author?.profileImage ??
                        'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png',
                  ),
                ),
              ),
            ),
            title: Text(
              (info.author?.firstName ?? "") + " " + (info.author?.lastName ?? ""),
              style: Theme.of(context).textTheme.bodyText2,
            ),
            subtitle: Text(
              DateHelper.yMMd(context, DateTime.tryParse(info.createdAt ?? "")),
              style: Theme.of(context).textTheme.caption!.copyWith(color: Theme.of(context).colorScheme.secondary),
            ),
            trailing: ErTapEffect(
              child: Icon(
                Icons.share,
                color: Theme.of(context).colorScheme.onSurface,
              ),
              onTap: () {
                print("SHARE");
                Share.share('check out my website https://example.com');
              },
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
                  onPressed: onPressedLearn,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
