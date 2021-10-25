class BluetoothDeviceModel {
  String deviceName;

  BluetoothDeviceModel({
    this.deviceName = '',
  });

  static getCates() => [
        BluetoothDeviceModel(
          deviceName: 'Beats',
        ),
        BluetoothDeviceModel(
          deviceName: 'Beats',
        ),
        BluetoothDeviceModel(
          deviceName: 'Beats',
        ),
      ];
}
