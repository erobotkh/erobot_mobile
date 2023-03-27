import 'package:erobot_mobile/app/routes/app_pages.dart';
import 'package:erobot_mobile/widgets/er_search_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/search_controller.dart';

class SearchView extends GetView<SearchController> {
  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        automaticallyImplyLeading: true,
        titleSpacing: -8,
        title: ErSearchField(
          controller: controller.textController,
          onChange: (value) {
            controller.updateResultIcon();
          },
          onClear: () {
            controller.textController.clear();
            controller.updateResultIcon();
          },
        ),
      ),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              Get.toNamed(Routes.POST_DETAIL);
            },
            leading: Obx(
              () => Icon(
                controller.isHistory.value ? Icons.history : Icons.search,
                color: colorScheme.secondaryContainer,
              ),
            ),
            title: Text('PNC event ${controller.count}'),
            trailing: Icon(
              Icons.keyboard_arrow_right,
              color: colorScheme.secondaryContainer,
            ),
          );
        },
      ),
    );
  }
}
