import 'package:erobot/config/config_constant.dart';
import 'package:erobot/models/e_chip_model.dart';
import 'package:flutter/material.dart';


class SenderScreen extends StatefulWidget {
  @override
  _SenderScreenState createState() => _SenderScreenState();
}

class _SenderScreenState extends State<SenderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.dark,
        backgroundColor: Theme.of(context).colorScheme.background,
        leading: IconButton(
          onPressed: () {
            print("back sender page");
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: Text("Sender"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.bluetooth),
          ),
        ],
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(horizontal: ConfigConstant.margin2),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: ConfigConstant.margin1,
                  vertical: ConfigConstant.margin2),
              child: TextFormField(
                decoration: InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Message',
                  labelStyle:
                      TextStyle(color: Theme.of(context).colorScheme.onSurface),
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.send,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: ConfigConstant.margin0),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Recently",
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ),
                ],
              ),
            ),
            Echips(),
          ],
        ),
      ),
    );
  }
}
