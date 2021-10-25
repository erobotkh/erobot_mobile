import 'package:avatar_glow/avatar_glow.dart';
import 'package:erobot/config/config_constant.dart';
import 'package:erobot/constant/theme_constant.dart';
import 'package:erobot/models/bluetooth_device_model.dart';
import 'package:erobot/screens/home/bluetooth_screen/bluetooth_detail_screen.dart';
import 'package:erobot/screens/home/bluetooth_screen/local_widgets/er_alert_dailog.dart';
import 'package:erobot/screens/home/bluetooth_screen/local_widgets/er_listtile_widets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class BluetoothScreen extends StatefulWidget {
  const BluetoothScreen({Key? key}) : super(key: key);

  @override
  _BluetoothScreenState createState() => _BluetoothScreenState();
}

class _BluetoothScreenState extends State<BluetoothScreen> {
  List<BluetoothDeviceModel> _cardBluetoothDevice = BluetoothDeviceModel.getCates();

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
      body: Stack(
        children: [
          _buildSearchingDevice(context),
          _buildTopupDetailDevice(context),
        ],
      ),
    );
  }

  _buildSearchingDevice(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 20),
            child: AvatarGlow(
              repeat: true,
              showTwoGlows: true,
              animate: true,
              endRadius: 70.0,
              curve: Curves.fastOutSlowIn,
              glowColor: ThemeConstant.lightScheme.primary,
              child: Material(
                clipBehavior: Clip.antiAlias,
                color: Colors.transparent,
                elevation: 0.0,
                shape: CircleBorder(),
                child: CircleAvatar(
                  backgroundColor: ThemeConstant.lightScheme.primary,
                  child: Icon(
                    Icons.bluetooth,
                    color: ThemeConstant.lightScheme.onPrimary,
                  ),
                  radius: 30.0,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            alignment: Alignment.center,
            child: Text(
              'Searching for devices...',
              style: ThemeConstant.textTheme.caption,
            ),
          ),
        ],
      ),
    );
  }

  _buildTopupDetailDevice(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SlidingUpPanel(
      maxHeight: size.height * 0.59,
      minHeight: size.height * 0.59,
      color: ThemeConstant.lightScheme.surface,
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(ConfigConstant.iconSize2),
        topLeft: Radius.circular(ConfigConstant.iconSize2),
      ),
      panel: ListView(
        children: [
          Container(
            padding: EdgeInsets.only(left: 15, top: 10),
            child: Column(
              children: [
                Container(
                  height: 35,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'MY DEVICES',
                      style: ThemeConstant.textTheme.caption
                          ?.copyWith(color: ThemeConstant.lightScheme.onSurface),
                    ),
                  ),
                ),
                Divider(
                  color: ThemeConstant.lightScheme.secondary,
                ),
                _buildMyDevive(context),
                Container(
                  height: 35,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'OTHER DEVICES',
                      style: ThemeConstant.textTheme.caption
                          ?.copyWith(color: ThemeConstant.lightScheme.onSurface),
                    ),
                  ),
                ),
                Divider(
                  color: ThemeConstant.lightScheme.secondary,
                ),
                _buildOtherDevice(context),
                SizedBox(
                  height: size.height * 0.2,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _buildMyDevive(BuildContext context) {
    return Container(
      child: Column(
        children: List.generate(
          BluetoothDeviceModel.getCates().length,
          (index) => Column(
            children: [
              Container(
                height: 35,
                child: ErListTileWidgets(
                  onTap: () {},
                  onTapTrailing: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => BluetoothDetailScreen(),
                      ),
                    );
                  },
                  deviceName: _cardBluetoothDevice[index].deviceName,
                ),
              ),
              Divider(
                color: ThemeConstant.lightScheme.secondary,
              ),
            ],
          ),
        ),
      ),
    );
  }

  _buildOtherDevice(BuildContext context) {
    return Container(
      child: Column(
        children: List.generate(
          1,
          (index) => Column(
            children: [
              Container(
                height: 35,
                child: ErListTileWidgets(
                  onTap: () {
                    setState(() {
                      _buildshowAlertDailog(context);
                    });
                  },
                  onTapTrailing: () {},
                  deviceName: _cardBluetoothDevice[index].deviceName,
                ),
              ),
              Divider(
                color: ThemeConstant.lightScheme.secondary,
              ),
            ],
          ),
        ),
      ),
    );
  }

  _buildshowAlertDailog(context) {
    return showDialog(
      context: context,
      builder: (context) {
        return ErAlertDailog(
          back: 'CANCEL',
          content: Text(
            'Press the button on the machine once to Pair it with the application.',
            textAlign: TextAlign.center,
            style: ThemeConstant.textTheme.bodyText1?.copyWith(
              color: ThemeConstant.lightScheme.secondary,
            ),
          ),
          title: 'Pair the Machince',
          continuee: 'PAIR',
          onPressedContinue: () {},
          onPressedBack: () {
            Navigator.of(context).pop();
          },
        );
      },
    );
  }
}
