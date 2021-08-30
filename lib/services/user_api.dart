import 'package:erobot/services/api/base_api.dart';

class UserApi extends BaseApi {
  @override
  String nameInUrl() {
    return '';
  }

  @override
  objectTransformer(Map<String, dynamic> json) {
    return json;
  }
}
