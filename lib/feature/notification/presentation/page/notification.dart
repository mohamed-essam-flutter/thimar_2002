import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:t7mara/core/utils/text.dart';
import 'package:t7mara/core/widgets/custom_icon.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "الإشعارات",
          style: getHeadlineTextStyle(fontSize: 20.sp),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  padding: const EdgeInsets.all(8),
                  height: 80.h,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CustomIcons(
                            icon: Image.network(
                              'https://cdn.pixabay.com/photo/2016/10/07/14/19/sale-1721647_1280.jpg',
                              height: 20.h,
                              width: 20.w,
                            ),
                            onPressed: () {},
                            height: 33.h,
                            width: 33.h,
                          ),
                          Gap(10.w),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'عروض جديدة بإنتظارك',
                                  style: getSmallStyle(),
                                ),
                                Text(
                                  'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى',
                                  style: getSmallStyle(fontSize: 12),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  'منذ ساعتان',
                                  style: getSmallStyle(),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  // child: ListTile(
                  //   leading: CustomIcons(icon:Image.network('https://cdn.pixabay.com/photo/2016/10/07/14/19/sale-1721647_1280.jpg',height: 20.h,width: 20.w,), onPressed: (){},
                  //   height: 33.h,width: 33.h,),
                  //   title: Text('عروض جديدة بإنتظارك',style: getSmallStyle(),),
                  //   subtitle: Column(
                  //     crossAxisAlignment: CrossAxisAlignment.start,
                  //     children: [
                  //     Text('هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى',style: getSmallStyle(fontSize: 12),maxLines: 2,),
                  //     Text('منذ ساعتان',style: getSmallStyle(),),
                  //   ],),
                  // ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
