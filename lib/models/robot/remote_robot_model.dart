import 'package:json_annotation/json_annotation.dart';

part 'remote_robot_model.g.dart';

@JsonSerializable()
class RemoteRobotModel {
  String? moveFront;
  String? moveLeft;
  String? moveBack;
  String? moveRight;

  RemoteRobotModel({
    this.moveFront,
    this.moveLeft,
    this.moveBack,
    this.moveRight,
  });

  factory RemoteRobotModel.fromJson(Map<String, dynamic>? json) {
    return RemoteRobotModel(
      moveFront: json?["move_front"],
      moveLeft: json?["move_left"],
      moveRight: json?["move_right"],
      moveBack: json?["move_back"],
    );
  }
  Map<String, dynamic> toJson() => _$RemoteRobotModelToJson(this);
}
