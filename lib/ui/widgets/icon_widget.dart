import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class IconWidget extends StatelessWidget {
  final String image;
  final double height;
  final double radius;
  final Color bgColor;
  final Color iconColor;
  const IconWidget({
    super.key,
    required this.image,
    required this.height,
    required this.radius,
    required this.bgColor,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: bgColor,
      radius: radius,
      child: SvgPicture.asset(
        image,
        height: height,
        color: iconColor,
      ),
    );
  }
}
