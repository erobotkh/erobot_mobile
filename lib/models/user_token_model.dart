import 'package:json_annotation/json_annotation.dart';
part 'user_token_model.g.dart';

@JsonSerializable()
class UserTokenModel {
  String? accessToken;
  String? refreshToken;
  String? tokenType;
  int? expiresIn;
  int? createdAt;

  UserTokenModel({
    this.accessToken,
    this.refreshToken,
    this.tokenType,
    this.expiresIn,
    this.createdAt,
  });

  factory UserTokenModel.fromJson(Map<String, dynamic> json) => _$UserTokenModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserTokenModelToJson(this);
}
