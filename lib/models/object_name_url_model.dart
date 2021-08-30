import 'package:erobot/helper/app_helper.dart';

class ObjectNameUrlModel {
  final String nameInUrl;
  final String path;

  ObjectNameUrlModel({required this.nameInUrl, required this.path});

  fetchOneUrl([String? id]) {
    if (id == null) return "$path/${this.nameInUrl}";
    return "$path/${this.nameInUrl}/$id";
  }

  fetchAllUrl() {
    return "$path/${this.nameInUrl}";
  }

  updatelUrl({String? id, Map<String, dynamic>? options, bool collection = true}) {
    if (id == null) assert(collection == false);

    var url = "$path/${this.nameInUrl}";
    if (collection) {
      url = "$url/$id";
    }
    if (options != null) {
      url += "?" + AppHelper.toQueryString(options);
    }
    return url;
  }

  deletelUrl({String? id, Map<String, dynamic>? options, bool collection = true}) {
    if (id == null) assert(collection == false);

    var url = "$path/${this.nameInUrl}";
    if (collection) {
      url = "$url/$id";
    }
    if (options != null) {
      url += "?" + AppHelper.toQueryString(options);
    }
    return url;
  }

  queryOneUrl() {
    return "$path/${this.nameInUrl}";
  }

  createUrl([Map<String, dynamic>? options]) {
    var url = "$path/${this.nameInUrl}";
    if (options != null) {
      url += "?" + AppHelper.toQueryString(options);
    }
    return url;
  }
}
