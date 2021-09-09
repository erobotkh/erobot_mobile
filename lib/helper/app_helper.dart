import 'package:dio/dio.dart';

class AppHelper {
  static String toQueryString(Map<String, dynamic> options) {
    var outgoingUri = Transformer.urlEncodeMap(options);
    return outgoingUri;
  }
}
