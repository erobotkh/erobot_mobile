import 'package:flutter/material.dart';

class RemotterButtonModel {
  String? label;
  Widget child;
  Color color;
  void Function() onTap;

  RemotterButtonModel({
    this.label,
    required this.child,
    this.color = Colors.white,
    required this.onTap,
  });

  static List<RemotterButtonModel> getButtonList(BuildContext context) {
    var buttonWhite = Theme.of(context)
        .textTheme
        .button!
        .copyWith(fontWeight: FontWeight.w600);
    var buttonBlack = Theme.of(context)
        .textTheme
        .button!
        .copyWith(fontWeight: FontWeight.w600, color: Colors.black);
    return [
      RemotterButtonModel(
        child: Text('CH-', style: buttonWhite),
        color: Colors.red,
        onTap: () {
          print('CH-');
        },
      ),
      RemotterButtonModel(
        child: Text(
          'CH',
          style: buttonWhite,
        ),
        color: Colors.red,
        onTap: () {
          print('CH');
        },
      ),
      RemotterButtonModel(
        child: Text(
          'CH+',
          style: buttonWhite,
        ),
        color: Colors.red,
        onTap: () {
          print('CH+');
        },
      ),
      RemotterButtonModel(
        label: 'PREV',
        child: Icon(Icons.first_page),
        color: Colors.blue,
        onTap: () {
          print('first page');
        },
      ),
      RemotterButtonModel(
        label: 'NEXT',
        child: Icon(Icons.last_page),
        color: Colors.blue,
        onTap: () {
          print('last page');
        },
      ),
      RemotterButtonModel(
        label: 'PLAY/PUSH',
        child: Icon(Icons.play_arrow),
        color: Colors.green,
        onTap: () {
          print('play arrow');
        },
      ),
      RemotterButtonModel(
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
        label: 'VOL+',
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        color: Colors.grey,
        onTap: () {
          print('+');
        },
      ),
      RemotterButtonModel(
        label: '',
        child: Text(
          'HQ',
          style: buttonWhite,
        ),
        color: Colors.amber,
        onTap: () {
          print('HQ');
        },
      ),
      RemotterButtonModel(
        child: Text(
          '0',
          style: buttonBlack,
        ),
        onTap: () {
          print('0');
        },
      ),
      RemotterButtonModel(
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
        color: Colors.blue,
        child: Text(
          '200+',
          style: buttonWhite,
        ),
        onTap: () {
          print('200+');
        },
      ),
      RemotterButtonModel(
        child: Text(
          '1',
          style: buttonBlack,
        ),
        onTap: () {
          print('1');
        },
      ),
      RemotterButtonModel(
        child: Text(
          '2',
          style: buttonBlack,
        ),
        onTap: () {
          print('2');
        },
      ),
      RemotterButtonModel(
        child: Text(
          '3',
          style: buttonBlack,
        ),
        onTap: () {
          print('3');
        },
      ),
      RemotterButtonModel(
        child: Text(
          '4',
          style: buttonBlack,
        ),
        onTap: () {
          print('4');
        },
      ),
      RemotterButtonModel(
        child: Text(
          '5',
          style: buttonBlack,
        ),
        onTap: () {
          print('5');
        },
      ),
      RemotterButtonModel(
        child: Text(
          '6',
          style: buttonBlack,
        ),
        onTap: () {
          print('6');
        },
      ),
      RemotterButtonModel(
        child: Text(
          '7',
          style: buttonBlack,
        ),
        onTap: () {
          print('7');
        },
      ),
      RemotterButtonModel(
        child: Text(
          '8',
          style: buttonBlack,
        ),
        onTap: () {
          print('8');
        },
      ),
      RemotterButtonModel(
        child: Text(
          '9',
          style: buttonBlack,
        ),
        onTap: () {
          print('9');
        },
      ),
    ];
  }
}
