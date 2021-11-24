import 'package:json_annotation/json_annotation.dart';

part 'meta_model.g.dart';

@JsonSerializable()
class MetaModel {
  int? count;
  int? totalCount;
  int? totalPages;
  int? currentPage;

  MetaModel({
    this.count,
    this.totalCount,
    this.totalPages,
    this.currentPage,
  });

  factory MetaModel.fromJson(Map<String, dynamic> json) => _$MetaModelFromJson(json);
  Map<String, dynamic> toJson() => _$MetaModelToJson(this);
}
