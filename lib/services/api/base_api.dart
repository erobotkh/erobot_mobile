import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:erobot/execption/network_exception.dart';
import 'package:erobot/mixin/json_mappable.dart';
import 'package:erobot/models/base_model.dart';
import 'package:erobot/models/network_error_model.dart';
import 'package:erobot/models/object_name_url_model.dart';
import 'package:erobot/network/base_network.dart';
import 'package:japx/japx.dart';

abstract class BaseApi with JsonMappable {
  BaseNetwork network = BaseNetwork(baseUrl: 'https://randomuser.me/api');
  Response<dynamic>? response;
  NetWorkErrorModel? networkError;
  var error;

  bool get useJapxDecode => false;
  bool get tranformResponse => true;

  success() {
    if (this.response != null) {
      return this.response!.statusCode! >= 200 && this.response!.statusCode! < 300;
    }
    return false;
  }

  Map<String, dynamic>? errors() {
    if (error == null) {
      return null;
    }
    if (error.response == null) {
      return null;
    }

    if (error is DioError) {
      var json = (error as DioError).response?.data;
      var result = jsonDecode(json);
      return result;
    } else {
      return null;
    }
  }

  String? errorMessage() {
    if (error == null) {
      return null;
    }
    if (error.response != null) {
      return errors()?['error'];
    } else {
      return error.message;
    }
  }

  beforeRunQueryExec(Function body) async {
    try {
      var result = await body();
      return result;
    } on DioError catch (err) {
      if (err is DioError) {
        NetWorkException netWorkException = NetWorkException(err);
        NetWorkErrorModel _networkError = netWorkException.translateException();
        networkError = _networkError;
      }
      error = err;
      return null;
    }
  }

  runQueryExec(Function queryBody) {
    this.response = null;
    this.error = null;
    return beforeRunQueryExec(queryBody);
  }

  getIncluded() {
    var json = jsonDecode(response.toString());
    var result = json['included'] ?? [];
    return result;
  }

  // >>>>>>>>>>>><<<<<<<<<<<<<
  // >>>>>   Fetch One <<<<<<<
  _fetchOne({String? id, Map<String, dynamic> options = const {}}) async {
    var endpoint = objectNameUrlModel.fetchOneUrl(id);

    response = await network.http?.get(
      endpoint,
      queryParameters: options,
    );

    if (response.toString().isEmpty) return;

    var json = jsonDecode(response.toString());

    var item;
    if (useJapxDecode) {
      final decoded = Japx.decode(json);
      item = decoded['data'];
    } else {
      var included = json['included'];
      item = mergeAttr(json?['data'], included: included);
    }

    var result = objectTransformer(item);
    return result;
  }

  fetchOne({String? id, bool collection = true, Map<String, dynamic>? options}) async {
    if (id == null) assert(collection == false);
    var response = await runQueryExec(() async {
      return await _fetchOne(id: id);
    });
    return response;
  }

  // >>>>>>>>>>>><<<<<<<<<<<<<
  // >>>>>   Fetch All <<<<<<<
  _fetchAll({Map<String, dynamic>? queryParameters}) async {
    var endpoint = objectNameUrlModel.fetchAllUrl();
    print('endpoint: $endpoint');
    response = await network.http?.get(endpoint, queryParameters: queryParameters);
    var json = jsonDecode(response.toString());

    var data = json;
    if (useJapxDecode) {
      data = Japx.decode(json);
    }

    var result = itemsTransformer(data);
    return result;
  }

  fetchAll({Map<String, dynamic>? queryParameters}) async {
    var result = await runQueryExec(() async {
      // if (queryParameters != null && !queryParameters.containsKey('per_page')) {
      //   queryParameters['per_page'] = ApiConstant.recordPerPage;
      // }
      // final _queryParameters = await getLocaleOptions(options: queryParameters);
      return await _fetchAll();
    });
    return result;
  }

