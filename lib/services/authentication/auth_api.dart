import 'package:dio/dio.dart';
import 'package:erobot/execption/network_exception.dart';
import 'package:erobot/models/base_model.dart';
import 'package:erobot/models/network_error_model.dart';
import 'package:erobot/services/authentication/base_user_authenticator.dart';

class AuthApi extends BaseUserAuthenticator {
  AuthApi() : super();

  bool success() {
    var result = (this.response!.statusCode! >= 200 && this.response!.statusCode! < 300);
    return result;
  }

  Future<void> exec({
    required String email,
    required String password,
  }) async {
    response = null;
    response = await _authRequest(
      email: email,
      password: password,
    );

    print(response?.data);

    if (success()) saveToStorage(response?.data);
  }

  _authRequest({
    required String email,
    required String password,
  }) async {
    Map<String, dynamic> emailPassword = {
      'email': email,
      'password': password,
    };

    try {
      Response result = await this.network!.http!.post(
            'https://erobot-api.herokuapp.com/auth/login',
            data: emailPassword,
          );
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

class Login extends BaseModel {
  final String? email;
  final String? password;

  Login({
    this.email,
    this.password,
  });

  @override
  Map<String, dynamic> toJson() {
    return {
      'email': this.email,
      'password': this.password,
    };
  }
}
