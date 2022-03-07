import 'package:erobot_mobile/models/robot/remote_robot_model.dart';
import 'package:erobot_mobile/services/storages/robot_remote_setting_storage.dart';
import 'package:get/get.dart';

class ThumbstickController extends GetxController {
  RemoteRobotModel? remoteRobot;
  RobotRemoteSettingStorage storage = RobotRemoteSettingStorage.instance;

  @override
  void onInit() {
    storage.readMap().then((value) {
      if (value?.isEmpty == true) {
        remoteRobot = RemoteRobotModel(
          moveFront: 'T',
          moveLeft: 'L',
          moveBack: 'B',
          moveRight: 'R',
        );
        updateConfig(remoteRobot);
      } else {
        remoteRobot = remoteRobot = RemoteRobotModel.fromJson(value);
      }
    });
    super.onInit();
  }

  updateConfig(RemoteRobotModel? config) {
    storage.writeMap(config?.toJson() ?? {});
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
