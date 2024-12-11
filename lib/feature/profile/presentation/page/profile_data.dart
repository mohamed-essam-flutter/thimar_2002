import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:t7mara/core/utils/colors.dart';
import 'package:t7mara/core/utils/text.dart';
import 'package:t7mara/core/widgets/custom_botton.dart';
import 'package:t7mara/core/widgets/custom_icon.dart';

class ProfileDataScreen extends StatelessWidget {
  const ProfileDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(bottom: 28.h, right: 16.w, left: 16.w),
        child: CustomButton1(
          text: 'تعديل البيانات',
          onPressed: () {},
          radius: 15,
        ),
      ),
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
          'البيانات الشخصية',
          style: getHeadlineTextStyle(fontSize: 20.sp),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Gap(15.h),
              Center(
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.network(
                        'https://cdn.pixabay.com/photo/2015/07/20/12/57/ambassador-852766_960_720.jpg',
                        height: 83.h,
                        width: 88.w,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Text(
                      'محمد علي',
                      style: getHeadlineTextStyle(),
                    ),
                    Text(
                      '+96654787856',
                      style: getHeadlineTextStyle(),
                    )
                  ],
                ),
              ),
              Gap(16.h),
              TextFormField(
                decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.person_3_outlined,
                      color: ColorApp.primary,
                    ),
                    fillColor: ColorApp.border,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                    labelText: 'اسم المستخدم',
                    labelStyle: getHeadlineTextStyle(fontSize: 13)),
              ),
              Gap(16.h),
              Row(
                children: [
                  Container(
                    decoration: const BoxDecoration(color: ColorApp.border),
                    child: Column(
                      children: [
                        SvgPicture.asset('assets/icons/flag.svg'),
                        const Text('+956')
                      ],
                    ),
                  ),
                  const Gap(10),
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                          fillColor: ColorApp.border,
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                          prefixIcon: Icon(Icons.person),
                          labelText: 'رقم الجوال',
                          labelStyle: getHeadlineTextStyle(fontSize: 13)),
                      // validator: (value) {
                      //   if (value == null || value.isEmpty) {
                      //     return "برجاء ادخال رقم الموبايل";
                      //   }
                      //   return null;
                      // },
                    ),
                  ),
                ],
              ),
              Gap(16.h),
              TextFormField(
                decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.flag_outlined,
                      color: ColorApp.primary,
                    ),
                    fillColor: ColorApp.border,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                    labelText: 'المدينة',
                    labelStyle: getHeadlineTextStyle(fontSize: 13)),
              ),
              Gap(16.h),
              TextFormField(
                decoration: InputDecoration(
                    suffixIcon: Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Color(0xffB2BCA8), width: 2.w),
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
                              onPressed: () {},
                            ),
                          ),
                        ),
                      ],
                    ),
                    prefixIcon: const Icon(
                      Icons.lock_outline,
                      color: ColorApp.primary,
                    ),
                    fillColor: ColorApp.border,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                    labelText: 'كلمة المرور',
                    labelStyle: getHeadlineTextStyle(fontSize: 13)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
