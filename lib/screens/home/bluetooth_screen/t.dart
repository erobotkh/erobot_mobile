// import 'package:erobot/constant/theme_constant.dart';
// import 'package:flutter/material.dart';
//
// import 'local_widgets/er_bluetoothdevice.dart';
//
// class R extends StatelessWidget {
//   const R({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Column(
//         children: [
//           Divider(
//             color: ThemeConstant.lightScheme.secondary,
//           ),
//           Container(
//             height: 35,
//             child: BluetoothDevices(
//               onTap: () {},
//               onTapTrailing: () {
//                 Navigator.of(context)
//                     .push(MaterialPageRoute(builder: (context) => BluetoothDetailScreen()));
//               },
//               deviceName: cardBluetoothDevice.deviceName,
//               connected: cardBluetoothDevice.connected,
//               notConnected: cardBluetoothDevice.notConnected,
//               iconLeadingCon: cardBluetoothDevice.iconLeadingCon,
//               iconTrailing: cardBluetoothDevice.iconTrailing,
//               iconLeadingNotCon: cardBluetoothDevice.iconLeadingNotCon,
//             ),
//           ),
//           Divider(
//             color: ThemeConstant.lightScheme.secondary,
//           ),
//           Container(
//             height: 35,
//             child: BluetoothDevices(
//               onTap: () {},
//               onTapTrailing: () {
//                 Navigator.of(context)
//                     .push(MaterialPageRoute(builder: (context) => BluetoothDetailScreen()));
//               },
//               deviceName: cardBluetoothDevice.deviceName,
//               connected: cardBluetoothDevice.connected,
//               notConnected: cardBluetoothDevice.notConnected,
//               iconLeadingCon: cardBluetoothDevice.iconLeadingCon,
//               iconLeadingNotCon: cardBluetoothDevice.iconLeadingNotCon,
//               iconTrailing: cardBluetoothDevice.iconTrailing,
//             ),
//           ),
//           Divider(
//             color: ThemeConstant.lightScheme.secondary,
//           ),
//           Container(
//             height: 35,
//             child: BluetoothDevices(
//               onTap: () {},
//               onTapTrailing: () {
//                 Navigator.of(context)
//                     .push(MaterialPageRoute(builder: (context) => BluetoothDetailScreen()));
//               },
//               deviceName: cardBluetoothDevice.deviceName,
//               connected: cardBluetoothDevice.connected,
//               notConnected: cardBluetoothDevice.notConnected,
//               iconLeadingCon: cardBluetoothDevice.iconLeadingCon,
//               iconLeadingNotCon: cardBluetoothDevice.iconLeadingNotCon,
//               iconTrailing: cardBluetoothDevice.iconTrailing,
//             ),
//           ),
//           Divider(
//             color: ThemeConstant.lightScheme.secondary,
//           ),
//           Container(
//             height: 35,
//             child: BluetoothDevices(
//               onTap: () {},
//               onTapTrailing: () {
//                 Navigator.of(context)
//                     .push(MaterialPageRoute(builder: (context) => BluetoothDetailScreen()));
//               },
//               deviceName: cardBluetoothDevice.deviceName,
//               connected: cardBluetoothDevice.connected,
//               notConnected: cardBluetoothDevice.notConnected,
//               iconLeadingCon: cardBluetoothDevice.iconLeadingCon,
//               iconLeadingNotCon: cardBluetoothDevice.iconLeadingNotCon,
//               iconTrailing: cardBluetoothDevice.iconTrailing,
//             ),
//           ),
//           Divider(
//             color: ThemeConstant.lightScheme.secondary,
//           ),
//           Container(
//             height: 35,
//             child: BluetoothDevices(
//               onTap: () {},
//               onTapTrailing: () {
//                 Navigator.of(context)
//                     .push(MaterialPageRoute(builder: (context) => BluetoothDetailScreen()));
//               },
//               deviceName: cardBluetoothDevice.deviceName,
//               connected: cardBluetoothDevice.connected,
//               notConnected: cardBluetoothDevice.notConnected,
//               iconLeadingCon: cardBluetoothDevice.iconLeadingCon,
//               iconLeadingNotCon: cardBluetoothDevice.iconLeadingNotCon,
//               iconTrailing: cardBluetoothDevice.iconTrailing,
//             ),
//           ),
//           Divider(
//             color: ThemeConstant.lightScheme.secondary,
//           ),
//           Container(
//             height: 35,
//             child: Align(
//               alignment: Alignment.centerLeft,
//               child: Text(
//                 'OTHER DEVICES',
//                 style: ThemeConstant.textTheme.caption
//                     ?.copyWith(color: ThemeConstant.lightScheme.onSurface),
//               ),
//             ),
//           ),
//           Divider(
//             color: ThemeConstant.lightScheme.secondary,
//           ),
//           Container(
//             height: 35,
//             child: BluetoothDevices(
//               onTap: () {
//                 setState(() {
//                   _buildshowAlertDailog(context);
//                 });
//               },
//               onTapTrailing: () {},
//               deviceName: cardBluetoothDevice.deviceName,
//               connected: '',
//               notConnected: '',
//               iconLeadingCon: null,
//               iconTrailing: null,
//               iconLeadingNotCon: null,
//             ),
//           ),
//           Divider(
//             color: ThemeConstant.lightScheme.secondary,
//           ),
//         ],
//       ),
//     );
//   }
// }
