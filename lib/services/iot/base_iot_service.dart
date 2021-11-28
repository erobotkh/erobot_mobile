import 'package:erobot_mobile/services/iot/model/iot_device_model.dart';

abstract class BaseIotService {
  IotDeviceModel? get connectedDevice;

  read();
  Future<void> write(String message);
}
