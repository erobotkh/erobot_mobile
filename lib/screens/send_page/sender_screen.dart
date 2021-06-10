import 'package:erobot/config/config_constant.dart';
import 'package:erobot/controller/message_controller.dart';
import 'package:erobot/models/e_chip_model.dart';
import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class SenderScreen extends StatefulWidget {
=======
import 'package:get/get.dart';

class EducationScreen extends StatefulWidget {
>>>>>>> 2da71de... close #28 sender screen : modify local storage
  @override
  _EducationScreenState createState() => _EducationScreenState();
}

class _EducationScreenState extends State<EducationScreen> {
  var colors = [
    Color(0xff1976D2),
    Color(0xff990000),
    Color(0xffF57C00),
    Color(0xff388E3C),
  ];
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
              child: GetBuilder<StorageMessage>(
                  init: StorageMessage(),
                  builder: (controller) {
                    return TextFormField(
                      controller: controller.textcontroller,
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Message',
                        labelStyle: TextStyle(
                            color: Theme.of(context).colorScheme.onSurface),
                        suffixIcon: IconButton(
                          onPressed: () {
                            controller.onSaveData();
                          },
                          icon: Icon(
                            Icons.send,
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                        ),
                      ),
                    );
                  }),
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
            Container(
              alignment: Alignment.topLeft,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: GetBuilder<StorageMessage>(
                    init: StorageMessage(),
                    builder: (controller) {
                      return Wrap(
                        spacing: 4.0,
                        runSpacing: 0.0,
                        children: List.generate(
                          controller.lstSave.length,
                          (index) => Chip(
                            backgroundColor: colors[index % colors.length],
                            label: Text(
                              controller.lstSave[index]['text'],
                              overflow: TextOverflow.ellipsis,
                            ),
                            labelStyle: TextStyle(
                                fontWeight: FontWeight.w500,
                                //fontSize: 16,
                                color: Theme.of(context).colorScheme.onSurface),
                            padding: EdgeInsets.symmetric(
                                horizontal: ConfigConstant.margin1),
                            deleteIconColor: Colors.white,
                            onDeleted: () {
                              print(
                                  "Delete message ${controller.lstSave[index]['text']}");
                              controller.onRemoveData(index);
                            },
                          ),
                        ),
                      );
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
