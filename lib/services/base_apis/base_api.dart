import 'dart:convert';
import 'dart:io';
import 'package:erobot_mobile/app/data/models/base/links_model.dart';
import 'package:erobot_mobile/app/data/models/base/meta_model.dart';
import 'package:erobot_mobile/app/data/models/base/object_name_url_model.dart';
import 'package:erobot_mobile/constants/api_constant.dart';
import 'package:erobot_mobile/helpers/app_helper.dart';
import 'package:erobot_mobile/services/base_apis/networks/base_network.dart';
import 'package:japx/japx.dart';
import 'package:http/http.dart';

abstract class BaseApi<T> {
  Response? response;
  BaseNetwork? network;
  BaseNetwork buildNetwork();

  bool get useJapx => true;

  BaseApi() {
    network = buildNetwork();
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

  Future<dynamic> fetchOne({
    String? id,
    Map<String, dynamic>? queryParameters,
  }) async {
    return _beforeExec(() async {
      String endpoint = objectNameUrlModel.fetchOneUrl(id: id, queryParameters: queryParameters);
      response = await network?.http?.get(Uri.parse(endpoint));
      dynamic json = jsonDecode(response?.body.toString() ?? "");
      if (json is Map<String, dynamic>) {
        if (json.containsKey('data')) json = useJapx ? Japx.decode(json) : json;
        return objectTransformer(json);
      }
    });
  }

  Future<dynamic> fetchAll({
    Map<String, dynamic>? queryParameters,
  }) async {
    queryParameters = buildFetchAlQueryParameters(queryParameters);
    return _beforeExec(() async {
      String endpoint = objectNameUrlModel.fetchAllUrl(queryParameters: queryParameters);
      response = await network?.http?.get(Uri.parse(endpoint));
      dynamic json = jsonDecode(response?.body.toString() ?? "");
      json = useJapx ? Japx.decode(json) : json;
      return itemsTransformer(json);
    });
  }

  Future<dynamic> update({
    required String id,
    required Map<String, dynamic> body,
    Map<String, dynamic>? queryParameters,
  }) {
    return _beforeExec(() async {
      String endpoint = objectNameUrlModel.updatelUrl(id: id, queryParameters: queryParameters);
      response = await network?.http?.put(Uri.parse(endpoint), body: jsonEncode(body));
      dynamic json = jsonDecode(response?.body.toString() ?? "");
      if (json is Map<String, dynamic>) {
        if (json.containsKey('data')) json = useJapx ? Japx.decode(json) : json;
        return objectTransformer(json);
      }
    });
  }

  Future<dynamic> create({
    required Map<String, dynamic> body,
    Map<String, dynamic>? queryParameters,
  }) {
    return _beforeExec(() async {
      String endpoint = objectNameUrlModel.createUrl(queryParameters: queryParameters);
      response = await network?.http?.post(Uri.parse(endpoint), body: jsonEncode(body));

      dynamic json;
      try {
        json = jsonDecode(response?.body.toString() ?? "");
      } catch (e) {
        return null;
      }

      if (json is Map<String, dynamic>) {
        if (json.containsKey('data')) json = useJapx ? Japx.decode(json) : json;
        return objectTransformer(json);
      }
      return json;
    });
  }

  Future<dynamic> delete({
    String? id,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic> body = const {},
  }) {
    return _beforeExec(() async {
      String endpoint = objectNameUrlModel.deletelUrl(id: id, queryParameters: queryParameters);
      response = await network?.http?.delete(Uri.parse(endpoint), body: jsonEncode(body));
      dynamic json = jsonDecode(response?.body.toString() ?? "");
      if (json is Map<String, dynamic>) {
        if (json.containsKey('data')) json = useJapx ? Japx.decode(json) : json;
        return objectTransformer(json);
      }
      return json;
    });
  }

  T objectTransformer(Map<String, dynamic> json);
  itemsTransformer(Map<String, dynamic> json) {}

  List<T>? buildItems(Map<String, dynamic> json) {
    if (json.containsKey('data') && json['data'] != null) {
      List data = json['data'];
      List<T> items = [];
      for (var item in data) {
        Map<String, dynamic>? attrs = item;
        T record = objectTransformer(attrs ?? {});
        items.add(record);
      }
      return items;
    }
  }

  Meta? buildMeta(Map<String, dynamic> json) {
    if (json.containsKey('meta') && json['meta'] != null) {
      return Meta.fromJson(json['meta']);
    }
  }

  Links? buildLinks(Map<String, dynamic> json) {
    if (json.containsKey('links') && json['links'] != null) {
      return Links.fromJson(json['links']);
    }
  }

  Map<String, dynamic> sliceParams(Map<String, dynamic> values, List<String> names) {
    Map<String, dynamic> result = {};
    names.forEach((element) {
      result[element] = values[element];
    });
    return result;
  }

  Map<String, dynamic>? buildFetchAlQueryParameters(Map<String, dynamic>? queryParameters) {
    Map<String, dynamic> perPage = {"per_page": "10"};
    queryParameters ??= perPage;
    if (!queryParameters.containsKey('per_page')) {
      queryParameters.addAll(perPage);
    }
    queryParameters = AppHelper.filterOutNull(queryParameters);
    return queryParameters;
  }

  String get nameInUrl;
  String get baseUrl => ApiConstant.baseUrl;

  ObjectNameUrl get objectNameUrlModel {
    return ObjectNameUrl(nameInUrl: nameInUrl, path: "", baseUrl: baseUrl);
  }
}
