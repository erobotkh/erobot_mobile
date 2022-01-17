import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  String? id;
  String? type;
  String? firstName;
  String? lastName;
  String? email;
  String? profileImage;

  UserModel({
    this.id,
    this.type,
    this.firstName,
    this.lastName,
    this.email,
    this.profileImage,
  });

  /// For get full name in International format
  String get fullNameI => '$firstName $lastName';

  /// For get full name in Khmer Format
  String get fullNameK => '$lastName $firstName';

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