  // >>>>>>>>>>>><<<<<<<<<<<<<
  // >>>>>   Update  <<<<<<<
  _update({String? id, Map<String, dynamic>? params, Map<String, dynamic>? options, bool collection = true}) async {
    var endpoint = objectNameUrlModel.updatelUrl(id: id, options: options, collection: collection);

    response = await network.http?.patch(endpoint, data: params);
    if (response == null || response.toString().isEmpty) return;

    if (response?.headers.map['content-type']?.join().contains('text/html') == true) return;
    var json = jsonDecode(response.toString());

    var item;
    if (useJapxDecode) {
      final decoded = Japx.decode(json);
      item = decoded['data'];
    } else {
      var included = json['included'];
      item = mergeAttr(json?['data'], included: included);
    }

    var result = objectTransformer(item);

    return result;
  }

  Future update({
    String? id,
    Map<String, dynamic>? params,
    Map<String, dynamic>? options,
    bool collection = true,
  }) async {
    var result = runQueryExec(() async {
      // final _options = await getLocaleOptions(options: options);
      return await _update(id: id, params: params, collection: collection);
    });
    return result;
  }

  // >>>>>>>>>>>><<<<<<<<<<<<<
  // >>>>>  Delete <<<<<<<
  _delete({
    String? id,
    Map<String, dynamic>? params,
    Map<String, dynamic>? options,
    bool collection = true,
  }) async {
    var endpoint = objectNameUrlModel.deletelUrl(id: id, options: options, collection: collection);

    response = await network.http?.delete(endpoint, data: params);
    if (response.toString().isEmpty) return;

    var json = jsonDecode(response.toString());

    var item;
    if (useJapxDecode) {
      final decoded = Japx.decode(json);
      item = decoded['data'];
    } else {
      var included = json['included'];
      item = mergeAttr(json?['data'], included: included);
    }
    var result = objectTransformer(item);
    return result;
  }

  delete({
    String? id,
    Map<String, dynamic>? params,
    Map<String, dynamic>? options,
    bool collection = true,
  }) async {
    var result = await runQueryExec(() async {
      // final _options = await getLocaleOptions(options: options);
      return await _delete(id: id, params: params, collection: collection);
    });
    return result;
  }

  // >>>>>>>>>>>><<<<<<<<<<<<<
  // >>>>>  Delete <<<<<<<
  _create(BaseModel record, {Map<String, dynamic>? options}) async {
    var endpoint = objectNameUrlModel.createUrl(options);
    var data = buildParams(record);
    response = await network.http?.post(endpoint, data: data);

    // some api return empty body even resoruce created
    // var jsonString = response.toString().isEmpty ? "{}" : response.toString();
    // var result = transformJsonToObject(jsonString);

    if (response?.toString().isEmpty == true) return '{}';
    var json = jsonDecode(response.toString());

    if (tranformResponse == false) return json;

    var item;
    if (useJapxDecode) {
      final decoded = Japx.decode(json);
      item = decoded['data'];
    } else {
      var included = json['included'];
      item = mergeAttr(json?['data'], included: included);
    }

    var result = item is Map<String, dynamic> ? objectTransformer(item) : null;
    return result;
  }

  create(BaseModel record, {Map<String, dynamic>? options}) async {
    var result = await runQueryExec(() async {
      // final _options = await getLocaleOptions(options: options);
      return await _create(record);
    });
    return result;
  }

  buildParams(BaseModel record) {
    if (this.nameInParams().isEmpty) {
      var result = record.createParams();
      return result;
    }
    return {'${this.nameInParams()}': record.createParams()};
  }

  String nameInUrl();
  String nameInParams() {
    return '';
  }

  objectTransformer(Map<String, dynamic> json);
  itemsTransformer(Map<String, dynamic> json) {}

  ObjectNameUrlModel get objectNameUrlModel {
    return ObjectNameUrlModel(nameInUrl: nameInUrl(), path: network.baseUrl ?? '');
  }
}
