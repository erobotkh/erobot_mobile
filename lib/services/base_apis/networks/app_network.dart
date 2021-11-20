import 'package:erobot_mobile/services/base_apis/networks/base_network.dart';
import 'package:http_interceptor/http_interceptor.dart';

class AppNetwork extends BaseNetwork {
  @override
  RetryPolicy? get retryPolicy => null;
}
