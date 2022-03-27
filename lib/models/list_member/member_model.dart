import 'package:erobot_mobile/models/list_member/social_model.dart';
import 'package:erobot_mobile/models/list_member/team_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'member_model.g.dart';

@JsonSerializable()
class MemberModel {
  String? id;
  String? type;
  String? role;
  String? firstName;
  String? lastName;
  String? profileUrl;
  String? updatedAt;
  String? createdAt;
  List<SocialModel>? socials;
  TeamModel? team;

  MemberModel({
    this.id,
    this.type,
    this.role,
    this.firstName,
    this.lastName,
    this.profileUrl,
    this.socials,
    this.team,
    this.updatedAt,
    this.createdAt,
  });

  factory MemberModel.fromJson(Map<String, dynamic> json) => _$MemberModelFromJson(json);
  Map<String, dynamic> toJson() => _$MemberModelToJson(this);
}
