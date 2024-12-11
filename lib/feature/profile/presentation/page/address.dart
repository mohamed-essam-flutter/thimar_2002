import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:t7mara/core/functions/navigetor.dart';
import 'package:t7mara/core/utils/colors.dart';
import 'package:t7mara/core/utils/text.dart';
import 'package:t7mara/core/widgets/custom_botton.dart';
import 'package:t7mara/core/widgets/custom_icon.dart';
import 'package:t7mara/feature/profile/presentation/page/add_address.dart';

class AddressScreen extends StatelessWidget {
  const AddressScreen({super.key});

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
          'العناوين',
          style: getHeadlineTextStyle(fontSize: 20.sp),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 5.h),
                    padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 5.h),
                    height: 100.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border:
                            Border.all(color: ColorApp.primary, width: 2.w)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          children: [
                            Expanded(
                                child: Text(
                              'المنزل',
                              style: getHeadlineTextStyle(),
                            )),
                            SvgPicture.asset(
                              'assets/icons/delete.svg',
                              width: 25.w,
                              height: 25.h,
                              fit: BoxFit.cover,
                            ),
                            SvgPicture.asset(
                              'assets/icons/edit.svg',
                              width: 25.w,
                              height: 25.h,
                              fit: BoxFit.cover,
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              'العنوان:',
                              style: getbodyStyle(),
                            ),
                            Text(
                              '119 طريق الملك عبدالعزيز',
                              style: getbodyStyle(),
                            ),
                          ],
                        ),
                        Text(
                          'الوصف',
                          style: getbodyStyle(),
                        ),
                        Text(
                          'رقم الجوال',
                          style: getbodyStyle(),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Gap(10.h),
            CustomButton1(
              text: 'إضافة عنوان',
              onPressed: () {
                push(context, const AddAddressScreen());
              },
              colorText: ColorApp.primary,
              color: const Color(0xffF9FCF5),
              radius: 15,
            )
          ],
        ),
      ),
    );
  }
}
