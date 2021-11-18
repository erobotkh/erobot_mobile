import 'dart:convert';
import 'package:erobot_mobile/app/data/models/user_token_model.dart';
import 'package:erobot_mobile/services/base_apis/auth_api.dart';
import 'package:erobot_mobile/services/base_apis/networks/default_network.dart';
import 'package:erobot_mobile/services/storages/user_token_storage.dart';

class UserTokenNetwork extends DefaultNetwork {
  final AuthApi _auth = AuthApi();
  final UserTokenStorage _userTokenStorage = UserTokenStorage();

  @override
  void onInit() {
    setBearerToken();
    setRefreshToken();
    super.onInit();
  }

  void setBearerToken() async {
    httpClient.addRequestModifier<Object?>((request) async {
      String? accessToken = await _userTokenStorage.getCurrentUserToken().then((value) => value?.accessToken);
      request.headers['Authorization'] = "Bearer $accessToken";
      return request;
    });
  }

  void setRefreshToken() async {
    httpClient.addResponseModifier<dynamic>((request, response) async {
      if (response.statusCode == 401 && response.body != null) {
        final json = jsonDecode(response.body!);

        if (json['message'] == "JWT expired") {
          UserToken? model = await _userTokenStorage.getCurrentUserToken();
          if (model?.refreshToken == null) return false;

          // max retry 5 times
          if (retryCount > 5) {
            await _auth.reAuthenticate(refreshToken: model!.refreshToken!);
            String? accessToken = await _userTokenStorage.getCurrentUserToken().then((value) => value?.accessToken);
            request.headers['Authorization'] = "Bearer $accessToken";
            retryCount++;
          }

          return request;
        }
      }
    });
  }
}
