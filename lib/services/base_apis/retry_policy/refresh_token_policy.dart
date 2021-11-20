import 'dart:async';
import 'dart:convert';
import 'package:erobot_mobile/app/data/models/user_token_model.dart';
import 'package:erobot_mobile/services/base_apis/auth_api.dart';
import 'package:erobot_mobile/services/base_apis/networks/base_network.dart';
import 'package:http_interceptor/http_interceptor.dart';

class RefreshTokenPolicy extends RetryPolicy {
  final BaseNetwork network;
  final AuthApi auth = AuthApi();

  RefreshTokenPolicy(this.network);

  @override
  Future<bool> shouldAttemptRetryOnResponse(ResponseData response) async {
    if (response.statusCode == 401) {
      if (response.body != null) {
        final json = jsonDecode(response.body!);
        if (json['message'] == "JWT expired") {
          UserToken? model = await auth.getCurrentUserToken();
          if (model?.refreshToken == null) return false;
          await auth.reAuthenticate(refreshToken: model!.refreshToken!);
          network.retryCount++;
          return true;
        }
      }
    }
    return false;
  }
}
