import 'package:erobot_mobile/app/modules/comment/controllers/comment_controller.dart';
import 'package:get/get.dart';

import '../controllers/post_detail_controller.dart';

class PostDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PostDetailController>(
      () => PostDetailController(),
    );
    Get.lazyPut<CommentController>(
      () => CommentController(),
      fenix: true,
    );
  }
}
