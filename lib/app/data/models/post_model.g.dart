// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostModel _$PostModelFromJson(Map<String, dynamic> json) => PostModel(
      type: json['type'] as String?,
      body: json['body'] as String?,
      updatedAt: json['updated_at'] as String?,
      createdAt: json['created_at'] as String?,
      commentCount: json['comment_count'] as int?,
      reactionCount: json['reaction_count'] as int?,
      id: json['id'] as String?,
      images: (json['images'] as List<dynamic>?)
          ?.map((e) => ImageModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      author: json['author'] == null
          ? null
          : UserModel.fromJson(json['author'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PostModelToJson(PostModel instance) => <String, dynamic>{
      'type': instance.type,
      'body': instance.body,
      'updated_at': instance.updatedAt,
      'created_at': instance.createdAt,
      'comment_count': instance.commentCount,
      'reaction_count': instance.reactionCount,
      'id': instance.id,
      'images': instance.images?.map((e) => e.toJson()).toList(),
      'author': instance.author?.toJson(),
    };
