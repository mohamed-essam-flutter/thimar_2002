import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:t7mara/core/functions/navigetor.dart';
import 'package:t7mara/core/utils/colors.dart';
import 'package:t7mara/core/utils/text.dart';
import 'package:t7mara/core/widgets/custom_botton_icon.dart';
import 'package:t7mara/core/widgets/custom_icon.dart';
import 'package:t7mara/feature/cart/presentation/bloc/cart_bloc.dart';
import 'package:t7mara/feature/cart/presentation/bloc/cart_event.dart';
import 'package:t7mara/feature/cart/presentation/page/cart.dart';
import 'package:t7mara/feature/home/data/models/response/home_response_model/datum.dart';
import 'package:t7mara/feature/home/presentation/bloc/home_bloc.dart';
import 'package:t7mara/feature/home/presentation/bloc/home_event.dart';
import 'package:t7mara/feature/home/presentation/bloc/home_state.dart';
import 'package:t7mara/feature/home/presentation/widget/listViewProductEvaluation.dart';

// ignore: must_be_immutable
class VegetablesDetailScreen extends StatefulWidget {
  final ProductDetailModels item;
  const VegetablesDetailScreen({super.key, required this.item});

  @override
  State<VegetablesDetailScreen> createState() => _VegetablesDetailScreenState();
}

class _VegetablesDetailScreenState extends State<VegetablesDetailScreen> {
  int initialPage = 0;

  @override
  void initState() {
    super.initState();
    context.read<HomeBloc>().add(ProductEvaluationHome());
  }

  double count = 1;

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeBloc, HomeState>(
      listener: (context, state) {
        if (state is AddToFavoriteLoadedState) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
            child: Text(
              'تم الاضافه الي المفضله',
              style: getHeadlineTextStyle(),
            ),
          )));
        }
      },
      child: Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomIcons(
              icon: const Icon(Icons.arrow_back_ios_new),
              onPressed: () {
                Navigator.pop(context);
              },
              size: 25.h,
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomIcons(
                icon: const Icon(Icons.favorite),
                onPressed: () {
                  context
                      .read<HomeBloc>()
                      .add(AddToFavorite(id: widget.item.id??0));
                },
                size: 25.h,
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 230.h,
                    width: 375.w,
                    child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20)),
                        child: Image.network(
                          widget.item.mainImage ?? "",
                          fit: BoxFit.cover,
                        )),
                  ),
                  Row(
                    children: [
                      Text(
                        widget.item.title ?? "",
                        style: getHeadlineTextStyle(fontSize: 22),
                      ),
                      const Spacer(),
                      Text(
                        ' ${widget.item.discount.toString()}%  ',
                        style: getbodyStyle(color: Colors.red),
                      ),
                      Text(
                        widget.item.price.toString(),
                        style: getHeadlineTextStyle(),
                      ),
                      Text(
                        ' ر.س',
                        style: getHeadlineTextStyle(),
                      ),
                      Gap(5.w),
                      Text(
                        "${widget.item.priceBeforeDiscount!.toStringAsFixed(0)} رس",
                        style: const TextStyle(
                            decoration: TextDecoration.lineThrough,
                            color: ColorApp.primary),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'السعر / 1كجم',
                        style: getHeadlineTextStyle(fontSize: 22),
                      ),
                      const Spacer(),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color(0xfff9fbf7)),
                        child: Row(
                          children: [
                            FloatingActionButton.small(
                              heroTag: null,
                              onPressed: () {
                                setState(() {
                                  count++;
                                });
                              },
                              child: const Icon(Icons.add),
                            ),
                            Text(
                              count.toStringAsFixed(0),
                              style: getHeadlineTextStyle(),
                            ),
                            FloatingActionButton.small(
                              heroTag: null,
                              onPressed: () {
                                setState(() {
                                  if (count > 1) {
                                    count--;
                                  }
                                });
                              },
                              child: const Icon(Icons.remove),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "كود المنتج",
                        style: getHeadlineTextStyle(fontSize: 22),
                      ),
                      const Gap(8),
                      Text(
                        widget.item.id.toString(),
                        style: getHeadlineTextStyle(fontSize: 22),
                      )
                    ],
                  ),
                  Text(
                    'تفاصيل المنتج',
                    style: getHeadlineTextStyle(fontSize: 22),
                  ),
                  Text(
                    widget.item.description ?? "",
                    style: getbodyStyle(),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Row(
                    children: [
                      Text(
                        " التقييمات",
                        style: getHeadlineTextStyle(fontSize: 22),
                      ),
                      const Spacer(),
                      Text(
                        'عرض الكل',
                        style: getHeadlineTextStyle(fontSize: 22),
                      ),
                    ],
                  ),
                  const Column(
                    children: [
                      SizedBox(
                        height: 90,
                        width: double.infinity,
                        child: ListViewProductEvaluation(),
                      ),
                    ],
                  ),
                  Text(
                    'منتجات مشابهة',
                    style: getHeadlineTextStyle(fontSize: 22),
                  ),
                  SizedBox(
                    height: 190.h,
                    width: double.infinity,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          height: 170.h,
                          width: 130.w,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: Image.asset(
                                      'assets/images/tomato.png',
                                      fit: BoxFit.cover,
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
                                          '   45%-    ',
                                          style: getHeadlineTextStyle(
                                              color: ColorApp.white),
                                        ),
                                      ),
                                    ],
                                  ))
                                ],
                              ),
                              Text(
                                "طماطم",
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
                                  Row(
                                    children: [
                                      Text(
                                        '45',
                                        style:
                                            getHeadlineTextStyle(fontSize: 13),
                                      ),
                                      Text(
                                        " ر.س",
                                        style:
                                            getHeadlineTextStyle(fontSize: 13),
                                      ),
                                      Text(
                                        '45',
                                        style:
                                            getHeadlineTextStyle(fontSize: 10),
                                      ),
                                      Text(
                                        " ر.س",
                                        style:
                                            getHeadlineTextStyle(fontSize: 10),
                                      ),
                                    ],
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
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  CustomButton(
                    icon: const Icon(
                      Icons.shopping_cart_outlined,
                      color: ColorApp.white,
                    ),
                    onPressed: () {
                      context.read<CartBloc>().add(StoreProductEvent(
                          id: widget.item.id.toString(),
                          amount: count.toString()));
                      pushReplacement(context, const CartScreen());
                    },
                    text1: "إضافة إلي السلة",
                    text2: "${widget.item.price}  ",
                    text3: "رس",
                  )
                ],
              )),
        ),
      ),
    );
  }
}
