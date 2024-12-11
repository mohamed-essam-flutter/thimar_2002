import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:t7mara/core/functions/navigetor.dart';
import 'package:t7mara/core/utils/colors.dart';
import 'package:t7mara/core/utils/text.dart';
import 'package:t7mara/feature/purchases/presentation/page/order_detail_finished.dart';

class FinishedListView extends StatelessWidget {
  const FinishedListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          onTap: () {
            push(context, const OrderDetailFinishedScreen());
          },
          child: Container(
            padding:
                EdgeInsets.only(left: 9.w, right: 9.w, top: 9.h, bottom: 13.h),
            height: 100.h,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
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
                        child: Text('منتهي'),
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            backgroundColor: const Color(0xffEAFFD5)),
                      ),
                    )
                  ],
                ),
                Text(DateFormat.yMd().format(DateTime.now())),
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
                    Text(
                      '180 رس',
                      style: getHeadlineTextStyle(),
                    )
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
