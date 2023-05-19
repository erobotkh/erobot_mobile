import 'dart:async';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class BluetoothListController extends GetxController {
  StreamSubscription<BluetoothDiscoveryResult>? _streamSubscription;
  List<BluetoothDiscoveryResult> results = List<BluetoothDiscoveryResult>.empty(growable: true).obs;
  RxBool isDiscovering = true.obs;

  var isBluetoothOn = false.obs;

  @override
  void onInit() {
    super.onInit();
    checkPermissions();
    FlutterBluetoothSerial.instance.onStateChanged().listen((state) {
      isBluetoothOn.value = state.isEnabled;
    });
    _startDiscovery();
  }

  void restartDiscovery() {
    results.clear();
    isDiscovering.value = true;
    _startDiscovery();
  }

  Future<void> checkPermissions() async {
    var permissionStatus = await Permission.bluetoothConnect.status;
    print(permissionStatus);
    if (permissionStatus.isDenied) {
      await Permission.bluetoothConnect.request();
    }

    permissionStatus = await Permission.location.status;
    if (permissionStatus.isDenied) {
      await Permission.location.request();
    }
  }

  Future<void> _startDiscovery() async {
    _streamSubscription = FlutterBluetoothSerial.instance.startDiscovery().listen((r) {
      final existingIndex = results.indexWhere((element) => element.device.address == r.device.address);
      if (existingIndex >= 0) {
        results[existingIndex] = r;
      } else {
        results.add(r);
      }
    });

    FlutterBluetoothSerial.instance.getBondedDevices().then((value) {
      print("Value" + value.toString());
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
