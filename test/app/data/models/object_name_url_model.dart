import 'package:erobot_mobile/app/data/models/object_name_url_model.dart';
import 'package:erobot_mobile/constants/api_constant.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ObjectNameUrlModel', () {
    test('return true is uri is matched', () async {
      final uri = ObjectNameUrl(
        baseUrl: ApiConstant.baseUrl,
        path: "",
        nameInUrl: "posts",
      );
      String url = uri.fetchAllUrl(
        queryParameters: {
          "type": "post",
          "post_id": "123",
        },
      );
      expect(url, 'https://erobot-api.herokuapp.com/posts?type=post&post_id=123');
    });
  });
}
