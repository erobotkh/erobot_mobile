import 'package:flutter/material.dart';

class BluetoothDeviceModel {
  String deviceName;
  String connected;
  String notConnected;
  IconData? iconLeadingCon;
  IconData? iconLeadingNotCon;
  IconData? iconTrailing;
  BluetoothDeviceModel({
    this.deviceName = '',
    this.connected = '',
    this.notConnected = '',
    this.iconLeadingCon,
    this.iconLeadingNotCon,
    this.iconTrailing,
  });

  static getCates() => [
        BluetoothDeviceModel(
          deviceName: 'Beats',
          connected: 'connected',
          notConnected: 'Not conneccted',
          iconLeadingCon: Icons.bluetooth_connected,
          iconTrailing: Icons.tune_rounded,
          iconLeadingNotCon: Icons.bluetooth,
        ),
        BluetoothDeviceModel(
          deviceName: 'Beats',
          connected: 'connected',
          notConnected: 'Not conneccted',
          iconLeadingCon: Icons.bluetooth_connected,
          iconTrailing: Icons.chevron_right,
        ),
        BluetoothDeviceModel(
          deviceName: 'Beats',
          connected: 'connected',
          notConnected: 'Not conneccted',
          iconLeadingCon: Icons.bluetooth_connected,
          iconTrailing: Icons.chevron_right,
        ),
        BluetoothDeviceModel(
          deviceName: 'Beats',
          connected: 'connected',
          notConnected: 'Not conneccted',
          iconLeadingCon: Icons.bluetooth_connected,
          iconTrailing: Icons.chevron_right,
        ),
        BluetoothDeviceModel(
          deviceName: 'Beats',
          connected: 'connected',
          notConnected: 'Not conneccted',
          iconLeadingCon: Icons.bluetooth_connected,
          iconTrailing: Icons.chevron_right,
        ),
      ];
}
