import 'package:erobot_mobile/services/base_apis/interceptors/user_token_inteceptor.dart';
import 'package:erobot_mobile/services/base_apis/networks/base_network.dart';
import 'package:erobot_mobile/services/base_apis/retry_policy/refresh_token_policy.dart';
import 'package:http_interceptor/http_interceptor.dart';

class UserTokenNetwork extends BaseNetwork {
  UserTokenNetwork() {
    addInterceptor(UserTokenInterceptor());
  }

  @override
  RetryPolicy? get retryPolicy => RefreshTokenPolicy(this);
}
