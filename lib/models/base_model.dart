abstract class BaseModel {
  String? id;
  Map<String, dynamic>? relationships;
  List<dynamic>? included = [];

  BaseModel({this.id, this.relationships, this.included});

  List<String> createParamNames() {
    return paramNames();
  }

  List<String> updateParamNames() {
    return paramNames();
  }

  List<String> paramNames() {
    List<String> names = toJson().keys.toList();
    names.remove("id");
    return names;
  }

  Map<String, dynamic> sliceParams(Map<String, dynamic> values, List<String> names) {
    Map<String, dynamic> result = {};
    names.forEach((element) {
      result[element] = values[element];
    });

    return result;
  }

  Map<String, dynamic> createParams() {
    var values = toJson();
    return sliceParams(values, createParamNames());
  }

  Map<String, dynamic> updateParams() {
    var values = toJson();
    return sliceParams(values, updateParamNames());
  }

  Map<String, dynamic> toJson();
}
