import 'package:erobot/config/config_constant.dart';
import 'package:erobot/storage/sender_storage.dart';
import 'package:flutter/material.dart';

import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

class SenderScreen extends StatefulWidget {
  @override
  _SenderScreenState createState() => _SenderScreenState();
}

class _SenderScreenState extends State<SenderScreen> {
  final strings = [
    'niptict',
    'npic',
    'catd',
    'I Like this One sdfsdf sdfds fdsf dsf dsf dsf dsfds fds fsd fds fdsf d'
  ];
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
            Navigator.of(context).pop();
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
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(horizontal: ConfigConstant.margin2),
          child: GetBuilder<LocalStorage>(
              init: LocalStorage(),
              builder: (controller) {
                return Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: ConfigConstant.margin1,
                          vertical: ConfigConstant.margin2),
                      child: TextFormField(
                        controller: controller.messagecontroller,
                        decoration: InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Message',
                          labelStyle: TextStyle(
                              color: Theme.of(context).colorScheme.onSurface),
                          suffixIcon: IconButton(
                            onPressed: () {
                              controller.onSave();
                            },
                            icon: Icon(
                              Icons.send,
                              color: Theme.of(context).colorScheme.onSurface,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: ConfigConstant.margin0),
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
                      child: GetBuilder<LocalStorage>(
                          init: LocalStorage(),
                          builder: (controller) {
                            return Wrap(
                              spacing: 4.0,
                              runSpacing: 0.0,
                              children: List.generate(
                                controller.lstmessage.length,
                                (index) => Chip(
                                  backgroundColor:
                                      colors[index % colors.length],
                                  label: Text(
                                    controller.lstmessage[index]['messagecontroller'],
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  labelStyle: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      //fontSize: 16,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSurface),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: ConfigConstant.margin1),
                                  deleteIconColor: Colors.white,
                                  onDeleted: () {
                                    //  print('delete ${strings[index]}');
                                    controller.onRemove(index);
                                  },
                                ),
                              ).toList(),
                            );
                          }),
                    )
                  ],
                );
              }),
        ),
      ),
    );
  }
}

// class SenderScreen extends StatelessWidget {
//   const SenderScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final strings = [
//       'niptict',
//       'npic',
//       'catd',
//       'I Like this One sdfsdf sdfds fdsf dsf dsf dsf dsfds fds fsd fds fdsf d'
//     ];
//     var colors = [
//       Color(0xff1976D2),
//       Color(0xff990000),
//       Color(0xffF57C00),
//       Color(0xff388E3C),
//     ];
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("data"),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             flex: 3,
//             child: GetBuilder<LocalStorage>(
//                 init: LocalStorage(),
//                 builder: (controller) {
//                   return Column(
//                     children: [
//                       TextFormField(
//                         controller: controller.name,
//                       ),
//                       ElevatedButton(
//                           onPressed: () {
//                             controller.onSave();
//                           },
//                           child: Icon(Icons.send))
//                     ],
//                   );
//                 }),
//           ),
//           GetBuilder<LocalStorage>(
//               init: LocalStorage(),
//               builder: (controller) {
//                 return controller.lstmessage.isEmpty
//                     ? Center(
//                         child: Text("data"),
//                       )
//                     // : ListView.builder(
//                     //     shrinkWrap: true,
//                     //     itemCount: controller.lstmessage.length,
//                     //     itemBuilder: (context, index) {
//                     //       return ListTile(
//                     //         title: Text(controller.lstmessage[index]['name']),
//                     //       );
//                     //     });
//                     : Wrap(
//                         spacing: 4.0,
//                         runSpacing: 0.0,
//                         children: List.generate(
//                           controller.lstmessage.length,
//                           (index) => Chip(
//                             backgroundColor: colors[index % colors.length],
//                             label: Text(
//                               controller.lstmessage[index]['name'],
//                               overflow: TextOverflow.ellipsis,
//                             ),
//                             labelStyle: TextStyle(
//                                 fontWeight: FontWeight.w500,
//                                 //fontSize: 16,
//                                 color: Theme.of(context).colorScheme.onSurface),
//                             padding: EdgeInsets.symmetric(
//                                 horizontal: ConfigConstant.margin1),
//                             deleteIconColor: Colors.white,
//                             onDeleted: () {
//                               print('delete ${strings[index]}');
//                             },
//                           ),
//                         ),
//                       );
//               }),
//         ],
//       ),
//     );
//   }
// }
