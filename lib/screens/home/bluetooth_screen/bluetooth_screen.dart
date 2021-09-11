import 'package:erobot/config/config_constant.dart';
import 'package:erobot/constant/theme_constant.dart';
import 'package:erobot/models/bluetooth_model.dart';
import 'package:erobot/screens/home/ball_shooter/local_widgets/circular_slider.dart';
import 'package:erobot/screens/home/bluetooth_screen/bluetooth_detail_screen.dart';
import 'package:erobot/screens/home/bluetooth_screen/local_widgets/er_bluetoothdevice.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BluetoothScreen extends StatefulWidget {
  const BluetoothScreen({Key? key}) : super(key: key);

  @override
  _BluetoothScreenState createState() => _BluetoothScreenState();
}

class _BluetoothScreenState extends State<BluetoothScreen> {
  List<BluetoothDeviceModel> _cardBluetoothDevice =
      BluetoothDeviceModel.getCates();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Bluetooth',
          style: ThemeConstant.textTheme.headline6
              ?.copyWith(color: ThemeConstant.lightScheme.onSurface),
        ),
      ),
      body: ListView.builder(
        itemCount: _cardBluetoothDevice.length,
        itemBuilder: (context, index) {
          var cardBluetoothDevice = _cardBluetoothDevice[index];
          return Container(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(top: 20),
                  alignment: Alignment.center,
                  child: Image.asset(
                    'assets/images/bluetooth.png',
                    width: 120,
                    height: 120,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    'Searching for devices...',
                    style: ThemeConstant.textTheme.caption,
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Container(
                  padding: EdgeInsets.only(top: 10, left: 15),
                  decoration: BoxDecoration(
                    color: ThemeConstant.lightScheme.surface,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(ConfigConstant.iconSize2),
                      topLeft: Radius.circular(ConfigConstant.iconSize2),
                    ),
                  ),
                  child: Column(
                    children: [
                      Container(
                        height: 35,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'MY DEVICES',
                            style: ThemeConstant.textTheme.caption?.copyWith(
                                color: ThemeConstant.lightScheme.onSurface),
                          ),
                        ),
                      ),
                      Divider(
                        color: ThemeConstant.lightScheme.secondary,
                      ),
                      Container(
                        height: 35,
                        child: BluetoothDevices(
                          onTap: () {},
                          onTapTrailing: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => BluetoothDetailScreen()));
                          },
                          deviceName: cardBluetoothDevice.deviceName,
                          connected: cardBluetoothDevice.connected,
                          notConnected: cardBluetoothDevice.notConnected,
                          iconLeadingCon: cardBluetoothDevice.iconLeadingCon,
                          iconTrailing: cardBluetoothDevice.iconTrailing,
                          iconLeadingNotCon:
                              cardBluetoothDevice.iconLeadingNotCon,
                        ),
                      ),
                      Divider(
                        color: ThemeConstant.lightScheme.secondary,
                      ),
                      Container(
                        height: 35,
                        child: BluetoothDevices(
                          onTap: () {},
                          onTapTrailing: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => BluetoothDetailScreen()));
                          },
                          deviceName: cardBluetoothDevice.deviceName,
                          connected: cardBluetoothDevice.connected,
                          notConnected: cardBluetoothDevice.notConnected,
                          iconLeadingCon: cardBluetoothDevice.iconLeadingCon,
                          iconLeadingNotCon:
                              cardBluetoothDevice.iconLeadingNotCon,
                          iconTrailing: cardBluetoothDevice.iconTrailing,
                        ),
                      ),
                      Divider(
                        color: ThemeConstant.lightScheme.secondary,
                      ),
                      Container(
                        height: 35,
                        child: BluetoothDevices(
                          onTap: () {},
                          onTapTrailing: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => BluetoothDetailScreen()));
                          },
                          deviceName: cardBluetoothDevice.deviceName,
                          connected: cardBluetoothDevice.connected,
                          notConnected: cardBluetoothDevice.notConnected,
                          iconLeadingCon: cardBluetoothDevice.iconLeadingCon,
                          iconLeadingNotCon:
                              cardBluetoothDevice.iconLeadingNotCon,
                          iconTrailing: cardBluetoothDevice.iconTrailing,
                        ),
                      ),
                      Divider(
                        color: ThemeConstant.lightScheme.secondary,
                      ),
                      Container(
                        height: 35,
                        child: BluetoothDevices(
                          onTap: () {},
                          onTapTrailing: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => BluetoothDetailScreen()));
                          },
                          deviceName: cardBluetoothDevice.deviceName,
                          connected: cardBluetoothDevice.connected,
                          notConnected: cardBluetoothDevice.notConnected,
                          iconLeadingCon: cardBluetoothDevice.iconLeadingCon,
                          iconLeadingNotCon:
                              cardBluetoothDevice.iconLeadingNotCon,
                          iconTrailing: cardBluetoothDevice.iconTrailing,
                        ),
                      ),
                      Divider(
                        color: ThemeConstant.lightScheme.secondary,
                      ),
                      Container(
                        height: 35,
                        child: BluetoothDevices(
                          onTap: () {},
                          onTapTrailing: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => BluetoothDetailScreen()));
                          },
                          deviceName: cardBluetoothDevice.deviceName,
                          connected: cardBluetoothDevice.connected,
                          notConnected: cardBluetoothDevice.notConnected,
                          iconLeadingCon: cardBluetoothDevice.iconLeadingCon,
                          iconLeadingNotCon:
                              cardBluetoothDevice.iconLeadingNotCon,
                          iconTrailing: cardBluetoothDevice.iconTrailing,
                        ),
                      ),
                      Divider(
                        color: ThemeConstant.lightScheme.secondary,
                      ),
                      Container(
                        height: 35,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'OTHER DEVICES',
                            style: ThemeConstant.textTheme.caption?.copyWith(
                                color: ThemeConstant.lightScheme.onSurface),
                          ),
                        ),
                      ),
                      Divider(
                        color: ThemeConstant.lightScheme.secondary,
                      ),
                      Container(
                        height: 35,
                        child: BluetoothDevices(
                          onTap: () {
                            setState(() {
                              _buildshowAlertDailog(context);
                            });
                          },
                          onTapTrailing: () {},
                          deviceName: cardBluetoothDevice.deviceName,
                          connected: '',
                          notConnected: '',
                          iconLeadingCon: null,
                          iconTrailing: null,
                          iconLeadingNotCon: null,
                        ),
                      ),
                      Divider(
                        color: ThemeConstant.lightScheme.secondary,
                      ),
                      SizedBox(
                        height: 100,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  _buildshowAlertDailog(context) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            'Pair the Machince',
            textAlign: TextAlign.center,
            style: ThemeConstant.textTheme.headline6?.copyWith(
              color: ThemeConstant.lightScheme.onSurface,
            ),
          ),
          content: Text(
            'Press the button on the machine once to Pair it with the application.',
            textAlign: TextAlign.center,
            style: ThemeConstant.textTheme.bodyText1?.copyWith(
              color: ThemeConstant.lightScheme.secondary,
            ),
          ),
          actions: [
            FlatButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'CANCEL',
                style: ThemeConstant.textTheme.button?.copyWith(
                  color: ThemeConstant.lightScheme.onSurface,
                ),
              ),
            ),
            FlatButton(
              onPressed: () {},
              child: Text(
                'PAIR',
                style: ThemeConstant.textTheme.button?.copyWith(
                  color: ThemeConstant.lightScheme.onSurface,
                ),
              ),
            ),
          ],
          elevation: 0.0,
          backgroundColor: ThemeConstant.lightScheme.surface,
        );
      },
    );
  }
}
