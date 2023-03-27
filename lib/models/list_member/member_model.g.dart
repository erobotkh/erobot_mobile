// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'member_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MemberModel _$MemberModelFromJson(Map<String, dynamic> json) => MemberModel(
      id: json['id'] as String?,
      type: json['type'] as String?,
      role: json['role'] as String?,
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      profileUrl: json['profile_url'] as String?,
      socials: (json['socials'] as List<dynamic>?)
          ?.map((e) => SocialModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      team: json['team'] == null
          ? null
          : TeamModel.fromJson(json['team'] as Map<String, dynamic>),
      updatedAt: json['updated_at'] as String?,
      createdAt: json['created_at'] as String?,
    );

Map<String, dynamic> _$MemberModelToJson(MemberModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'role': instance.role,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'profile_url': instance.profileUrl,
      'updated_at': instance.updatedAt,
      'created_at': instance.createdAt,
      'socials': instance.socials?.map((e) => e.toJson()).toList(),
      'team': instance.team?.toJson(),
    };
