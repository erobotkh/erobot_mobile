import 'package:json_annotation/json_annotation.dart';

part 'object_name_url_model.g.dart';

@JsonSerializable()
class ObjectNameUrlModel {
  final String nameInUrl;
  final String? path;
  final String baseUrl;

  ObjectNameUrlModel({
    required this.nameInUrl,
    required this.path,
    required this.baseUrl,
  });

  String _withBaseUrl(String currentUrl, {Map<String, dynamic>? queryParameters}) {
    String query = Uri(queryParameters: queryParameters).query;

    if (query.isNotEmpty) {
      return baseUrl + currentUrl + "?" + query;
    }

    return baseUrl + currentUrl;
  }

  String fetchOneUrl({required String? id, Map<String, dynamic>? queryParameters}) {
    var url = "$path/$nameInUrl";
    if (id != null) url = "$url/$id";
    return _withBaseUrl(url, queryParameters: queryParameters);
  }

  String fetchAllUrl({Map<String, dynamic>? queryParameters}) {
    return _withBaseUrl("$path/$nameInUrl", queryParameters: queryParameters);
  }

  String updatelUrl({String? id, Map<String, dynamic>? queryParameters}) {
    var url = "$path/$nameInUrl";
    if (id != null) url = "$url/$id";
    return _withBaseUrl(url, queryParameters: queryParameters);
  }

  String deletelUrl({String? id, Map<String, dynamic>? queryParameters}) {
    var url = "$path/$nameInUrl";
    if (id != null) url = "$url/$id";
    return _withBaseUrl(url, queryParameters: queryParameters);
  }

  String createUrl({Map<String, dynamic>? queryParameters}) {
    var url = "$path/$nameInUrl";
    return _withBaseUrl(url, queryParameters: queryParameters);
  }

  factory ObjectNameUrlModel.fromJson(Map<String, dynamic> json) => _$ObjectNameUrlModelFromJson(json);
  Map<String, dynamic> toJson() => _$ObjectNameUrlModelToJson(this);
}
