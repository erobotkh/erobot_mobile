import 'package:get/get.dart';

import 'package:erobot_mobile/app/modules/ball_shooter/bindings/ball_shooter_binding.dart';
import 'package:erobot_mobile/app/modules/ball_shooter/views/ball_shooter_view.dart';
import 'package:erobot_mobile/app/modules/education/bindings/education_binding.dart';
import 'package:erobot_mobile/app/modules/education/views/education_view.dart';
import 'package:erobot_mobile/app/modules/home/bindings/home_binding.dart';
import 'package:erobot_mobile/app/modules/home/views/home_view.dart';
import 'package:erobot_mobile/app/modules/ir_remoter/bindings/ir_remoter_binding.dart';
import 'package:erobot_mobile/app/modules/ir_remoter/views/ir_remoter_view.dart';
import 'package:erobot_mobile/app/modules/login/bindings/login_binding.dart';
import 'package:erobot_mobile/app/modules/login/views/login_view.dart';
import 'package:erobot_mobile/app/modules/member/bindings/member_binding.dart';
import 'package:erobot_mobile/app/modules/member/views/member_view.dart';
import 'package:erobot_mobile/app/modules/post_detail/bindings/post_detail_binding.dart';
import 'package:erobot_mobile/app/modules/post_detail/views/post_detail_view.dart';
import 'package:erobot_mobile/app/modules/profile_detail/bindings/profile_detail_binding.dart';
import 'package:erobot_mobile/app/modules/profile_detail/views/profile_detail_view.dart';
import 'package:erobot_mobile/app/modules/profile_wrapper/bindings/profile_wrapper_binding.dart';
import 'package:erobot_mobile/app/modules/profile_wrapper/views/profile_wrapper_view.dart';
import 'package:erobot_mobile/app/modules/register/bindings/register_binding.dart';
import 'package:erobot_mobile/app/modules/register/views/register_view.dart';
import 'package:erobot_mobile/app/modules/reputation/bindings/reputation_binding.dart';
import 'package:erobot_mobile/app/modules/reputation/views/reputation_view.dart';
import 'package:erobot_mobile/app/modules/search/bindings/search_binding.dart';
import 'package:erobot_mobile/app/modules/search/views/search_view.dart';
import 'package:erobot_mobile/app/modules/search_result/bindings/search_result_binding.dart';
import 'package:erobot_mobile/app/modules/search_result/views/search_result_view.dart';
import 'package:erobot_mobile/app/modules/sender/bindings/sender_binding.dart';
import 'package:erobot_mobile/app/modules/sender/views/sender_view.dart';
import 'package:erobot_mobile/app/modules/wrapper/bindings/wrapper_binding.dart';
import 'package:erobot_mobile/app/modules/wrapper/views/wrapper_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.WRAPPER;

  static final routes = [
    GetPage(
      name: _Paths.WRAPPER,
      page: () => WrapperView(),
      binding: WrapperBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.EDUCATION,
      page: () => EducationView(),
      binding: EducationBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE_WRAPPER,
      page: () => ProfileWrapperView(),
      binding: ProfileWrapperBinding(),
    ),
    GetPage(
      name: _Paths.REPUTATION,
      page: () => ReputationView(),
      binding: ReputationBinding(),
    ),
    GetPage(
      name: _Paths.MEMBER,
      page: () => MemberView(),
      binding: MemberBinding(),
    ),
    GetPage(
      name: _Paths.POST_DETAIL,
      page: () => PostDetailView(),
      binding: PostDetailBinding(),
    ),
    GetPage(
      name: _Paths.SENDER,
      page: () => SenderView(),
      binding: SenderBinding(),
    ),
    GetPage(
      name: _Paths.IR_REMOTER,
      page: () => IrRemoterView(),
      binding: IrRemoterBinding(),
    ),
    GetPage(
      name: _Paths.BALL_SHOOTER,
      page: () => BallShooterView(),
      binding: BallShooterBinding(),
    ),
    GetPage(
      name: _Paths.SEARCH,
      page: () => SearchView(),
      binding: SearchBinding(),
    ),
    GetPage(
      name: _Paths.SEARCH_RESULT,
      page: () => SearchResultView(),
      binding: SearchResultBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE_DETAIL,
      page: () => ProfileDetailView(),
      binding: ProfileDetailBinding(),
    ),
  ];
}
