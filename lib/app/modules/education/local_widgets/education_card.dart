import 'package:erobot_mobile/helpers/date_helper.dart';
import 'package:erobot_mobile/models/post_model.dart';
import 'package:erobot_mobile/constants/config_constant.dart';
import 'package:erobot_mobile/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class EducationCard extends StatelessWidget {
  const EducationCard({
    Key? key,
    required this.post,
    this.onPressedLearn,
  }) : super(key: key);

  final PostModel post;
  final void Function()? onPressedLearn;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: ConfigConstant.margin1),
      margin: EdgeInsets.only(bottom: ConfigConstant.margin1),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: ConfigConstant.circlarRadius1,
        boxShadow: ConfigConstant.boxShadows0,
      ),
      child: Wrap(
        spacing: ConfigConstant.margin2,
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
                    post.author?.profileUrl ??
                        'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png',
                  ),
                ),
              ),
            ),
            title: Text(
              (post.author?.firstName ?? "") + " " + (post.author?.lastName ?? ""),
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            subtitle: Text(
              DateHelper.yMMd(context, DateTime.tryParse(post.createdAt ?? "")),
              style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Theme.of(context).colorScheme.secondary),
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
          SizedBox(height: ConfigConstant.margin2),
          AspectRatio(
            aspectRatio: 344 / 194,
            child: post.images?.isNotEmpty == true
                ? Image.network(
                    post.images?.first.url ?? '',
                    // "https://www.komysafety.com/images/banner/no-image.png",
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
              post.body ?? "",
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Theme.of(context).colorScheme.secondary),
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
                Text("${post.reactionCount ?? 0}"),
                SizedBox(width: ConfigConstant.margin0),
                Icon(
                  Icons.favorite,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
                SizedBox(width: ConfigConstant.margin2),
                Text("${post.commentCount ?? 0}"),
                SizedBox(width: ConfigConstant.margin0),
                Icon(
                  Icons.comment,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
                Expanded(child: SizedBox()),
                TextButton(
                  child: Text(
                    'LEARN',
                    style: Theme.of(context).textTheme.labelLarge,
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
