// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'object_name_url_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ObjectNameUrlModel _$ObjectNameUrlModelFromJson(Map<String, dynamic> json) =>
    ObjectNameUrlModel(
      nameInUrl: json['name_in_url'] as String,
      path: json['path'] as String?,
      baseUrl: json['base_url'] as String,
    );

Map<String, dynamic> _$ObjectNameUrlModelToJson(ObjectNameUrlModel instance) =>
    <String, dynamic>{
      'name_in_url': instance.nameInUrl,
      'path': instance.path,
      'base_url': instance.baseUrl,
    };
