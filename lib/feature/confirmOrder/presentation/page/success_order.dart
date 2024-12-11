import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:t7mara/core/functions/navigetor.dart';
import 'package:t7mara/core/utils/colors.dart';
import 'package:t7mara/core/utils/text.dart';
import 'package:t7mara/core/widgets/custom_botton.dart';
import 'package:t7mara/core/widgets/navigation_bar.dart';
import 'package:t7mara/feature/home/presentation/page/home.dart';

class SuccessOrderScreen extends StatelessWidget {
  const SuccessOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xff8E8E8E),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 17.h),
              height: 436.h,
              width: double.infinity,
              decoration: const BoxDecoration(
                  color: ColorApp.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(38),
                      topRight: Radius.circular(38))),
              child: Column(children: [
                SvgPicture.asset(
                  'assets/images/success.svg',
                  height: 223.h,
                ),
                Gap(23.h),
                Text(
                  'شكرا لك لقد تم تنفيذ طلبك بنجاح',
                  style: getHeadlineTextStyle(fontSize: 20),
                ),
                Gap(11.h),
                Text(
                  'يمكنك متابعة حالة الطلب او الرجوع للرئسيية',
                  style: getHeadlineTextStyle(color: ColorApp.gray),
                ),
                Gap(29.h),
                Row(
                  children: [
                    Expanded(
                        child: CustomButton1(
                      onPressed: () {
                        pushReplacement(
                            context,
                            const NavigationBarScreen(
                              index: 1,
                            ));
                      },
                      text: 'طلباتي',
                      radius: 15,
                    )),
                    Gap(16.w),
                    Expanded(
                        child: CustomButton1(
                      onPressed: () {
                        pushReplacement(context, const HomeScreen());
                      },
                      text: 'الرئيسية',
                      radius: 15,
                      color: ColorApp.white,
                      colorText: ColorApp.primary,
                    ))
                  ],
                )
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
