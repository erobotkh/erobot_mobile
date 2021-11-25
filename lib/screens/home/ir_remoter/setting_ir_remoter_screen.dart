import 'package:erobot/constant/theme_constant.dart';
import 'package:erobot/screens/home/bluetooth_screen/local_widgets/er_alert_dailog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingIRRomoterDetailScreen extends StatefulWidget {
  const SettingIRRomoterDetailScreen({Key? key}) : super(key: key);

  @override
  State<SettingIRRomoterDetailScreen> createState() => _SettingIRRomoterDetailScreenState();
}

class _SettingIRRomoterDetailScreenState extends State<SettingIRRomoterDetailScreen> {
  List<String> name = [
    "CH-",
    "CH",
    "CH+",
    "PREV",
    "NEXT",
    "PLAY/PUSH",
    "VOL-",
    "VOL+",
    "HQ",
    "0",
    "1OO+",
    "2OO+",
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeConstant.lightScheme.background,
      appBar: AppBar(
        title: Text(
          'Setting IR Remoter',
          style: ThemeConstant.textTheme.headline6?.copyWith(
            color: ThemeConstant.lightScheme.onSurface,
          ),
        ),
      ),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.only(top: 20, left: 15),
            child: Text(
              'ALL BUTTONS',
              style: ThemeConstant.textTheme.overline?.copyWith(
                color: ThemeConstant.lightScheme.onSurface,
              ),
            ),
          ),
          SizedBox(height: 15),
          Container(
            color: ThemeConstant.lightScheme.secondary,
            padding: EdgeInsets.only(top: 1, bottom: 1),
            child: Column(
              children: [
                Container(
                  color: ThemeConstant.lightScheme.surface,
                  padding: EdgeInsets.only(left: 10),
                  child: Column(
                    children: List.generate(
                      name.length,
                      (index) => Column(
                        children: [
                          Container(
                            height: 50,
                            padding: EdgeInsets.only(right: 10),
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  _buildshowAlertDailog(context);
                                });
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "${name[index]}",
                                      style: ThemeConstant.textTheme.bodyText1?.copyWith(
                                        color: ThemeConstant.lightScheme.onPrimary,
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {},
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: Icon(
                                        Icons.chevron_right,
                                        color: ThemeConstant.lightScheme.onPrimary,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            color: ThemeConstant.lightScheme.secondary,
                            height: 0.2,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 100),
        ],
      ),
    );
  }

  _buildshowAlertDailog(context) {
    Size size = MediaQuery.of(context).size;
    return showDialog(
      context: context,
      builder: (context) {
        return ErAlertDailog(
          title: 'Set word for sending',
          continuee: 'SET',
          onPressedContinue: () {},
          back: 'CANCEL',
          onPressedBack: () {
            Navigator.of(context).pop();
          },
          content: Container(
            width: size.width,
            height: size.height * 0.25,
            child: Column(
              children: [
                Text(
                  'You should type your word to determind it is sent to robot',
                  textAlign: TextAlign.center,
                  style: ThemeConstant.textTheme.bodyText1?.copyWith(
                    color: ThemeConstant.lightScheme.secondary,
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: 'Input text',
                    hintStyle: ThemeConstant.textTheme.subtitle1?.copyWith(
                      color: ThemeConstant.lightScheme.secondary,
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        CupertinoIcons.clear,
                        color: ThemeConstant.lightScheme.secondary,
                        size: 17,
                      ),
                      onPressed: () {
                        setState(() {});
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
