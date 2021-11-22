import 'package:erobot_mobile/helpers/app_helper.dart';
import 'package:json_annotation/json_annotation.dart';

part 'links_model.g.dart';

@JsonSerializable()
class LinksModel {
  String? self;
  String? next;
  dynamic prev;
  String? last;

  LinksModel({
    this.self,
    this.next,
    this.prev,
    this.last,
  });

  LinksModel getPageNumber() {
    return LinksModel(
      self: AppHelper.queryParameters(url: self ?? "", param: 'page'),
      prev: AppHelper.queryParameters(url: prev ?? "", param: 'page'),
      next: AppHelper.queryParameters(url: next ?? "", param: 'page'),
      last: AppHelper.queryParameters(url: last ?? "", param: 'page'),
    );
  }

  factory LinksModel.fromJson(Map<String, dynamic> json) => _$LinksModelFromJson(json);
  Map<String, dynamic> toJson() => _$LinksModelToJson(this);
}
