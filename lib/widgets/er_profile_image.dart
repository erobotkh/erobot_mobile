import 'package:erobot/config/config_constant.dart';
import 'package:flutter/material.dart';

class ERProfileImage extends StatelessWidget {
  final String image;
  const ERProfileImage({
    required this.image,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ConfigConstant.objectHeight2,
      width: ConfigConstant.objectHeight2,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: NetworkImage(
            image,
          ),
        ),
      ),
    );
  }
}
