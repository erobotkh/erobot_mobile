import 'package:json_annotation/json_annotation.dart';

part 'social_model.g.dart';

@JsonSerializable()
class SocialModel {
  String? provider;
  String? href;

  SocialModel({
    this.provider,
    this.href,
  });

  factory SocialModel.fromJson(Map<String, dynamic> json) => _$SocialModelFromJson(json);
  Map<String, dynamic> toJson() => _$SocialModelToJson(this);
}
