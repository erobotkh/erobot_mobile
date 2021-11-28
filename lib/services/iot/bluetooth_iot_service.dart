import 'dart:convert';
import 'dart:typed_data';

import 'package:erobot_mobile/services/iot/base_iot_service.dart';
import 'package:erobot_mobile/services/iot/model/iot_device_model.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

class BluetoothIosService extends BaseIotService {
  BluetoothDevice? device;

  BluetoothConnection? _connection;
  BluetoothConnection? get connection => _connection;
  set connection(BluetoothConnection? value) {
    _connection = value;
    _checkConnected();
    _startListen();
  }

  void _checkConnected() {
    FlutterBluetoothSerial.instance.getBondedDevices().then((value) {
      for (BluetoothDevice e in value) {
        if (e.isConnected) device = e;
      }
    });
  }

  @override
  read() {}

  _startListen() {
    connection?.input?.listen((data) {
      String dataStr = ascii.decode(data);
      print("DATA STR $dataStr");
    });
  }

  @override
  Future<void> write(String message) async {
    connection?.output.add(utf8.encode(message) as Uint8List);
    await connection?.output.allSent;
  }

  @override
  IotDeviceModel? get connectedDevice =>
      device != null ? IotDeviceModel(name: device?.name, address: device?.address) : null;
}
