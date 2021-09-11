import 'package:erobot/constant/theme_constant.dart';
import 'package:flutter/material.dart';

class BluetoothDetailScreen extends StatefulWidget {
  const BluetoothDetailScreen({Key? key}) : super(key: key);

  @override
  _BluetoothDetailScreenState createState() => _BluetoothDetailScreenState();
}

class _BluetoothDetailScreenState extends State<BluetoothDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Beats',
          style: ThemeConstant.textTheme.headline6
              ?.copyWith(color: ThemeConstant.lightScheme.onSurface),
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 50),
        child: Column(
          children: [
            Container(
              child: InkWell(
                onTap: () {},
                child: AspectRatio(
                  aspectRatio: 374 / 48,
                  child: Container(
                    padding: EdgeInsets.only(left: 15),
                    decoration: BoxDecoration(
                      color: ThemeConstant.lightScheme.surface,
                      borderRadius: BorderRadius.circular(0),
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'DISCONNECTED',
                        style: ThemeConstant.textTheme.button?.copyWith(
                            color: ThemeConstant.lightScheme.onSurface),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              child: InkWell(
                onTap: () {},
                child: AspectRatio(
                  aspectRatio: 374 / 48,
                  child: Container(
                    padding: EdgeInsets.only(left: 15),
                    decoration: BoxDecoration(
                      color: ThemeConstant.lightScheme.surface,
                      borderRadius: BorderRadius.circular(0),
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'FORGET THIS DEVICE',
                        style: ThemeConstant.textTheme.button?.copyWith(
                            color: ThemeConstant.lightScheme.onSurface),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
