import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:t7mara/core/functions/navigetor.dart';
import 'package:t7mara/core/utils/colors.dart';
import 'package:t7mara/core/utils/text.dart';
import 'package:t7mara/core/widgets/custom_botton.dart';
import 'package:t7mara/core/widgets/custom_icon.dart';
import 'package:t7mara/feature/cart/presentation/bloc/cart_bloc.dart';
import 'package:t7mara/feature/cart/presentation/bloc/cart_event.dart';
import 'package:t7mara/feature/cart/presentation/widget/list_view_cart.dart';
import 'package:t7mara/feature/confirmOrder/presentation/page/confirm_order.dart';


class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<CartBloc>().add(ShowCartEvent());
  }

  @override
  Widget build(BuildContext context) {
    var cartData = context.read<CartBloc>().showCartResponseModels;
    return Scaffold(
      backgroundColor: const Color(0xffFBFBFB),
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomIcons(
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: ColorApp.primary,
            ),
            onPressed: () {
              
            },
            size: 25.h,
          ),
        ),
        title: Text(
          'السلة',
          style: getHeadlineTextStyle(fontSize: 20.sp),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.5,
                child: const list_view_cart(),
              ),
              Gap(12.h),
              TextFormField(
                decoration: InputDecoration(
                    prefixIcon: Row(
                  children: [
                    const Expanded(
                        child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        'عندك كوبون ؟ ادخل رقم الكوبون',
                      ),
                    )),
                    CustomButton1(
                      onPressed: () {},
                      text: 'تطبيق',
                      width: 95.w,
                      height: 40.h,
                      radius: 10,
                    ),
                  ],
                )),
              ),
              Text(
                'جميع الأسعار تشمل قيمة الضريبة المضافة 15%',
                style: getHeadlineTextStyle(),
              ),
              SizedBox(
                height: 110.h,
                width: double.infinity,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xffF3F8EE)),
                  child: Column(
                    children: [
                      const Gap(10),
                      Row(
                        children: [
                          Text(
                            'إجمالي المنتجات',
                            style: getHeadlineTextStyle(),
                          ),
                          const Spacer(),
                          Text(
                            '${cartData?.totalPriceBeforeDiscount}ر.س',
                            style: getHeadlineTextStyle(),
                          )
                        ],
                      ),
                      const Gap(10),
                      Row(
                        children: [
                          Text(
                            'الخصم',
                            style: getHeadlineTextStyle(),
                          ),
                          const Spacer(),
                          Text(
                            '-${cartData?.totalDiscount.toString()}ر.س',
                            style: getHeadlineTextStyle(),
                          )
                        ],
                      ),
                      const Divider(
                        indent: 40,
                        endIndent: 40,
                      ),
                      const Gap(10),
                      Row(
                        children: [
                          Text(
                            'المجموع',
                            style: getHeadlineTextStyle(
                                fontWeight: FontWeight.w900, fontSize: 17.sp),
                          ),
                          const Spacer(),
                          Text(
                            '${cartData?.totalPriceWithVat}ر.س',
                            style: getHeadlineTextStyle(),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              CustomButton1(
                text: 'الانتقال لإتمام الطلب',
                onPressed: () {
                  push(context, const ConfirmOrderScreen());
                },
                radius: 10,
              )
            ],
          ),
        ),
      ),
    );
  }
}
