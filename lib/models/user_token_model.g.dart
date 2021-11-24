// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_token_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserTokenModel _$UserTokenModelFromJson(Map<String, dynamic> json) =>
    UserTokenModel(
      accessToken: json['access_token'] as String?,
      refreshToken: json['refresh_token'] as String?,
      tokenType: json['token_type'] as String?,
      expiresIn: json['expires_in'] as int?,
      createdAt: json['created_at'] as int?,
    );

Map<String, dynamic> _$UserTokenModelToJson(UserTokenModel instance) =>
    <String, dynamic>{
      'access_token': instance.accessToken,
      'refresh_token': instance.refreshToken,
      'token_type': instance.tokenType,
      'expires_in': instance.expiresIn,
      'created_at': instance.createdAt,
    };
