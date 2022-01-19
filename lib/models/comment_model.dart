import 'package:erobot_mobile/models/user_model.dart';

class CommentModel {
  CommentModel({
    required this.user,
    required this.time,
    required this.content,
  });

  final UserModel user;
  final String time;
  final String content;
}
