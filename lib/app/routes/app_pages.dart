// import 'package:erobot_mobile/app/modules/emergency/bindings/emc_binding.dart';
// import 'package:erobot_mobile/app/modules/emergency/views/emc_view.dart';

import 'package:erobot_mobile/app/modules/emergency/bindings/emc_home_binding.dart';
import 'package:erobot_mobile/app/modules/emergency/views/emc_home_view.dart';

import 'package:get/get.dart';

import '../modules/bluetooth_list/bindings/bluetooth_list_binding.dart';
import '../modules/bluetooth_list/views/bluetooth_list_view.dart';
import '../modules/comment/bindings/comment_binding.dart';
import '../modules/comment/views/comment_view.dart';
import '../modules/education/bindings/education_binding.dart';
import '../modules/education/views/education_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/iot_connection_setting/bindings/iot_connection_setting_binding.dart';
import '../modules/iot_connection_setting/views/iot_connection_setting_view.dart';
import '../modules/ir_remoter/bindings/ir_remoter_binding.dart';
import '../modules/ir_remoter/views/ir_remoter_view.dart';
import '../modules/joystick/bindings/joystick_binding.dart';
import '../modules/joystick/views/joystick_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/member/bindings/member_binding.dart';
import '../modules/member/views/member_view.dart';
import '../modules/post_detail/bindings/post_detail_binding.dart';
import '../modules/post_detail/views/post_detail_view.dart';
import '../modules/profile_detail/bindings/profile_detail_binding.dart';
import '../modules/profile_detail/views/profile_detail_view.dart';
import '../modules/profile_wrapper/bindings/profile_wrapper_binding.dart';
import '../modules/profile_wrapper/views/profile_wrapper_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';
import '../modules/reputation/bindings/reputation_binding.dart';
import '../modules/reputation/views/reputation_view.dart';
import '../modules/robot_remote_setting/bindings/robot_remote_setting_binding.dart';
import '../modules/robot_remote_setting/views/robot_remote_setting_view.dart';
import '../modules/search/bindings/search_binding.dart';
import '../modules/search/views/search_view.dart';
import '../modules/search_result/bindings/search_result_binding.dart';
import '../modules/search_result/views/search_result_view.dart';
import '../modules/sender/bindings/sender_binding.dart';
import '../modules/sender/views/sender_view.dart';
import '../modules/setting_ir_remoter/bindings/setting_ir_remoter_binding.dart';
import '../modules/setting_ir_remoter/views/setting_ir_remoter_view.dart';
import '../modules/thumbstick/bindings/thumbstick_binding.dart';
import '../modules/thumbstick/views/thumbstick_view.dart';
import '../modules/wrapper/bindings/wrapper_binding.dart';
import '../modules/wrapper/views/wrapper_view.dart';

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
    // GetPage(name: _Paths.EMERGENCY, page: () => EmcView(), binding: EmcBinding()),
    GetPage(name: _Paths.EMERGENCY, page: () => EmcHomeView(), binding: EmcHomeBinding()),

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
    GetPage(
      name: _Paths.BLUETOOTH_LIST,
      page: () => BluetoothListView(),
      binding: BluetoothListBinding(),
    ),
    GetPage(
      name: _Paths.IOT_CONNECTION_SETTING,
      page: () => IotConnectionSettingView(),
      binding: IotConnectionSettingBinding(),
    ),
    GetPage(
      name: _Paths.JOYSTICK,
      page: () => JoystickView(),
      binding: JoystickBinding(),
    ),
    GetPage(
      name: _Paths.THUMBSTICK,
      page: () => ThumbstickView(),
      binding: ThumbstickBinding(),
    ),
    GetPage(
      name: _Paths.COMMENT,
      page: () => CommentView(),
      binding: CommentBinding(),
    ),
    GetPage(
      name: _Paths.SETTING_IR_REMOTER,
      page: () => SettingIrRemoterView(),
      binding: SettingIrRemoterBinding(),
    ),
    GetPage(
      name: _Paths.ROBOT_REMOTE_SETTING,
      page: () => RobotRemoteSettingView(),
      binding: RobotRemoteSettingBinding(),
    ),
  ];
}
