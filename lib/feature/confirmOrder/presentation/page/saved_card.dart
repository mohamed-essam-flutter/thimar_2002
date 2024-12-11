import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:t7mara/core/functions/navigetor.dart';
import 'package:t7mara/core/utils/colors.dart';
import 'package:t7mara/core/utils/text.dart';
import 'package:t7mara/core/widgets/custom_botton.dart';
import 'package:t7mara/core/widgets/custom_icon.dart';
import 'package:t7mara/feature/confirmOrder/presentation/page/success_order.dart';

class SavedCardScreen extends StatelessWidget {
  const SavedCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xff8E8E8E),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 25.w),
              height: 320.h,
              width: double.infinity,
              decoration: const BoxDecoration(
                  color: ColorApp.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(38),
                      topRight: Radius.circular(38))),
              child: Column(
                children: [
                  Text(
                    'البطاقات المحفوظة',
                    style: getHeadlineTextStyle(),
                  ),
                  Gap(23.h),
                  SizedBox(
                    height: 108.h,
                    width: double.infinity,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 3,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Image.network(
                            'https://cdn.pixabay.com/photo/2016/05/03/12/19/credit-card-1369111_1280.png',
                            width: 240.w,
                            height: 107.h,
                            fit: BoxFit.fill,
                          ),
                        );
                      },
                    ),
                  ),
                  Gap(20.h),
                  Row(
                    children: [
                      CustomIcons(
                          icon: const Icon(
                            Icons.add,
                            color: ColorApp.primary,
                          ),
                          size: 25.h,
                          onPressed: () {}),
                      Text(
                        'إضافة بطاقة دفع',
                        style: getHeadlineTextStyle(),
                      ),
                    ],
                  ),
                  CustomButton1(
                    text: 'تأكيد الأختيار',
                    onPressed: () {
                      pushAndRemoveUntil(context, const SuccessOrderScreen());
                    },
                    radius: 15,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
