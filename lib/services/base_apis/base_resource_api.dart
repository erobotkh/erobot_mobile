import 'package:erobot_mobile/services/base_apis/base_api.dart';
import 'package:erobot_mobile/services/base_apis/networks/default_network.dart';
import 'package:erobot_mobile/services/base_apis/networks/user_token_network.dart';

abstract class BaseResourceOwnerApi<T> extends BaseApi<T> {
  @override
  DefaultNetwork buildConnect() {
    return UserTokenNetwork();
  }
}
