import 'package:flutter/material.dart';
import 'package:t7mara/core/utils/colors.dart';
import 'package:t7mara/core/utils/text.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.hight,
    this.width,
    this.color,
    required this.onPressed,
    this.radius,
    required this.text1,
    required this.text2,
    required this.text3,
    required this.icon,
  });
  final Color? color;
  final double? hight;
  final double? width;
  final Function() onPressed;
  final double? radius;
  final String text1;
  final String text2;
  final String text3;
  final Widget icon;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: hight ?? 60,
      width: width ?? double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            backgroundColor: color ?? ColorApp.primary,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15))),
        child: Row(
          children: [
            icon,
            Text(
              text1,
              style: getHeadlineTextStyle(color: ColorApp.white),
            ),
            const Spacer(),
            Text(
              text2,
              style: getHeadlineTextStyle(color: ColorApp.white),
            ),
            Text(
              text3,
              style: getHeadlineTextStyle(color: ColorApp.white),
            )
          ],
        ),
      ),
    );
  }
}
