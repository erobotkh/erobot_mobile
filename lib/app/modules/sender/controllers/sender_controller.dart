import 'package:erobot_mobile/mixins/toast.dart';
import 'package:erobot_mobile/services/storages/recent_sender_data_storage.dart';
import 'package:flutter_swipe_action_cell/core/controller.dart';
import 'package:get/get.dart';

class SenderController extends GetxController with Toast {
  SwipeActionController swipeActionController = SwipeActionController();
  RxList<SentMessageModel> sentMessages = <SentMessageModel>[].obs;

  // this variable is used to stop sending in progress with cancel button
  bool stopSendingMessage = true;

  RxSet<String> recentDatas = <String>{}.obs;

  RxList<SenderMessageModel> messages = <SenderMessageModel>[
    SenderMessageModel(message: '', second: 15),
  ].obs;

  @override
  void onInit() {
    super.onInit();
    RecentSenderDataStorage.instance.readList().then((value) {
      recentDatas.addAll(value?.toSet() ?? {});
    });
  }

  void addMessage(SenderMessageModel message) {
    messages.add(message);
  }

  void removeMessage(int index) {
    if (messages.length <= 1) return;
    messages.removeAt(index);
    swipeActionController.closeAllOpenCell();
  }

  Future<void> removeARecent(String value) async {
    recentDatas.remove(value);
    return RecentSenderDataStorage.instance.writeList(recentDatas.toList());
  }

  Future<void> addToRecent(String value) async {
    recentDatas.add(value);
    await RecentSenderDataStorage.instance.writeList(recentDatas.toList());
  }

  void putValueToMessage(String value) {
    bool changed = false;
    for (int i = 0; i < messages.length; i++) {
      SenderMessageModel e = messages[i];
      if (e.message.trim().isEmpty) {
        messages[i] = messages[i].copyWith(message: value);
        changed = true;
        break;
      }
    }

    if (!changed) {
      addMessage(
        SenderMessageModel(
          message: value,
          second: 5,
        ),
      );
    }
  }

  bool get sending => sentMessages.isNotEmpty;

  // check if some value is empty
  bool shouldSend() {
    if (sending) return false;

    for (int i = 0; i < messages.length; i++) {
      SenderMessageModel message = messages[i];
      if (message.message.trim().isEmpty) {
        showSnackbar(
          title: 'Error!',
          message: 'Value at index $i is empty.',
        );
        return false;
      }
    }

    return true;
  }
}

class SenderMessageModel {
  final String message;
  final int second;

  SenderMessageModel({
    required this.message,
    required this.second,
  });

  SenderMessageModel copyWith({
    String? message,
    int? second,
  }) {
    return SenderMessageModel(
      message: message ?? this.message,
      second: second ?? this.second,
    );
  }
}

class SentMessageModel {
  final int index;
  final DateTime startFrom;

  SentMessageModel({
    required this.index,
    required this.startFrom,
  });
}
