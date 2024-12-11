import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:t7mara/core/utils/colors.dart';
import 'package:t7mara/core/utils/text.dart';
import 'package:t7mara/core/widgets/custom_botton.dart';
import 'package:t7mara/core/widgets/custom_icon.dart';

class WalletDetailScreen extends StatefulWidget {
  const WalletDetailScreen({super.key});

  @override
  State<WalletDetailScreen> createState() => _WalletDetailScreenState();
}

class _WalletDetailScreenState extends State<WalletDetailScreen> {
  int index = 1;
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
          'المحفظه',
          style: getHeadlineTextStyle(fontSize: 20.sp),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(10.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Gap(33.h),
            Center(
                child: Column(
              children: [
                Text(
                  'رصيدك',
                  style: getHeadlineTextStyle(fontSize: 20.sp),
                ),
                Text(
                  '225 رس',
                  style: getHeadlineTextStyle(fontSize: 20.sp),
                ),
              ],
            )),
            Gap(73.h),
            CustomButton1(
              text: 'اشحن الآن',
              onPressed: () {},
              color: const Color(0xffF9FCF5),
              colorText: ColorApp.primary,
              radius: 15,
            ),
            Gap(60.h),
            Row(
              children: [
                Expanded(
                    child: Text(
                  'سجل المعاملات',
                  style: getHeadlineTextStyle(),
                )),
                Text(
                  'عرض الكل',
                  style: getHeadlineTextStyle(color: ColorApp.black),
                ),
              ],
            ),
            if (index == 0)
              Expanded(
                child: ListView.builder(
                  itemCount: 3,
                  itemBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      height: 83.h,
                      child: ListTile(
                        leading: SvgPicture.asset(
                          'assets/icons/arrow _top.svg',
                          width: 20.w,
                          height: 20.h,
                          fit: BoxFit.cover,
                        ),
                        title: Text(
                          'شحن المحفظة',
                          style: getHeadlineTextStyle(),
                        ),
                        subtitle: Text(
                          '225 رس',
                          style: getHeadlineTextStyle(),
                        ),
                        trailing: Text(DateFormat.yMd().format(DateTime.now())),
                      ),
                    );
                  },
                ),
              ),
            Gap(20.h),
            if (index == 1)
              Expanded(
                child: ListView.builder(
                  itemCount: 3,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      padding: EdgeInsets.all(8),
                      height: 145.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(17),
                          color: ColorApp.white),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset(
                                'assets/icons/red_arrow.svg',
                                width: 20.w,
                                height: 20.h,
                                fit: BoxFit.cover,
                              ),
                              Gap(5.w),
                              Text(
                                'دفعت مقابل هذا الطلب',
                                style: getHeadlineTextStyle(),
                              ),
                              const Spacer(),
                              Text(DateFormat.yMd().format(DateTime.now()))
                            ],
                          ),
                          Gap(22.h),
                          ListTile(
                            title: Text(
                              'طلب #4587',
                              style: getSmallStyle(fontSize: 13),
                            ),
                            subtitle: Row(
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
                                Text(
                                  '180 رس',
                                  style: getHeadlineTextStyle(),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
