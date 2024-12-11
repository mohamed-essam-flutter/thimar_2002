import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:t7mara/core/utils/colors.dart';
import 'package:t7mara/core/utils/text.dart';
import 'package:t7mara/core/widgets/custom_botton.dart';
import 'package:t7mara/core/widgets/custom_icon.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});

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
            onPressed: () {
              Navigator.pop(context);
            },
            size: 25.h,
          ),
        ),
        title: Text(
          'تواصل معنا',
          style: getHeadlineTextStyle(fontSize: 20.sp),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 32.h, left: 16.w, right: 16.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Stack(
                children: [
                  SizedBox(
                      height: 200.h,
                      width: double.infinity,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(18),
                          child: SvgPicture.asset(
                            'assets/images/map.svg',
                            fit: BoxFit.cover,
                          ))),
                  Positioned(
                      top: 120.h,
                      left: 10.w,
                      right: 10.w,
                      child: Container(
                        padding: EdgeInsets.all(10.h),
                        decoration: BoxDecoration(
                            color: ColorApp.white,
                            borderRadius: BorderRadius.circular(15)),
                        height: 119.h,
                        width: 312.w,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                const Icon(
                                  Icons.location_on_outlined,
                                  color: ColorApp.primary,
                                ),
                                Expanded(
                                    child: Text(
                                  'شارع الملك فهد , جدة , المملكة العربية السعودية13',
                                  style: getbodyStyle(),
                                ))
                              ],
                            ),
                            Gap(5.h),
                            Row(children: [
                              const Icon(
                                Icons.phone_in_talk_outlined,
                                color: ColorApp.primary,
                              ),
                              Text(
                                '+966 054 87452',
                                style: getbodyStyle(),
                              )
                            ]),
                            Gap(5.h),
                            Row(
                              children: [
                                const Icon(
                                  Icons.email_outlined,
                                  color: ColorApp.primary,
                                ),
                                Text(
                                  'info@thimar.com',
                                  style: getbodyStyle(),
                                )
                              ],
                            )
                          ],
                        ),
                      ))
                ],
              ),
              Gap(20.h),
              Center(
                  child: Text(
                'أو يمكنك إرسال رسالة ',
                style: getbodyStyle(),
              )),
              Gap(30.h),
              TextFormField(
                decoration: const InputDecoration(hintText: 'الإسم'),
              ),
              Gap(5.h),
              TextFormField(
                decoration: const InputDecoration(hintText: 'رقم الموبايل'),
              ),
              Gap(5.h),
              Container(
                height: 110.h,
                decoration: BoxDecoration(
                    color: ColorApp.black,
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  children: [
                    Expanded(
                      child: TextFormField(
                        expands: true,
                        maxLines: null,
                        minLines: null,
                        decoration: const InputDecoration(
                          hintText: 'الموضوع',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Gap(10.h),
              CustomButton1(
                text: 'إرسال',
                onPressed: () {},
                radius: 15,
              )
            ],
          ),
        ),
      ),
    );
  }
}
