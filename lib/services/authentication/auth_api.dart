import 'package:dio/dio.dart';
import 'package:erobot/constant/api_constant.dart';
import 'package:erobot/execption/network_exception.dart';
import 'package:erobot/models/network_error_model.dart';
import 'package:erobot/services/authentication/base_user_authenticator.dart';

class AuthApi extends BaseUserAuthenticator {
  AuthApi() : super();

  bool success() {
    var result = (this.response!.statusCode! >= 200 && this.response!.statusCode! < 300);
    return result;
  }

  Future<void> login({
    required String email,
    required String password,
  }) async {
    Map<String, dynamic> emailPassword = {
      'email': email,
      'password': password,
    };

    response = null;
    response = await _authRequest(path: 'login', data: emailPassword);
    if (success()) saveToStorage(response?.data);
  }

  Future<void> register({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  }) async {
    Map<String, dynamic> emailPassword = {
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'password': password,
    };

    response = null;
    response = await _authRequest(path: 'register', data: emailPassword);
    if (success()) saveToStorage(response?.data);
  }

  _authRequest({
    required String path,
    required Map<String, dynamic> data,
  }) async {
    String endPoint = ApiConstant.baseUrl + '/auth/' + '$path';

    try {
      Response result = await this.network!.http!.post(endPoint, data: data);
      return result;
    } catch (e) {
      if (e is DioError) {
        NetWorkException netWorkException = NetWorkException(e);
        NetWorkErrorModel _error = netWorkException.translateException();
        super.networkError = _error;
      }
    }
  }
}
