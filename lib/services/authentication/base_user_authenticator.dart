import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:erobot/constant/api_constant.dart';
import 'package:erobot/models/network_error_model.dart';
import 'package:erobot/network/base_network.dart';
import 'package:erobot/storage/uesr_token_storage.dart';

class BaseUserAuthenticator {
  BaseNetwork? network;
  Response? response;

  NetWorkErrorModel? networkError;
  var error;

  BaseUserAuthenticator() {
    this.network = BaseNetwork(baseUrl: ApiConstant.baseUrl);
  }

  success() {
    if (this.response != null) {
      return (this.response!.statusCode! >= 200 && this.response!.statusCode! < 300);
    }
    return false;
  }

  Map<String, dynamic>? errors() {
    if (error == null) return null;
    if (error.response == null) return null;

    if (error is DioError) {
      var json = (error as DioError).response?.data;
      var result = jsonDecode(json);
      return result;
    } else
      return null;
  }

  String? errorMessage() {
    if (error == null) return null;

    if (error.response != null)
      return errors()?['error'];
    else
      return error.messages;
  }

  saveToStorage(Map<String, dynamic>? data) async {
    var userTokenStorage = UserTokenStorage();
    String value = jsonEncode(data);
    print(value);
    await userTokenStorage.write(value);
  }
}
