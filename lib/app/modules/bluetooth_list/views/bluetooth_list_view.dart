import 'package:erobot_mobile/app/modules/bluetooth_list/controllers/bluetooth_list_controller.dart';
import 'package:erobot_mobile/app/modules/bluetooth_list/local_widgets/bluetooth_device_list_entry.dart';
import 'package:erobot_mobile/constants/config_constant.dart';
import 'package:erobot_mobile/services/iot/bluetooth_iot_service.dart';
import 'package:erobot_mobile/widgets/er_back_button.dart';
import 'package:erobot_mobile/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:get/get.dart';

class BluetoothListView extends GetView<BluetoothListController> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
    ]);

    return Scaffold(
      appBar: AppBar(
        leading: ErBackButton(),
        title: Text("Bluetooth List"),
        actions: [buildActionButton()],
      ),
      body: ListView(
        padding: EdgeInsets.all(ConfigConstant.margin2),
        children: [
          Container(
            width: 100,
            height: 100,
            margin: EdgeInsets.symmetric(vertical: ConfigConstant.margin2),
            alignment: Alignment.center,
            child: Image.asset('assets/images/bluetooth.png'),
          ),
          Text('Searching for devices ...'),
          SizedBox(height: ConfigConstant.objectHeight1),
          ListView.builder(
            shrinkWrap: true,
            itemCount: controller.results.length,
            itemBuilder: (BuildContext context, index) {
              BluetoothDiscoveryResult result = controller.results[index];
              BluetoothDevice device = result.device;
              return BluetoothDeviceListEntry(
                device: device,
                rssi: result.rssi,
                onTap: () async {
                  BluetoothConnection connection = await BluetoothConnection.toAddress(result.device.address);
                  BluetoothIosService service = BluetoothIosService();
                  service.connection = connection;
                  Get.back(result: service);
                },
                onLongPress: () async {
                  controller.toggleBonded(
                    result,
                    onError: (ex) => onError(context, ex),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }

  void onError(BuildContext context, Object ex) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Error occured while bonding'),
          content: Text(ex.toString()),
          actions: <Widget>[
            TextButton(
              child: Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Widget buildActionButton() {
    return Obx(() {
      if (controller.isDiscovering.value) {
        return FittedBox(
          child: Container(
            margin: EdgeInsets.all(16.0),
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            ),
          ),
        );
      } else {
        return ErTapEffect(
          child: Padding(
            padding: const EdgeInsets.only(right: ConfigConstant.margin2),
            child: Icon(Icons.replay),
          ),
          onTap: controller.restartDiscovery,
        );
      }
    });
  }
}
