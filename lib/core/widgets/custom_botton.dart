import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:t7mara/core/utils/colors.dart';
import 'package:t7mara/core/utils/text.dart';

class CustomButton1 extends StatelessWidget {
  const CustomButton1(
      {super.key,
      required this.text,
      required this.onPressed,
      this.radius = 60,
      this.height = 60,
      this.width = double.infinity,
      this.color = ColorApp.primary,
      this.colorText = ColorApp.white});
  final Color? color;
  final Color? colorText;
  final String text;
  final Function() onPressed;
  final double radius;
  final double? height;
  final double? width;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 60.h,
      width: width ?? MediaQuery.of(context).size.width,
      child: ElevatedButton(
        onPressed: () {
          FocusScope.of(context).unfocus();
          onPressed();
        },
        style: ElevatedButton.styleFrom(
          side: const BorderSide(color: ColorApp.primary),
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
        ),
        child: Text(
          text,
          style: getHeadlineTextStyle(color: colorText),
        ),
      ),
    );
  }
}
