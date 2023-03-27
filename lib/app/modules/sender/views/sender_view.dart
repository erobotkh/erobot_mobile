import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:erobot_mobile/app/modules/iot_connection_setting/controllers/iot_controller.dart';
import 'package:erobot_mobile/app/routes/app_pages.dart';
import 'package:erobot_mobile/constants/config_constant.dart';
import 'package:erobot_mobile/constants/theme_constant.dart';
import 'package:erobot_mobile/mixins/toast.dart';
import 'package:erobot_mobile/services/iot/base_iot_service.dart';
import 'package:erobot_mobile/widgets/er_tap_effect.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/index.dart';
import 'package:flutter_swipe_action_cell/flutter_swipe_action_cell.dart';
import 'package:get/get.dart';
import '../controllers/sender_controller.dart';

class SenderView extends GetView<SenderController> with Toast {
  IotController get iot => Get.find<IotController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: ListView(
        padding: ConfigConstant.layoutPadding,
        children: [
          buildSenderField(context),
          Obx(() {
            return TextButton(
              child: Text(controller.sending ? "Cancel" : "Send"),
              onPressed: () => !controller.sending ? onSend() : cancelSend(),
            );
          }),
          const SizedBox(height: ConfigConstant.margin2 * 2),
          buildSectionLabel(context),
          const SizedBox(height: ConfigConstant.margin1),
          buildRecentDatas(context)
        ],
      ),
    );
  }

  Future<void> onSend() async {
    if (!controller.shouldSend()) return;
    controller.stopSendingMessage = false;

    controller.sentMessages.clear();
    for (int i = 0; i < controller.messages.length; i++) {
      if (controller.stopSendingMessage) break;
      await sendAMessage(i);
    }

    closeSnackbar();
    controller.stopSendingMessage = true;
    controller.sentMessages.clear();
  }

  void cancelSend() {
    controller.stopSendingMessage = true;
    controller.sentMessages.clear();
    closeSnackbar();
  }

  Future<void> sendAMessage(int index) async {
    SenderMessageModel e = controller.messages[index];
    await iot.write(e.message).then((e) {
      showSnackbar(
        title: e.message ?? "",
        message: e.message ?? "",
        showProgressIndicator: true,
      );
    });

    controller.sentMessages.add(SentMessageModel(
      index: index,
      startFrom: DateTime.now(),
    ));

    await Future.delayed(Duration(seconds: e.second));
    controller.addToRecent(e.message);
    closeSnackbar();
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: ErTapEffect(
        child: Text('SenderView'),
        onTap: () {
          showOkAlertDialog(
            context: context,
            title: iot.service?.connectedDevice?.name,
            message: iot.service?.connectedDevice?.address.toString(),
          );
        },
      ),
      centerTitle: true,
      actions: [
        IconButton(
          icon: Icon(Icons.settings),
          onPressed: () async {
            Get.toNamed(Routes.IOT_CONNECTION_SETTING)?.then((value) async {
              if (value is BaseIotService) {
                iot.setService(value);
              }
            });
          },
        ),
      ],
    );
  }

  Widget buildRecentDatas(BuildContext context) {
    return Obx(() {
      var recentDatas = controller.recentDatas.toList();
      return Wrap(
        spacing: ConfigConstant.margin0,
        runSpacing: ConfigConstant.margin1,
        children: List.generate(
          recentDatas.length,
          (index) {
            String value = recentDatas[index];
            return ErTapEffect(
              onTap: () {
                controller.putValueToMessage(value);
              },
              child: Chip(
                backgroundColor: ThemeConstant.gradients[index % ThemeConstant.gradients.length].colors.first,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                label: Text(
                  value,
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),
                padding: EdgeInsets.zero,
                labelPadding: const EdgeInsets.only(left: ConfigConstant.margin2),
                deleteIcon: Icon(
                  Icons.cancel,
                  size: ConfigConstant.iconSize1,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
                onDeleted: () {
                  controller.removeARecent(value);
                },
              ),
            );
          },
        ),
      );
    });
  }

  Widget buildSectionLabel(BuildContext context) {
    return Obx(() {
      return Text(
        controller.recentDatas.toList().isNotEmpty ? "Recent data" : "No recent data",
        style: Theme.of(context).textTheme.bodyLarge,
      );
    });
  }

  Widget buildSenderField(BuildContext context) {
    return Obx(() {
      return Column(
        children: List.generate(
          controller.messages.length,
          (index) {
            return SwipeActionCell(
              key: ValueKey(index),
              index: index,
              controller: controller.swipeActionController,
              isDraggable: controller.messages.length > 1,
              trailingActions: <SwipeAction>[
                SwipeAction(
                  performsFirstActionWithFullSwipe: false,
                  closeOnTap: true,
                  title: "Delete",
                  onTap: (CompletionHandler handler) async {
                    controller.removeMessage(index);
                  },
                  color: Theme.of(context).colorScheme.error,
                ),
              ],
              child: buildMessageField(
                message: controller.messages[index],
                context: context,
                addable: index == controller.messages.length - 1,
                index: index,
              ),
            );
          },
        ),
      );
    });
  }

  Widget buildMessageField({
    required SenderMessageModel message,
    required BuildContext context,
    required bool addable,
    required int index,
  }) {
    return Row(
      children: [
        Expanded(
          child: ErTapEffect(
            onTap: () async {
              List<String>? result = await showTextInputDialog(
                context: context,
                textFields: [
                  DialogTextField(
                    hintText: 'Message',
                    keyboardType: TextInputType.text,
                    initialText: message.message,
                  ),
                  DialogTextField(
                    hintText: 'How long in second?',
                    keyboardType: TextInputType.number,
                    initialText: message.second.toString(),
                  ),
                ],
              );

              if (result?.length == 2 && result?[0] != null && result?[1] != null) {
                controller.messages[index] = controller.messages[index].copyWith(
                  message: result?[0],
                  second: int.tryParse(result?[1] ?? "5") ?? 5,
                );
              }
            },
            child: ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 0),
              title: Text(message.message.trim().isEmpty ? "Empty message" : "" + message.message),
              subtitle: buildSecondCounter(index, message),
            ),
          ),
        ),
        if (addable)
          IconButton(
            icon: Icon(
              Icons.add,
              color: Theme.of(context).colorScheme.error,
            ),
            onPressed: () {
              controller.addMessage(
                SenderMessageModel(
                  message: '',
                  second: 5,
                ),
              );
            },
          ),
      ],
    );
  }

  Widget buildSecondCounter(int index, SenderMessageModel message) {
    Widget endWidget = Text("For ${message.second}s");
    if (controller.sentMessages.isNotEmpty) {
      if (controller.sentMessages.last.index == index) {
        return CountdownTimer(
          endTime: controller.sentMessages.last.startFrom.millisecondsSinceEpoch + message.second * 1000,
          widgetBuilder: (context, countdown) {
            return Text("Sent for ${countdown?.sec ?? 0}s");
          },
          endWidget: endWidget,
        );
      }
    }
    return endWidget;
  }
}
