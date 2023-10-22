import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:travel_kenya/ui/common/box_text.dart';
import 'package:travel_kenya/ui/common/enums.dart';

class ButtonWidget extends StatelessWidget {
  final Function onPressed;
  final bool isBusy;
  final String text;
  final Color btnColor;
  final Color textColor;
  final double fontSize;
  final double radius;
  final double height;
  final bool hasIcon;
  final String? icon;
  final Color? iconColor;
  final double? iconHeight;
  final double? iconSpacing;
  final AlignmentEnum? iconAlign;
  final bool? isOutline;

  const ButtonWidget({
    super.key,
    required this.onPressed,
    required this.isBusy,
    required this.text,
    required this.btnColor,
    required this.textColor,
    required this.radius,
    required this.height,
    required this.fontSize,
    required this.hasIcon,
    this.icon,
    this.iconColor,
    this.iconHeight,
    this.iconSpacing = 5,
    this.iconAlign = AlignmentEnum.right,
    this.isOutline = false,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: isOutline! ? null : btnColor,
      height: height,
      // minWidth: 100,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
          side: BorderSide(color: btnColor)),
      child: hasIcon
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (iconAlign == AlignmentEnum.left) ...[
                  SvgPicture.asset(
                    icon!,
                    color: iconColor,
                    height: iconHeight,
                  ),
                  SizedBox(
                    width: iconSpacing,
                  ),
                ],
                ManropeText.medium(text, fontSize, textColor),
                if (iconAlign == AlignmentEnum.right) ...[
                  SizedBox(
                    width: iconSpacing,
                  ),
                  SvgPicture.asset(
                    icon!,
                    color: iconColor,
                    height: iconHeight,
                  ),
                ],
              ],
            )
          : ManropeText.medium(text, fontSize, textColor),
      onPressed: () => isBusy ? () {} : onPressed(),
    );
  }
}
