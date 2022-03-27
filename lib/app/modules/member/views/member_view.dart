import 'package:erobot_mobile/constants/config_constant.dart';
import 'package:erobot_mobile/models/list_member/member_model.dart';
import 'package:erobot_mobile/widgets/widgets.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/member_controller.dart';

class MemberView extends GetView<MemberController> {
  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    Get.put(MemberController());
    return Scaffold(
      backgroundColor: _theme.colorScheme.background,
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: _theme.colorScheme.surface,
        title: Text(
          'Members',
          style: _theme.textTheme.headline6,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
          ),
        ],
      ),
      body: Obx(() {
        List<MemberModel> listMember = controller.memberListModel?.value.items ?? [];

        return ListView(
          padding: EdgeInsets.only(
            top: ConfigConstant.margin1,
          ),
          children: List.generate(listMember.length, (index) {
            MemberModel member = listMember[index];
            return ERExpansionTile(
              title: (member.firstName ?? ' ') + ' ' + (member.lastName ?? ''),
              subtitle: (member.role ?? '') + ' of ' + (member.team?.id ?? 'Team'),
              img: member.profileUrl ?? '',
              onTap: () {},
              textNamefb: 'Morn Mey',
              textNameTg: 'Morn Mey',
              textNameIg: 'Morn Mey',
              textBody: '',
              // linkIg: member.socials?.firstWhere((element) => element.provider == 'instagram').href,
              // linkTele: member.socials?.firstWhere((element) => element.provider == 'telegram').href,
              // linkFb: member.socials?.firstWhere((element) => element.provider == 'facebook').href,
            );
          }),
        );
      }),
    );
  }
}
