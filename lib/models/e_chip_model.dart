import 'package:erobot/config/config_constant.dart';
import 'package:flutter/material.dart';

class Echips extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final strings = [
      'niptict',
      'npic',
      'catd',
      'I Like this One sdfsdf sdfds fdsf dsf dsf dsf dsfds fds fsd fds fdsf d',
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

    final _buttons = List.generate(
      strings.length,
      (index) => Chip(
        backgroundColor: colors[index % colors.length],
        label: Text(
          strings[index],
          overflow: TextOverflow.ellipsis,
        ),
        labelStyle: TextStyle(
            fontWeight: FontWeight.w500,
            //fontSize: 16,
            color: Theme.of(context).colorScheme.onSurface),
        padding: EdgeInsets.symmetric(horizontal: ConfigConstant.margin1),
        deleteIconColor: Colors.white,
        onDeleted: () {
          print('delete ${strings[index]}');
        },
      ),
    ).toList();
    return Container(
      alignment: Alignment.topLeft,
      child: Wrap(
        spacing: 4.0,
        runSpacing: 0.0,
        children: _buttons,
      ),
    );
  }
}
