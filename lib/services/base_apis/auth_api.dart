import 'dart:convert';
import 'dart:io';
import 'package:erobot_mobile/models/user_token_model.dart';
import 'package:erobot_mobile/constants/api_constant.dart';
import 'package:erobot_mobile/services/base_apis/networks/base_network.dart';
import 'package:erobot_mobile/services/storages/user_token_storage.dart';
import 'package:http/http.dart';

class AuthApi {
  Response? response;
  BaseNetwork? network;
  late UserTokenStorage storage;

  AuthApi() {
    network = BaseNetwork();
    storage = UserTokenStorage();
  }

  bool success() {
    if (response == null) return false;
    if (response?.statusCode != null) {
      return response!.statusCode >= 200 && response!.statusCode < 300;
    }
    return false;
  }

  String? message() {
    if (response?.body == null) return null;
    try {
      dynamic json = jsonDecode(response!.body);
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

      Uri endpoint = Uri.parse(registerEndpoint);
      response = await network?.http?.post(endpoint, body: jsonEncode(body));

      if (success() && response?.body != null) {
        var json = jsonDecode(response!.body);
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

      Uri endpoint = Uri.parse(socialEndpoint);
      response = await network?.http?.post(endpoint, body: jsonEncode(body));

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

      Uri endpoint = Uri.parse(loginEndpoint);
      response = await network?.http?.post(endpoint, body: jsonEncode(body));

      if (success() && response?.body != null) {
        var json = jsonDecode(response!.body);
        saveToStorage(json);
      }
    });
  }

  Future<UserTokenModel?> getCurrentUserToken() async {
    var json = await storage.readMap();
    if (json != null) {
      var validated = {for (var e in json.entries) e.key: e.value};
      return UserTokenModel.fromJson(validated);
    }
  }

  Future<void> reAuthenticate({required String refreshToken}) async {
    return _beforeExec(() async {
      Map<String, String> body = {
        "grant_type": "refresh_token",
        "refresh_token": refreshToken,
      };
      Uri endpoint = Uri.parse(refreshTokenEndpoint);
      response = await network?.http?.post(endpoint, body: jsonEncode(body));

      if (success() && response?.body != null) {
        var json = jsonDecode(response!.body);
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
