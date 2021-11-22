import 'package:erobot_mobile/app/data/models/base/links_model.dart';
import 'package:erobot_mobile/app/data/models/base/meta_model.dart';

abstract class BaseListModel<T> {
  List<T>? items;
  MetaModel? meta;
  LinksModel? links;

  BaseListModel({
    this.items,
    this.meta,
    this.links,
  });

  BaseListModel add(BaseListModel newList, {bool reverseLoad = false}) {
    if (newList.items != null) {
      if (reverseLoad) {
        items?.insertAll(0, newList.items as List<T>);
      } else {
        items?.addAll(newList.items as List<T>);
      }
    }
    links = newList.links;
    meta = newList.meta;
    return this;
  }

  bool hasLoadMore() {
    if (items == null && links == null) return false;
    if (links!.next != null) {
      return true;
    } else {
      return false;
    }
  }
}
