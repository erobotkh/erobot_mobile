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
    if (response?.statusCode != null) {
      return response!.statusCode! >= 200 && response!.statusCode! < 300;
    }
    return false;
  }

  String? message() {
    if (response?.bodyString == null) return null;
    try {
      dynamic json = jsonDecode(response!.bodyString!);
      if (json is Map && json.containsKey('message')) {
        return json['message'];
      }
    } catch (e) {
      return null;
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
    await storage.writeMap(data);
  }

  Future<void> logOut() async {
    return storage.remove();
  }

  Future<void> registerWithEmail({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  }) {
    return _beforeExec(() async {
      var body = {
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "password": password,
      };

      print(body);

      response = await network?.post(registerEndpoint, jsonEncode(body));
      if (success() && response?.bodyString != null) {
        var json = jsonDecode(response!.bodyString!);
        saveToStorage(json);
      }
    });
  }

  Future<void> loginWithSocialAccount({required String idToken}) async {
    return _beforeExec(() async {
      var body = {
        "id_token": idToken,
        "grant_type": "credential",
      };

      response = await network?.post(socialEndpoint, jsonEncode(body));

      if (success() && response?.bodyString != null) {
        var json = jsonDecode(response!.bodyString!);
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

      response = await network?.post(loginEndpoint, jsonEncode(body));

      if (success() && response?.bodyString != null) {
        var json = jsonDecode(response!.bodyString!);
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
      response = await network?.post(refreshTokenEndpoint, jsonEncode(body));
      if (success() && response?.bodyString != null) {
        var json = jsonDecode(response!.bodyString!);
        saveToStorage(json);
      }
    });
  }

  String get baseUrl => ApiConstant.baseUrl;
  String get refreshTokenEndpoint => "$baseUrl/auth/refresh-token";
  String get registerEndpoint => "$baseUrl/auth/register";
  String get loginEndpoint => "$baseUrl/auth/login";
  String get socialEndpoint => "$baseUrl/auth/social";
}
