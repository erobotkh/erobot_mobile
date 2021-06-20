import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LocalStorage extends GetxController {
  TextEditingController messagecontroller = TextEditingController();
  final box = GetStorage();

  List lstmessage = [];

  @override
  void onInit() {
    super.onInit();
    onFetch();
  }

  onSave() {
    List lstMs = [];
    lstMs.addAll(lstmessage);
    Map<String, dynamic> value = {
      'messagecontroller': messagecontroller.text,
    };
    box.write('developer', lstMs);
    lstMs.add(value);
    onFetch();
  }

  onFetch() {
    lstmessage = box.read('developer');
    print(lstmessage);
    update();
  }

  onRemove(int index) {
    lstmessage.removeAt(index);
    box.remove('developer');
    box.write('developer', lstmessage);
    onFetch();
  }

  onUpdate() {
    box.listen(() {});
  }
}
