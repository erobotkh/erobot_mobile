import 'package:erobot_mobile/configs/config_environments.dart';
import 'package:get/get_connect.dart';

class DefaultNetwork extends GetConnect {
  int retryCount = 0;

  @override
  void onInit() {
    _setBaseUrl();

    retryCount = 0;
    super.onInit();
  }

  void _setBaseUrl() {
    Environment _appEnv = ConfigEnvironments.getEnvironments();
    httpClient.baseUrl = _appEnv.url;
  }

  @override
  void onClose() {
    super.onClose();
  }

  @override
  void onReady() {
    super.onReady();
  }
}
