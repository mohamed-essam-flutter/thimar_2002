import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:t7mara/core/utils/colors.dart';
import 'package:t7mara/core/utils/text.dart';
import 'package:t7mara/core/widgets/custom_botton.dart';
import 'package:t7mara/core/widgets/custom_icon.dart';
import 'package:t7mara/feature/home/presentation/bloc/home_bloc.dart';
import 'package:t7mara/feature/home/presentation/bloc/home_event.dart';
import 'package:t7mara/feature/home/presentation/bloc/home_state.dart';

class MealsSectionScreen extends StatefulWidget {
  const MealsSectionScreen({super.key});
  @override
  State<MealsSectionScreen> createState() => _MealsSectionScreenState();
}

class _MealsSectionScreenState extends State<MealsSectionScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<HomeBloc>().add(CategoriesMealsHome());
  }

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
              size: 25.h,
              onPressed: () {
                Navigator.pop(context);
              }),
        ),
        centerTitle: true,
        title: Text(
          'لحوم',
          style: getHeadlineTextStyle(fontSize: 20.sp),
        ),
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        buildWhen: (previous, current) =>
            current is CategoriesMealsLoadedState ||
            current is CategoriesMealsLoadingState,
        builder: (context, state) {
          if (state is CategoriesMealsLoadedState) {
            var item =
                context.read<HomeBloc>().categoriesMealsResponseModels?.data;
            return Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.search_rounded),
                      hintText: 'ابحث عن ماتريد؟',
                      filled: true,
                      fillColor: Color(0xfff9fbf7),
                      suffixIcon: Icon(
                        Icons.tune,
                        color: ColorApp.primary,
                      ),
                      suffixIconColor: ColorApp.primary),
                ),
                Expanded(
                  child: GridView.builder(
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 163.w / 215.h,
                        crossAxisSpacing: 10.w,
                        mainAxisSpacing: 10.h),
                    itemCount: item?.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Stack(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      // push(context, const VegetablesDetailScreen());
                                    },
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(12),
                                      child: Image.network(
                                        item?[index].mainImage ?? "",
                                        width: 145.w,
                                        height: 117.h,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                      child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Container(
                                        decoration: const BoxDecoration(
                                            color: ColorApp.primary,
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(12),
                                                bottomRight:
                                                    Radius.circular(12))),
                                        child: Text(
                                          '   ${item?[index].discount ?? ""}%-    ',
                                          style: getHeadlineTextStyle(
                                              color: ColorApp.white),
                                        ),
                                      ),
                                    ],
                                  ))
                                ],
                              ),
                            ),
                            Text(
                              item?[index].title ?? "",
                              style: getHeadlineTextStyle(),
                            ),
                            Text(
                              'السعر / 1كجم',
                              style: getHeadlineTextStyle(
                                  color: ColorApp.black,
                                  fontWeight: FontWeight.normal),
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Row(
                                    children: [
                                      Text(
                                        '${item?[index].price ?? ""}',
                                        style: getHeadlineTextStyle(),
                                      ),
                                      Text(
                                        " ر.س",
                                        style: getHeadlineTextStyle(),
                                      ),
                                      Text(
                                          '${item?[index].priceBeforeDiscount ?? ""}رس',
                                          style: TextStyle(
                                              decoration:
                                                  TextDecoration.lineThrough,
                                              color: ColorApp.primary,
                                              fontSize: 13.sp))
                                    ],
                                  ),
                                ),
                                FloatingActionButton.small(
                                  heroTag: null,
                                  onPressed: () {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                            padding: const EdgeInsets.only(
                                                top: 12, left: 16, right: 16),
                                            duration:
                                                const Duration(minutes: 1),
                                            dismissDirection:
                                                DismissDirection.endToStart,
                                            backgroundColor: ColorApp.white,
                                            shape: const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(40),
                                                  topRight:
                                                      Radius.circular(40)),
                                            ),
                                            width: double.infinity,
                                            behavior: SnackBarBehavior.floating,
                                            content: SizedBox(
                                              height: 202.h,
                                              width: double.infinity,
                                              child: Column(
                                                children: [
                                                  // CustomIcons(icon:Icon(Icons.check_box), onPressed: onPressed)
                                                  Row(
                                                    children: [
                                                      const Icon(
                                                        Icons.check_box,
                                                        color: ColorApp.primary,
                                                      ),
                                                      Text(
                                                        'تم إضافة المنتج بنجاح',
                                                        style:
                                                            getHeadlineTextStyle(
                                                                fontSize: 14),
                                                      )
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      Image.network(
                                                        item?[index]
                                                                .mainImage ??
                                                            "",
                                                        height: 65.h,
                                                        width: 70.w,
                                                        fit: BoxFit.cover,
                                                      ),
                                                      Gap(10.w),
                                                      Column(
                                                        children: [
                                                          Text(
                                                            'طماطم',
                                                            style:
                                                                getHeadlineTextStyle(),
                                                          ),
                                                          Text(
                                                            'الكميه:4',
                                                            style:
                                                                getHeadlineTextStyle(),
                                                          ),
                                                          Text(
                                                            '200 رس',
                                                            style:
                                                                getHeadlineTextStyle(),
                                                          )
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                  Gap(23.h),
                                                  Row(
                                                    children: [
                                                      Expanded(
                                                          child: CustomButton1(
                                                        text:
                                                            'التحويل إلى السلة',
                                                        onPressed: () {},
                                                        radius: 15,
                                                      )),
                                                      Gap(15.w),
                                                      Expanded(
                                                          child: CustomButton1(
                                                        text: 'تصفح العروض',
                                                        onPressed: () {},
                                                        radius: 15,
                                                        colorText:
                                                            ColorApp.primary,
                                                        color: ColorApp.white,
                                                      ))
                                                    ],
                                                  )
                                                ],
                                              ),
                                            )));
                                  },
                                  backgroundColor: ColorApp.primary,
                                  child: const Icon(
                                    Icons.add,
                                    color: ColorApp.white,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
