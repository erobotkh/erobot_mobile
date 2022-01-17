import 'package:erobot_mobile/app/routes/app_pages.dart';
import 'package:erobot_mobile/models/comment_model.dart';
import 'package:erobot_mobile/models/user_model.dart';
import 'package:get/get.dart';

class CommentController extends GetxController {
  // Static comments
  final List<CommentModel> _comments = [
    CommentModel(
      user: UserModel(
        id: 'gfhlvaspmsnvsxffgvfgds',
        firstName: 'Lee',
        lastName: 'Jonhson',
        profileImage: 'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
      ),
      time: '1 day ago',
      content: 'Hello my name is Lee Jonhson.'
          ' When I write this comment, please do not read it.'
          ' if you read this, it mean you read the text that I do not want you to read.',
    ),
    CommentModel(
      user: UserModel(
        id: 'gfhlvaspmsnvsxffgvfgds',
        firstName: 'Lee',
        lastName: 'Jonhson',
        profileImage: 'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
      ),
      time: '1 day ago',
      content: 'Hello my name is Lee Jonhson.'
          ' When I write this comment, please do not read it.'
          ' if you read this, it mean you read the text that I do not want you to read.',
    ),
    CommentModel(
      user: UserModel(
        id: 'gfhlvaspmsnvsxffgvfgds',
        firstName: 'Lee',
        lastName: 'Jonhson',
        profileImage: 'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
      ),
      time: '1 day ago',
      content: 'Hello my name is Lee Jonhson.'
          ' When I write this comment, please do not read it.'
          ' if you read this, it mean you read the text that I do not want you to read.',
    ),
    CommentModel(
      user: UserModel(
        id: 'gfhlvaspmsnvsxffgvfgds',
        firstName: 'Lee',
        lastName: 'Jonhson',
        profileImage: 'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
      ),
      time: '1 day ago',
      content: 'Hello my name is Lee Jonhson.'
          ' When I write this comment, please do not read it.'
          ' if you read this, it mean you read the text that I do not want you to read.',
    ),
    CommentModel(
      user: UserModel(
        id: 'gfhlvaspmsnvsxffgvfgds',
        firstName: 'Lee',
        lastName: 'Jonhson',
        profileImage: 'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
      ),
      time: '1 day ago',
      content: 'Hello my name is Lee Jonhson.'
          ' When I write this comment, please do not read it.'
          ' if you read this, it mean you read the text that I do not want you to read.',
    ),
    CommentModel(
      user: UserModel(
        id: 'gfhlvaspmsnvsxffgvfgds',
        firstName: 'Lee',
        lastName: 'Jonhson',
        profileImage: 'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
      ),
      time: '1 day ago',
      content: 'Hello my name is Lee Jonhson.'
          ' When I write this comment, please do not read it.'
          ' if you read this, it mean you read the text that I do not want you to read.',
    ),
  ];

  List<CommentModel> get comments => _comments;

  int get totalComments => _comments.length;

  //

  bool get isOpenedPage => Get.currentRoute == Routes.COMMENT;

  void onTapTextFiled() {
    if (!isOpenedPage) {
      Get.offNamed(Routes.COMMENT);
    }
  }
}
