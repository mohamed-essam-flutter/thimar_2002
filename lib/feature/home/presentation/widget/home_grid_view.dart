import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:t7mara/core/functions/navigetor.dart';
import 'package:t7mara/core/utils/colors.dart';
import 'package:t7mara/core/utils/text.dart';
import 'package:t7mara/feature/home/presentation/bloc/home_bloc.dart';
import 'package:t7mara/feature/home/presentation/bloc/home_state.dart';
import 'package:t7mara/feature/home/presentation/page/VegetablesDetail.dart';

class HomeGridView extends StatelessWidget {
  const HomeGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
        buildWhen: (previous, current) =>
            current is HomeLoadedState || current is HomeLoadingState,
        builder: (context, state) {
          if (state is HomeLoadedState) {
            var products = context.read<HomeBloc>().homeResponseModel?.data;
            return GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 163 / 250,
                  crossAxisSpacing: 10.w,
                  mainAxisSpacing: 10.h),
              itemCount: products?.length,
              itemBuilder: (BuildContext context, int index) {
                return SizedBox(
                  height: 600.h,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Stack(
                            children: [
                              InkWell(
                                onTap: () {
                                  push(
                                      context,
                                      VegetablesDetailScreen(
                                        item: products![index],
                                      ));
                                },
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.network(
                                    products?[index].mainImage ?? "",
                                    width: 150.w,
                                    height: 120.h,
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
                                            bottomRight: Radius.circular(12))),
                                    child: Text(
                                      '   45%-    ',
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
                          products?[index].title.toString() ?? "",
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
                                    products?[index].price.toString() ?? "",
                                    style: getHeadlineTextStyle(),
                                  ),
                                  Text(
                                    " ر.س",
                                    style: getHeadlineTextStyle(),
                                  ),
                                  Expanded(
                                    child: Text(
                                        products![index]
                                                .priceBeforeDiscount
                                                ?.toStringAsFixed(0) ??
                                            "",
                                        style: TextStyle(
                                            decoration:
                                                TextDecoration.lineThrough,
                                            color: ColorApp.primary,
                                            fontSize: 14.sp)),
                                  )
                                ],
                              ),
                            ),
                            FloatingActionButton.small(
                              heroTag: null,
                              onPressed: () {},
                              backgroundColor: ColorApp.primary,
                              child: const Icon(
                                Icons.add,
                                color: ColorApp.white,
                              ),
                            )
                          ],
                        ),
                        Center(
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)),
                                backgroundColor: ColorApp.primary),
                            child: Text(
                              'أضف للسلة',
                              style:
                                  getHeadlineTextStyle(color: ColorApp.white),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }
}
