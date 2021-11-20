import 'package:erobot_mobile/app/data/models/base/base_list_model.dart';
import 'package:erobot_mobile/app/data/models/base/links_model.dart';
import 'package:erobot_mobile/app/data/models/base/meta_model.dart';
import 'package:erobot_mobile/app/data/models/post_model.dart';

class PostList extends BaseListModel<Post> {
  PostList({
    List<Post>? items,
    Meta? meta,
    Links? links,
  }) : super(items: items, meta: meta, links: links);
}
