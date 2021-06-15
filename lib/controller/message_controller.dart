import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class StorageMessage extends GetxController {
  TextEditingController textcontroller = TextEditingController();
  final box = GetStorage();
  List lstSave = [];
  @override
  void onInit() {
    super.onInit();
    onFetchData();
    box.remove('developer');
  }

  onSaveData() {
    List lstmessage = [];
    lstmessage.addAll(lstSave);
    Map<String, dynamic> developer = {'text': textcontroller.text};
    lstmessage.add(developer);
    box.write('developer', lstmessage);
    onFetchData();
  }

  onFetchData() async {
    lstSave = await box.read('developer');
    print(lstSave);
    update();
  }
  onRemoveData(int index) async {
    lstSave.removeAt(index);
    box.remove('developer');
    box.write('developer', lstSave);
    onFetchData();
    update();
  }
}
