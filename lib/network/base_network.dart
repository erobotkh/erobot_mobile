import 'package:dio/dio.dart';

import 'intercepter/default_interceptor.dart';

class BaseNetwork {
  Dio? http;
  DioError? error;
  String? baseUrl;

  BaseNetwork({required this.baseUrl}) {
    this.http = Dio();
    this.http?.interceptors.add(DefaultInterceptor(baseUrl: baseUrl ?? ""));
  }

  addInterceptor(InterceptorsWrapper interceptor) {
    this.http?.interceptors.add(interceptor);
  }

  removeInterceptor(InterceptorsWrapper interceptor) {
    this.http?.interceptors.remove(interceptor);
  }
}
