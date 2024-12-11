import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:t7mara/core/utils/colors.dart';
import 'package:t7mara/core/utils/text.dart';
import 'package:t7mara/core/widgets/custom_botton.dart';

class AddAddressScreen extends StatefulWidget {
  const AddAddressScreen({super.key});

  @override
  State<AddAddressScreen> createState() => _AddAddressScreenState();
}

class _AddAddressScreenState extends State<AddAddressScreen> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(10.0),
          child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: SvgPicture.asset(
                'assets/icons/arrow_back.svg',
                height: 20.h,
                width: 20.w,
                fit: BoxFit.contain,
              )),
        ),
        title: Text(
          'سياسة الخصوصية',
          style: getHeadlineTextStyle(fontSize: 20.sp),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
                width: double.infinity,
                child: SvgPicture.asset(
                  'assets/images/map.svg',
                  height: 220.h,
                  fit: BoxFit.cover,
                )),
            Row(
              children: [
                const Expanded(
                  child: Align(
                      alignment: Alignment.topRight,
                      child: Text(
                        'نوع العنوان',
                      )),
                ),
                CustomButton1(
                  text: 'المنزل',
                  onPressed: () {
                    setState(() {
                      index = 0;
                    });
                  },
                  width: 80.w,
                  height: 36.h,
                  radius: 11,
                  color: index == 0 ? ColorApp.primary : ColorApp.white,
                  colorText: index == 0 ? ColorApp.white : ColorApp.primary,
                ),
                Gap(5.w),
                CustomButton1(
                    text: 'العمل',
                    onPressed: () {
                      setState(() {
                        index = 1;
                      });
                    },
                    width: 80.w,
                    height: 36.h,
                    radius: 11,
                    color: index == 1 ? ColorApp.primary : ColorApp.white,
                    colorText: index == 1 ? ColorApp.white : ColorApp.primary),
              ],
            ),
            Gap(14.h),
            TextFormField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(13)),
                  hintText: 'أدخل رقم الجوال'),
            ),
            Gap(14.h),
            TextFormField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(13)),
                  hintText: 'الوصف'),
            ),
            const Spacer(),
            CustomButton1(
              text: 'إضافة العنوان',
              onPressed: () {},
              radius: 15,
            )
          ],
        ),
      ),
    );
  }
}
