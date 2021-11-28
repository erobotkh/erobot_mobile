import 'package:erobot_mobile/mixins/toast.dart';
import 'package:erobot_mobile/services/iot/base_iot_service.dart';
import 'package:get/get.dart';

class IotController extends GetxController with Toast {
  BaseIotService? service;

  setService(BaseIotService value) {
    service = value;
  }

  Future<bool> write(String textToSend) async {
    if (textToSend.isEmpty) return false;

    String title = "";
    String message = "";
    bool success;

    try {
      await service?.write(textToSend);
      title = "Send to ${service?.connectedDevice?.name}";
      message = textToSend;
      success = true;
    } catch (e) {
      title = "Fail";
      message = e.toString();
      success = false;
    }

    showSnackbar(
      title: title,
      message: message,
      showProgressIndicator: true,
    );

    return success;
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
