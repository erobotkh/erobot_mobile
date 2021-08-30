import 'package:dio/dio.dart';

class DefaultInterceptor extends InterceptorsWrapper {
  String baseUrl;
  DefaultInterceptor({required this.baseUrl});

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    options.baseUrl = this.baseUrl;
    super.onRequest(options, handler);
  }
}
