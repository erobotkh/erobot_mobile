import 'package:erobot_mobile/services/base_apis/base_api.dart';
import 'package:erobot_mobile/services/base_apis/networks/app_network.dart';
import 'package:erobot_mobile/services/base_apis/networks/base_network.dart';

abstract class BaseAppApi<T> extends BaseApi<T> {
  @override
  BaseNetwork buildNetwork() {
    return AppNetwork();
  }
}
