import 'dart:convert';
import 'dart:io';
import 'package:erobot_mobile/app/data/models/user_token_model.dart';
import 'package:erobot_mobile/constants/api_constant.dart';
import 'package:erobot_mobile/services/base_apis/networks/default_network.dart';
import 'package:erobot_mobile/services/storages/user_token_storage.dart';
import 'package:get/get_connect/http/src/response/response.dart';

class AuthApi {
  Response? response;
  DefaultNetwork? network;
  late UserTokenStorage storage;

  AuthApi() {
    network = DefaultNetwork();
    storage = UserTokenStorage();
  }

  bool success() {
    if (response == null) return false;
    return response!.statusCode == 200;
  }

  String? errorMessage() {
    if (response?.body == null) return null;
    var json = jsonDecode(response!.body);
    if (json is Map && json.containsKey('message')) {
      return json['message'];
    }
  }

  Future<dynamic> _beforeExec(Future<dynamic> Function() body) async {
    response = null;
    try {
      return await body();
    } on SocketException {
      return Future.error('No Internet connection');
    } on FormatException {
      return Future.error('Bad response format');
    } on Exception {
      return Future.error('Unexpected error');
    }
  }

  Future<void> saveToStorage(Map<String, dynamic> data) async {
    print(data);
    await storage.writeMap(data);
  }

  Future<void> loginWithSocialAccount({required String idToken}) async {
    return _beforeExec(() async {
      var body = {
        "id_token": idToken,
        "grant_type": "credential",
      };

      response = await network?.post(authPath, jsonEncode(body));

      if (success() && response?.body != null) {
        var json = jsonDecode(response!.body);
        saveToStorage(json);
      }
    });
  }

  Future<void> loginWithEmail({
    required String email,
    required String password,
  }) async {
    return _beforeExec(() async {
      var body = {
        "email": email,
        "password": password,
        "grant_type": "password",
      };

      response = await network?.post(authPath, jsonEncode(body));

      if (success() && response?.body != null) {
        var json = jsonDecode(response!.body);
        saveToStorage(json);
      }
    });
  }

  Future<UserToken?> getCurrentUserToken() async {
    var json = await storage.readMap();
    if (json != null) {
      var validated = {for (var e in json.entries) e.key: e.value};
      return UserToken.fromJson(validated);
    }
  }

  Future<void> reAuthenticate({required String refreshToken}) async {
    return _beforeExec(() async {
      Map<String, String> body = {
        "grant_type": "refresh_token",
        "refresh_token": refreshToken,
      };
      response = await network?.post(authPath, jsonEncode(body));
      if (success() && response?.body != null) {
        var json = jsonDecode(response!.body);
        saveToStorage(json);
      }
    });
  }

  String get authPath => ApiConstant.authPath;
}
