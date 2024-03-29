import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:erobot_mobile/models/user_model.dart';
import 'package:erobot_mobile/widgets/er_list_tile.dart';
import 'package:erobot_mobile/app/modules/profile_wrapper/controllers/profile_wrapper_controller.dart';
import 'package:erobot_mobile/constants/config_constant.dart';
import 'package:erobot_mobile/services/base_apis/auth_api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import '../controllers/profile_detail_controller.dart';

class ProfileDetailView extends GetView {
  @override
  Widget build(BuildContext context) {
    Get.put(ProfileDetailController());

    return GetBuilder<ProfileDetailController>(builder: (controller) {
      UserModel? user = controller.user?.value;
      String displayName = (user?.fullNameI ?? '').toUpperCase();
      String displayEmail = user?.email ?? '';
      String displayPhoneNumber = "012322345";
      return Scaffold(
        body: RefreshIndicator(
          onRefresh: () async {
            controller.getProfile();
            Logger().d(controller.user?.value.toJson());
          },
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                stretch: true,
                centerTitle: true,
                expandedHeight: 300,
                actions: [
                  IconButton(
                    onPressed: () async {
                      OkCancelResult result = await showOkCancelAlertDialog(
                        context: context,
                        title: "Log out",
                        message: "Are you sure to log out?",
                      );
                      if (result == OkCancelResult.ok) {
                        await AuthApi().logOut();
                        Get.find<ProfileWrapperController>().checkSignedInStatus();
                      }
                    },
                    icon: Icon(Icons.logout),
                  )
                ],
                flexibleSpace: FlexibleSpaceBar(
                  background: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: ConfigConstant.objectHeight1),
                      CircleAvatar(
                        backgroundImage: AssetImage(
                          "assets/images/image.png",
                        ),
                        maxRadius: 50,
                      ),
                      const SizedBox(height: ConfigConstant.margin2),
                      Text(
                        displayName,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      Text(
                        displayEmail,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onSurface,
                          fontSize: 14,
                          fontFamily: "OpenSans",
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    ErListTile(
                      title: "Name",
                      subtitle: displayName,
                      leadingIconData: Icons.person,
                      onTap: () {},
                    ),
                    ErListTile(
                      title: "Email",
                      subtitle: displayEmail,
                      leadingIconData: Icons.email,
                      onTap: () {},
                    ),
                    ErListTile(
                      title: "Phone Number",
                      subtitle: displayPhoneNumber,
                      leadingIconData: Icons.phone,
                      onTap: () {},
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
