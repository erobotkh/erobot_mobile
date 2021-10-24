import 'package:erobot/constant/theme_constant.dart';
import 'package:flutter/material.dart';

class BluetoothDevices extends StatefulWidget {
  final String deviceName;
  final String connected;
  final String notConnected;
  final IconData? iconLeadingCon;
  final IconData? iconLeadingNotCon;
  final IconData? iconTrailing;
  final Function onTap;
  final Function onTapTrailing;
  const BluetoothDevices(
      {Key? key,
      required this.deviceName,
      required this.connected,
      required this.notConnected,
      required this.iconLeadingCon,
      required this.iconLeadingNotCon,
      required this.iconTrailing,
      required this.onTap,
      required this.onTapTrailing})
      : super(key: key);

  @override
  _BluetoothDevicesState createState() => _BluetoothDevicesState();
}

class _BluetoothDevicesState extends State<BluetoothDevices> {
  bool _hide = true;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.onTap();
        setState(() {
          _hide = !_hide;
        });
      },
      child: Container(
        child: Row(
          children: [
            Flexible(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    Icon(
                      _hide ? widget.iconLeadingNotCon : widget.iconLeadingCon,
                      color: ThemeConstant.lightScheme.onSurface,
                    ),
                    SizedBox(
                      width: 11,
                    ),
                    Text(
                      "${widget.deviceName}",
                      style: ThemeConstant.textTheme.bodyText1?.copyWith(
                          color: ThemeConstant.lightScheme.onSurface),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(right: 12),
              child: Align(
                alignment: Alignment.centerRight,
                child: Row(
                  children: [
                    Text(
                      "${_hide ? widget.notConnected : widget.connected}",
                      style: ThemeConstant.textTheme.bodyText1?.copyWith(
                        color: ThemeConstant.lightScheme.onSurface,
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    InkWell(
                      onTap: () {
                        widget.onTapTrailing();
                      },
                      child: Icon(
                        widget.iconTrailing,
                        color: ThemeConstant.lightScheme.onSurface,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
