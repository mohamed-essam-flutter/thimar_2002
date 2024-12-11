import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:t7mara/core/utils/colors.dart';
import 'package:t7mara/core/utils/text.dart';

class CustomProfileCard extends StatelessWidget {
  const CustomProfileCard({
    super.key,
    required this.title,
    required this.icon,
    required this.onPressed,
  });
  final String title;
  final Widget icon;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        icon,
        Gap(9.w),
        Text(
          title,
          style: getbodyStyle(color: ColorApp.primary),
        ),
        const Spacer(),
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Color(0xffB2BCA8), width: 2.w),
                  borderRadius: BorderRadius.circular(10)),
              width: 30.w,
              height: 30.h,
              child: RotatedBox(
                quarterTurns: 2,
                child: IconButton(
                  icon: const Icon(
                    Icons.arrow_back_rounded,
                    size: 15,
                  ),
                  onPressed: onPressed,
                ),
              ),
            ),
          ],
        ),
        // RotatedBox(
        //     quarterTurns: 2,
        //     child: IconButton.outlined(
        //       iconSize: 15,
        //       onPressed: () {},
        //       icon: const Icon(
        //         Icons.arrow_back_rounded,
        //       ),
        //     ))
      ],
    );
  }
}
