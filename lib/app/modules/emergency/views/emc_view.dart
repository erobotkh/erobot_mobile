import 'package:erobot_mobile/app/modules/emergency/controllers/emc_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:radio_group_v2/radio_group_v2.dart';

import '../../joystick/widgets/custom_app_bar.dart';

class EmcView extends GetView<EmcController> {
  RadioGroupController myController = RadioGroupController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: 'Emergency',
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(left: 10, right: 10),
        child: Column(children: [
          _listViewEmcContact(context),
          const SizedBox(
            height: 15,
          ),
          _listViewEmcCompany(context)
        ]),
      ),
    );
  }

  Column _listViewEmcContact(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Emergency Contact',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Expanded(child: Align(alignment: Alignment.centerRight, child: Text("See more")))
            ],
          ),
        ),
        Column(
          children: List.generate(
            5,
            (index) {
              return GestureDetector(
                onTap: () async {
                  showDialog<void>(
                    context: context,
                    // barrierDismissible: false, // user must tap button!
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text("Police"),
                        content: SingleChildScrollView(
                          child: ListBody(
                            children: <Widget>[
                              RadioGroup(
                                controller: myController,
                                values: ["000000000000", "111111111111", "2222222222"],
                                orientation: RadioGroupOrientation.Vertical,
                                decoration: const RadioGroupDecoration(spacing: 10.0, activeColor: Colors.green),
                              )
                            ],
                          ),
                        ),
                        actions: <Widget>[
                          OutlinedButton(
                            child: const Text('Cancel'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          OutlinedButton(
                            child: const Text('Ok'),
                            onPressed: () {},
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  decoration:
                      BoxDecoration(color: Theme.of(context).focusColor, borderRadius: BorderRadius.circular(16)),
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 20,
                          backgroundColor: const Color.fromARGB(255, 143, 143, 143),
                          child: IconButton(onPressed: () {}, icon: const Icon(Icons.call)),
                        ),
                        const Padding(padding: EdgeInsets.only(left: 8)),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Police",
                              style: const TextStyle(fontSize: 20),
                            ),
                            for (int i = 0; i < 3; i++)
                              Text(
                                "0346894116464",
                                style: const TextStyle(fontSize: 16),
                              ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Column _listViewEmcCompany(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              const Text(
                'Emergency Company',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
        Column(
          children: List.generate(
            5,
            (index) {
              return GestureDetector(
                onTap: () {},
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 90,
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  decoration:
                      BoxDecoration(color: Theme.of(context).focusColor, borderRadius: BorderRadius.circular(16)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 90.0,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  "https://cdn6.aptoide.com/imgs/c/c/d/ccd99ffe32da0889cbb1ddad8603a0f2_icon.png")),
                          borderRadius:
                              BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10)),
                          color: Colors.redAccent,
                        ),
                      ),
                      const Padding(padding: EdgeInsets.only(left: 8)),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Smart",
                            style: const TextStyle(fontSize: 20),
                          ),
                          const Text("View Prefix and Command ")
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
