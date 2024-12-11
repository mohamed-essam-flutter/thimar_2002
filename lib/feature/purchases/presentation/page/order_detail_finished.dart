import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:t7mara/core/utils/colors.dart';
import 'package:t7mara/core/utils/text.dart';
import 'package:t7mara/core/widgets/custom_botton.dart';
import 'package:t7mara/core/widgets/custom_icon.dart';

class OrderDetailFinishedScreen extends StatelessWidget {
  const OrderDetailFinishedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomIcons(
              icon: const Icon(
                Icons.arrow_back_ios_new,
                color: ColorApp.primary,
              ),
              size: 25.h,
              onPressed: () {
                Navigator.pop(context);
              }),
        ),
        centerTitle: true,
        title: Text(
          'تفاصيل الطلب',
          style: getHeadlineTextStyle(fontSize: 20.sp),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: EdgeInsets.only(
                  left: 9.w, right: 9.w, top: 9.h, bottom: 13.h),
              height: 109.h,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(15)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                          child: Text(
                        'طلب #4587',
                        style: getHeadlineTextStyle(fontSize: 17),
                      )),
                      SizedBox(
                        height: 23.h,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text('بإنتظار الموافقة'),
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              backgroundColor: const Color(0xffEAFFD5)),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: Text(DateFormat.yMd().format(DateTime.now()))),
                      Text(
                        '180 رس',
                        style: getHeadlineTextStyle(),
                      )
                    ],
                  ),
                  Gap(13.h),
                  Row(
                    children: [
                      Image.network(
                        'https://cdn.pixabay.com/photo/2014/04/03/10/26/banana-310449_1280.png',
                        width: 25.w,
                        height: 25.h,
                      ),
                      Image.network(
                        'https://cdn.pixabay.com/photo/2014/04/03/10/26/banana-310449_1280.png',
                        width: 25.w,
                        height: 25.h,
                      ),
                      Image.network(
                        'https://cdn.pixabay.com/photo/2014/04/03/10/26/banana-310449_1280.png',
                        width: 25.w,
                        height: 25.h,
                      ),
                      Container(
                          width: 25.w,
                          height: 25.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: ColorApp.border),
                          child: Center(
                              child: Text(
                            '+2',
                            style: getHeadlineTextStyle(),
                          ))),
                      const Spacer(),
                      CustomIcons(
                        icon:
                            const Center(child: Icon(Icons.arrow_back_ios_new)),
                        onPressed: () {},
                        size: 14.w,
                      ),
                    ],
                  )
                ],
              ),
            ),
            Text(
              'عنوان التوصيل',
              style: getHeadlineTextStyle(fontSize: 17.sp),
            ),
            Gap(16.h),
            Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(15)),
              child: ListTile(
                title: Text(
                  'المنزل',
                  style: getHeadlineTextStyle(),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'شقة 40',
                      style: getSmallStyle(fontSize: 12.sp),
                    ),
                    Text(
                      'شارع العليا الرياض 12521السعودية',
                      style: getSmallStyle(fontSize: 12.sp),
                    )
                  ],
                ),
                trailing: SvgPicture.asset(
                  'assets/images/map.svg',
                  width: 72.w,
                  height: 62.h,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Gap(16.h),
            Text(
              'ملخص الطلب',
              style: getHeadlineTextStyle(fontSize: 17.sp),
            ),
            Gap(16.h),
            Container(
              height: 148.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xffF3F8EE)),
              child: Column(
                children: [
                  const Gap(10),
                  Row(
                    children: [
                      Text(
                        'إجمالي المنتجات',
                        style: getHeadlineTextStyle(),
                      ),
                      const Spacer(),
                      Text(
                        '180ر.س',
                        style: getHeadlineTextStyle(),
                      )
                    ],
                  ),
                  const Gap(10),
                  Row(
                    children: [
                      Text(
                        'سعر التوصيل',
                        style: getHeadlineTextStyle(),
                      ),
                      const Spacer(),
                      Text(
                        '-40ر.س',
                        style: getHeadlineTextStyle(),
                      )
                    ],
                  ),
                  const Divider(
                    indent: 40,
                    endIndent: 40,
                  ),
                  const Gap(10),
                  Row(
                    children: [
                      Text(
                        'المجموع',
                        style: getHeadlineTextStyle(
                            fontWeight: FontWeight.w900, fontSize: 17.sp),
                      ),
                      const Spacer(),
                      Text(
                        '140ر.س',
                        style: getHeadlineTextStyle(),
                      )
                    ],
                  ),
                  const Divider(
                    indent: 40,
                    endIndent: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'تم الدفع بواسطة',
                        style: getHeadlineTextStyle(fontSize: 15.sp),
                      ),
                      SvgPicture.asset(
                        'assets/icons/visa_icon.svg',
                        width: 50.w,
                        height: 15.h,
                      )
                    ],
                  )
                ],
              ),
            ),
            const Spacer(),
            CustomButton1(
              text: 'تقييم المنتجات',
              onPressed: () {},
              radius: 15,
            )
          ],
        ),
      ),
    );
  }
}
