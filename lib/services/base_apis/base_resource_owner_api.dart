import 'package:erobot_mobile/services/base_apis/base_api.dart';
import 'package:erobot_mobile/services/base_apis/networks/base_network.dart';
import 'package:erobot_mobile/services/base_apis/networks/user_token_network.dart';

abstract class BaseResourceOwnerApi<T> extends BaseApi<T> {
  @override
  BaseNetwork buildNetwork() {
    return UserTokenNetwork();
  }
}
