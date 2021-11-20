import 'package:erobot_mobile/helpers/app_helper.dart';

class Links {
  String? self;
  String? next;
  dynamic prev;
  String? last;

  Links({this.self, this.next, this.prev, this.last});

  Links getPageNumber() {
    return Links(
      self: AppHelper.queryParameters(url: self ?? "", param: 'page'),
      prev: AppHelper.queryParameters(url: prev ?? "", param: 'page'),
      next: AppHelper.queryParameters(url: next ?? "", param: 'page'),
      last: AppHelper.queryParameters(url: last ?? "", param: 'page'),
    );
  }

  Links.fromJson(Map<String, dynamic> json) {
    self = json['self'];
    next = json['next'];
    prev = json['prev'];
    last = json['last'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['self'] = self;
    data['next'] = next;
    data['prev'] = prev;
    data['last'] = last;
    return data;
  }
}
