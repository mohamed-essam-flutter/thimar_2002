import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
// import 'package:t7mara/core/functions/navigetor.dart';
import 'package:t7mara/core/utils/colors.dart';
import 'package:t7mara/core/utils/text.dart';
import 'package:t7mara/core/widgets/custom_botton.dart';
import 'package:t7mara/core/widgets/custom_icon.dart';
import 'package:t7mara/feature/favorite/presentation/bloc/bloc/favorite_bloc.dart';
import 'package:t7mara/feature/favorite/presentation/bloc/bloc/favorite_event.dart';
import 'package:t7mara/feature/favorite/presentation/bloc/bloc/favorite_state.dart';
// import 'package:t7mara/feature/home/presentation/page/VegetablesDetail.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<FavoriteBloc>().add(ShowFavoriteEvent());
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
                Navigator.of(context);
              }),
        ),
        centerTitle: true,
        title: Text(
          'المفضله',
          style: getHeadlineTextStyle(fontSize: 20.sp),
        ),
      ),
      body: BlocBuilder<FavoriteBloc, FavoriteState>(
        buildWhen: (previous, current) =>
            current is FavoriteLoadingState || current is FavoriteLoadedState,
        builder: (context, state) {
          if (state is FavoriteLoadedState) {
            var itemData =
                context.read<FavoriteBloc>().favoriteResponseModel?.data;
            return Padding(
              padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 16.h),
              child: Column(
                children: [
                  Expanded(
                    child: GridView.builder(
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 163.w / 215.h,
                          crossAxisSpacing: 10.w,
                          mainAxisSpacing: 10.h),
                      itemCount: itemData?.length,
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
                                        // push(context, VegetablesDetailScreen(item:itemData![index]));
                                      },
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(12),
                                        child: Image.network(
                                          itemData?[index].mainImage ?? "",
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
                                            '   -${itemData?[index].discount}%    ',
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
                                itemData?[index].title ?? "",
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
                                          itemData?[index]
                                                  .price
                                                  ?.toStringAsFixed(0) ??
                                              "",
                                          style: getHeadlineTextStyle(),
                                        ),
                                        Text(
                                          " ر.س",
                                          style: getHeadlineTextStyle(
                                              fontSize: 12),
                                        ),
                                        Text(
                                            '${itemData?[index].priceBeforeDiscount}رس',
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
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                              padding: const EdgeInsets.only(
                                                  top: 12, left: 16, right: 16),
                                              duration:
                                                  const Duration(minutes: 1),
                                              dismissDirection:
                                                  DismissDirection.endToStart,
                                              backgroundColor: ColorApp.white,
                                              shape:
                                                  const RoundedRectangleBorder(
                                                borderRadius: BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(40),
                                                    topRight:
                                                        Radius.circular(40)),
                                              ),
                                              width: double.infinity,
                                              behavior:
                                                  SnackBarBehavior.floating,
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
                                                          color:
                                                              ColorApp.primary,
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
                                                        Image.asset(
                                                          'assets/images/tomato.png',
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
                                                            child:
                                                                CustomButton1(
                                                          text:
                                                              'التحويل إلى السلة',
                                                          onPressed: () {},
                                                          radius: 15,
                                                        )),
                                                        Gap(15.w),
                                                        Expanded(
                                                            child:
                                                                CustomButton1(
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
              ),
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
