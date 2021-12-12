import 'package:erobot_mobile/mixins/toast.dart';
import 'package:erobot_mobile/services/iot/base_iot_service.dart';
import 'package:get/get.dart';

class IotResponse {
  final String? titleMessage;
  final String? message;
  final bool success;

  IotResponse({
    required this.titleMessage,
    required this.message,
    required this.success,
  });

  IotResponse.fail({this.titleMessage, this.message}) : success = false;
  IotResponse.success({this.titleMessage, this.message}) : success = false;
}

class IotController extends GetxController with Toast {
  BaseIotService? service;
  String? lastMessage;

  String? title;
  String? message;

  void setService(BaseIotService value) {
    service = value;
    lastMessage = null;
  }

  Future<IotResponse> write(String textToSend) async {
    lastMessage = null;
    if (textToSend.isEmpty) return IotResponse.fail();
    bool success;

    lastMessage = textToSend;
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

    return IotResponse(titleMessage: title, message: message, success: success);
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
