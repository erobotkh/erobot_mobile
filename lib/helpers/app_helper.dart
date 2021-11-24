class AppHelper {
  AppHelper._internal();

  static String? queryParameters({required String url, required String param}) {
    return Uri.parse(url).queryParameters[param];
  }

  static Map<String, dynamic> filterOutNull(Map<String, dynamic> json) {
    json.forEach((key, value) {
      dynamic value = json[key];
      if (value != null && value is List) {
        value.removeWhere((e) => e == null || e == "null");
        json[key] = value;
      }
    });
    json.removeWhere((key, value) => value == null || value == "null" || (value is List && value.isEmpty));
    return json;
  }
}
