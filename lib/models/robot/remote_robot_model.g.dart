// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_robot_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteRobotModel _$RemoteRobotModelFromJson(Map<String, dynamic> json) =>
    RemoteRobotModel(
      moveFront: json['move_front'] as String?,
      moveLeft: json['move_left'] as String?,
      moveBack: json['move_back'] as String?,
      moveRight: json['move_right'] as String?,
    );

Map<String, dynamic> _$RemoteRobotModelToJson(RemoteRobotModel instance) =>
    <String, dynamic>{
      'move_front': instance.moveFront,
      'move_left': instance.moveLeft,
      'move_back': instance.moveBack,
      'move_right': instance.moveRight,
    };
