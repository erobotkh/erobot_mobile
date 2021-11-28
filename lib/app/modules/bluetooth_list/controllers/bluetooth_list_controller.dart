import 'dart:async';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:get/get.dart';

class BluetoothListController extends GetxController {
  StreamSubscription<BluetoothDiscoveryResult>? _streamSubscription;
  List<BluetoothDiscoveryResult> results = List<BluetoothDiscoveryResult>.empty(growable: true).obs;
  RxBool isDiscovering = true.obs;

  @override
  void onInit() {
    super.onInit();
    _startDiscovery();
  }

  void restartDiscovery() {
    results.clear();
    isDiscovering.value = true;
    _startDiscovery();
  }

  void _startDiscovery() {
    _streamSubscription = FlutterBluetoothSerial.instance.startDiscovery().listen((r) {
      final existingIndex = results.indexWhere((element) => element.device.address == r.device.address);
      if (existingIndex >= 0) {
        results[existingIndex] = r;
      } else {
        results.add(r);
      }
    });

    FlutterBluetoothSerial.instance.getBondedDevices().then((value) {
      for (BluetoothDevice device in value) {
        final existingIndex = results.indexWhere((element) => element.device.address == device.address);
        final r = BluetoothDiscoveryResult(device: device, rssi: 0);
        if (existingIndex >= 0) {
          results[existingIndex] = r;
        } else {
          results.add(r);
        }
      }
    });

    _streamSubscription!.onDone(() {
      isDiscovering.value = false;
    });
  }

  Future<void> toggleBonded(
    BluetoothDiscoveryResult result, {
    required void Function(Object) onError,
  }) async {
    try {
      final device = result.device;
      final address = device.address;
      bool bonded = false;

      if (device.isBonded) {
        print('Unbonding from ${device.address}...');
        await FlutterBluetoothSerial.instance.removeDeviceBondWithAddress(address);
        print('Unbonding from ${device.address} has succed');
      } else {
        print('Bonding with ${device.address}...');
        bonded = await FlutterBluetoothSerial.instance.bondDeviceAtAddress(address) == true;
        print('Bonding with ${device.address} has ${bonded ? 'succed' : 'failed'}.');
      }

      results[results.indexOf(result)] = BluetoothDiscoveryResult(
        device: BluetoothDevice(
          name: device.name ?? '',
          address: address,
          type: device.type,
          bondState: bonded ? BluetoothBondState.bonded : BluetoothBondState.none,
        ),
        rssi: result.rssi,
      );
    } catch (e) {
      onError(e);
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    _streamSubscription?.cancel();
  }
}
