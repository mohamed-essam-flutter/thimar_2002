import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:t7mara/core/utils/colors.dart';
import 'package:t7mara/core/utils/text.dart';
import 'package:t7mara/feature/home/presentation/bloc/home_bloc.dart';
import 'package:t7mara/feature/home/presentation/bloc/home_event.dart';
import 'package:t7mara/feature/home/presentation/widget/appBarHome.dart';
import 'package:t7mara/feature/home/presentation/widget/banner_home.dart';
import 'package:t7mara/feature/home/presentation/widget/custom_listView.dart';
import 'package:t7mara/feature/home/presentation/widget/home_grid_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<HomeBloc>().add(ShowHome());
    context.read<HomeBloc>().add(BannerHome());
    context.read<HomeBloc>().add(CategoriesHome());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(right: 15.w, left: 15.w, top: 5.h),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const AppBarHome(),
                Gap(5.h),
                TextFormField(
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.search_rounded),
                    hintText: 'ابحث عن ماتريد؟',
                    filled: true,
                    fillColor: Color(0xfff9fbf7),
                  ),
                ),
                Gap(24.h),
                const BannerHomeScreen(),
                Row(
                  children: [
                    Text(
                      "الأقسام",
                      style: getHeadlineTextStyle(
                          color: ColorApp.black, fontSize: 20.sp),
                    ),
                    const Spacer(),
                    Text(
                      "عرض الكل",
                      style: getTitleStyle(),
                    ),
                  ],
                ),
                SizedBox(
                    height: MediaQuery.of(context).size.height * 0.17,
                    child: const ListViewHome()),
                Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: Text(
                      "الأصناف",
                      style: getHeadlineTextStyle(
                          color: ColorApp.black, fontSize: 20.sp),
                    )),
                const HomeGridView(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
