import 'package:erobot/constant/theme_constant.dart';
import 'package:flutter/material.dart';

class ErListTileWidgets extends StatefulWidget {
  final String deviceName;
  final Function onTap;
  final Function onTapTrailing;

  ErListTileWidgets({
    Key? key,
    required this.deviceName,
    required this.onTap,
    required this.onTapTrailing,
  }) : super(key: key);

  @override
  _ErListTileWidgetsState createState() => _ErListTileWidgetsState();
}

class _ErListTileWidgetsState extends State<ErListTileWidgets> {
  bool _isConnected = true;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.onTap();
        setState(() {
          _isConnected = !_isConnected;
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
                      _isConnected ? Icons.bluetooth : Icons.bluetooth_connected,
                      color: ThemeConstant.lightScheme.onSurface,
                    ),
                    SizedBox(
                      width: 11,
                    ),
                    Text(
                      "${widget.deviceName}",
                      style: ThemeConstant.textTheme.bodyText1
                          ?.copyWith(color: ThemeConstant.lightScheme.onSurface),
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
                      _isConnected ? 'Not Connected' : 'Connected',
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
                        Icons.tune_rounded,
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
