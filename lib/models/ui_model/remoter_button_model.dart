import 'package:flutter/material.dart';

class RemotterButtonModel {
  String label;
  Widget child;
  Color color;
  bool showLabel;
  void Function() onTap;

  RemotterButtonModel({
    required this.label,
    this.showLabel = false,
    this.color = Colors.white,
    required this.child,
    required this.onTap,
  });

  static List<RemotterButtonModel> getButtonList(BuildContext context) {
    var buttonWhite = Theme.of(context).textTheme.labelLarge!.copyWith(fontWeight: FontWeight.w600);
    var buttonBlack =
        Theme.of(context).textTheme.labelLarge!.copyWith(fontWeight: FontWeight.w600, color: Colors.black);
    return [
      RemotterButtonModel(
        label: 'CH-',
        child: Text('CH-', style: buttonWhite),
        color: Colors.red,
        onTap: () {
          print('CH-');
        },
      ),
      RemotterButtonModel(
        label: 'CH',
        child: Text('CH', style: buttonWhite),
        color: Colors.red,
        onTap: () {
          print('CH');
        },
      ),
      RemotterButtonModel(
        label: 'CH+',
        child: Text('CH+', style: buttonWhite),
        color: Colors.red,
        onTap: () {
          print('CH+');
        },
      ),
      RemotterButtonModel(
        label: 'PREV',
        showLabel: true,
        child: Icon(Icons.first_page),
        color: Colors.blue,
        onTap: () {
          print('first page');
        },
      ),
      RemotterButtonModel(
        label: 'NEXT',
        showLabel: true,
        child: Icon(Icons.last_page),
        color: Colors.blue,
        onTap: () {
          print('last page');
        },
      ),
      RemotterButtonModel(
        label: 'PLAY/PUSH',
        showLabel: true,
        child: Icon(Icons.play_arrow),
        color: Colors.green,
        onTap: () {
          print('play arrow');
        },
      ),
      RemotterButtonModel(
        showLabel: true,
        label: 'VOL-',
        child: Icon(
          Icons.remove,
          color: Colors.white,
        ),
        color: Colors.grey,
        onTap: () {
          print('-');
        },
      ),
      RemotterButtonModel(
        showLabel: true,
        label: 'VOL+',
        child: Icon(Icons.add, color: Colors.white),
        color: Colors.grey,
        onTap: () {
          print('+');
        },
      ),
      RemotterButtonModel(
        label: 'HQ',
        child: Text('HQ', style: buttonWhite),
        color: Colors.amber,
        onTap: () {
          print('HQ');
        },
      ),
      RemotterButtonModel(
        label: '0',
        child: Text('0', style: buttonBlack),
        onTap: () {
          print('0');
        },
      ),
      RemotterButtonModel(
        label: '100+',
        color: Colors.blue,
        child: Text(
          '100+',
          style: buttonWhite,
        ),
        onTap: () {
          print('100+');
        },
      ),
      RemotterButtonModel(
        label: '200+',
        color: Colors.blue,
        child: Text('200+', style: buttonWhite),
        onTap: () {
          print('200+');
        },
      ),
      RemotterButtonModel(
        label: '1',
        child: Text('1', style: buttonBlack),
        onTap: () {
          print('1');
        },
      ),
      RemotterButtonModel(
        label: '2',
        child: Text('2', style: buttonBlack),
        onTap: () {
          print('2');
        },
      ),
      RemotterButtonModel(
        label: '3',
        child: Text('3', style: buttonBlack),
        onTap: () {
          print('3');
        },
      ),
      RemotterButtonModel(
        label: '4',
        child: Text('4', style: buttonBlack),
        onTap: () {
          print('4');
        },
      ),
      RemotterButtonModel(
        label: '5',
        child: Text('5', style: buttonBlack),
        onTap: () {
          print('5');
        },
      ),
      RemotterButtonModel(
        label: '6',
        child: Text('6', style: buttonBlack),
        onTap: () {
          print('6');
        },
      ),
      RemotterButtonModel(
        label: '7',
        child: Text('7', style: buttonBlack),
        onTap: () {
          print('7');
        },
      ),
      RemotterButtonModel(
        label: '8',
        child: Text('8', style: buttonBlack),
        onTap: () {
          print('8');
        },
      ),
      RemotterButtonModel(
        label: '9',
        child: Text('9', style: buttonBlack),
        onTap: () {
          print('9');
        },
      ),
    ];
  }
}
