import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:t7mara/core/utils/colors.dart';
import 'package:t7mara/core/utils/text.dart';
import 'package:t7mara/core/widgets/custom_icon.dart';

class AppBarHome extends StatelessWidget {
  const AppBarHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          'assets/icons/logo_app_bar.svg',
          width: 25.w,
          height: 25.h,
        ),
        Text(
          'سلة ثمار',
          style: getTitleStyle(color: ColorApp.primary),
        ),
        const Spacer(
          flex: 1,
        ),
        Column(
          children: [
            Text(
              "التوصيل إلى",
              style: getTitleStyle(color: ColorApp.primary),
            ),
            Text(
              'شارع الملك فهد - جدة',
              style: getbodyStyle(),
            )
          ],
        ),
        const Spacer(
          flex: 1,
        ),
        CustomIcons(
          icon: Icon(Icons.lock_outline),
          onPressed: () {},
          size: 25.h,
        )
      ],
    );
  }
}
