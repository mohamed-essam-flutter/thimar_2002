import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:t7mara/core/utils/colors.dart';
import 'package:t7mara/core/utils/text.dart';
import 'package:t7mara/core/widgets/custom_botton.dart';
import 'package:t7mara/feature/purchases/presentation/page/current_list_view.dart';
import 'package:t7mara/feature/purchases/presentation/page/finished_list_view.dart';

class PurchasesScreen extends StatefulWidget {
  const PurchasesScreen({super.key});

  @override
  State<PurchasesScreen> createState() => _PurchasesScreenState();
}

class _PurchasesScreenState extends State<PurchasesScreen> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'طلباتي',
          style: getHeadlineTextStyle(fontSize: 20),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 17.w, vertical: 17.h),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(5),
              height: 55.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xffF3F3F3)),
              child: Row(
                children: [
                  Expanded(
                      child: CustomButton1(
                    text: 'الحاليه',
                    onPressed: () {
                      setState(() {
                        index = 0;
                      });
                    },
                    radius: 10,
                    color: index == 0 ? ColorApp.primary : ColorApp.white,
                    colorText:
                        index == 0 ? ColorApp.white : const Color(0xffA2A1A4),
                  )),
                  Gap(4.w),
                  Expanded(
                      child: CustomButton1(
                          text: 'المنتهية',
                          onPressed: () {
                            setState(() {
                              index = 1;
                            });
                          },
                          radius: 10,
                          color: index == 1 ? ColorApp.primary : ColorApp.white,
                          colorText: index == 1
                              ? ColorApp.white
                              : const Color(0xffA2A1A4))),
                ],
              ),
            ),
            if (index == 0)
              const Expanded(
                child: CurrentListView(),
              ),
            if (index == 1)
              const Expanded(
                child: FinishedListView(),
              ),
          ],
        ),
      ),
    );
  }
}
