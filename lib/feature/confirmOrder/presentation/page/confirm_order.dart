import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:t7mara/core/functions/navigetor.dart';
import 'package:t7mara/core/utils/colors.dart';
import 'package:t7mara/core/utils/text.dart';
import 'package:t7mara/core/widgets/custom_botton.dart';
import 'package:t7mara/core/widgets/custom_icon.dart';
import 'package:t7mara/feature/confirmOrder/presentation/bloc/order_bloc.dart';
import 'package:t7mara/feature/confirmOrder/presentation/bloc/order_event.dart';
import 'package:t7mara/feature/confirmOrder/presentation/bloc/order_state.dart';
import 'package:t7mara/feature/confirmOrder/presentation/page/fatoorah.dart';
import 'package:t7mara/feature/confirmOrder/presentation/page/saved_card.dart';
class ConfirmOrderScreen extends StatefulWidget {
  const ConfirmOrderScreen({super.key});

  @override
  State<ConfirmOrderScreen> createState() => _ConfirmOrderScreenState();
}

class _ConfirmOrderScreenState extends State<ConfirmOrderScreen> {
  var timeController = TextEditingController();
  var dateController = TextEditingController();
  String? title;
  String date = DateFormat('y-mm-dd').format(DateTime.now());
  String time = DateFormat("hh:mm").format(DateTime.now());
  int cheekColorBorder = 0;
  @override
  Widget build(BuildContext context) {
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
                Navigator.pop(context);
              },
              size: 25.h,
            ),
          ),
          title: Text(
            'إتمام الطلب',
            style: getHeadlineTextStyle(fontSize: 20.sp),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(right: 16, left: 20),
            child: BlocConsumer<OrderBloc, OrderState>(
              listener: (context, state) {
                // TODO: implement listener
                if(state is ConfirmOrderLoadedState){
                  push(context, const SavedCardScreen());
                }
              },
              builder: (context, state) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Gap(20.h),
                    Row(
                      children: [
                        Text(
                          'الاسم:',
                          style: getHeadlineTextStyle(fontSize: 17.sp),
                        ),
                        Gap(10.w),
                        Expanded(
                            child: Text(
                          'محمد',
                          style: getHeadlineTextStyle(fontSize: 17.sp),
                        )),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          'الجوال :',
                          style: getHeadlineTextStyle(fontSize: 17.sp),
                        ),
                        Gap(10.w),
                        Text(
                          '05068285914',
                          style: getHeadlineTextStyle(fontSize: 17.sp),
                        ),
                      ],
                    ),
                    const Gap(30),
                    Row(
                      children: [
                        Expanded(
                            child: Text(
                          'اختر عنوان التوصيل',
                          style: getHeadlineTextStyle(fontSize: 17.sp),
                        )),
                        IconButton.outlined(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.add,
                            color: ColorApp.primary,
                          ),
                          style: const ButtonStyle(
                              backgroundColor:
                                  WidgetStatePropertyAll(Color(0xffE8EFE0)),
                              shape: WidgetStatePropertyAll(
                                RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15))),
                              )),
                        )
                      ],
                    ),
                    Container(
                      width: double.infinity,
                      height: 33.h,
                      padding:
                          EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border:
                              Border.all(color: ColorApp.primary, width: 2)),
                      child: DropdownButton<String>(
                          isDense: true,
                          value: title,
                          isExpanded: true,
                          items: [
                            DropdownMenuItem(
                                value: 'المنزل : 119 طريق الملك عبدالعزيز',
                                child: Text(
                                  'المنزل : 119 طريق الملك عبدالعزيز',
                                  style: getHeadlineTextStyle(),
                                ))
                          ],
                          onChanged: (value) {
                            setState(() {
                              title = value;
                            });
                          }),
                    ),
                    const Gap(40),
                    Text(
                      'تحديد وقت التوصيل',
                      style: getHeadlineTextStyle(fontSize: 17.sp),
                    ),
                    SizedBox(
                      height: 60.h,
                      width: double.infinity,
                      child: Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: dateController,
                              onTap: () {
                                showDatePicker(
                                        initialDate: DateTime.now(),
                                        context: context,
                                        firstDate: DateTime.now(),
                                        lastDate: DateTime(2080))
                                    .then(

                                  (value) {
                                    setState(() {
                                      if (value != null) {
                                        date = DateFormat('y-MM-dd').format(value);
                                        log(date);
                                        setState(() {});
                                      }
                                    });
                                  },
                                );
                              },
                              readOnly: true,
                              decoration: InputDecoration(
                                  suffixIcon: const Icon(
                                    Icons.access_time,
                                    color: ColorApp.primary,
                                  ),
                                  hintText: date,
                                  hintStyle: getHeadlineTextStyle(),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10))),
                            ),
                          ),
                          Expanded(
                            child: TextFormField(
                              onTap: () {
                                showTimePicker(
                                        context: context,
                                        initialTime: TimeOfDay.now())
                                    .then(
                                  (value) {
                                    if (value != null) {
                                      time = DateFormat('hh:mm')
                                          .format(value as DateTime);
                                      log(time);
                                      setState(() {});
                                    }
                                  },
                                );
                              },
                              readOnly: true,
                              decoration: InputDecoration(
                                  suffixIcon: const Icon(
                                    Icons.date_range,
                                    color: ColorApp.primary,
                                  ),
                                  hintText: time,
                                  hintStyle: getHeadlineTextStyle(),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10))),
                            ),
                          )
                        ],
                      ),
                    ),
                    Text(
                      'ملاحظات وتعليمات',
                      style: getHeadlineTextStyle(fontSize: 17.sp),
                    ),
                    Container(
                      width: double.infinity,
                      height: 115.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: const Color(0xffE5E5E5))),
                      child: SizedBox(
                        height: 115.h,
                        child: TextFormField(),
                      ),
                    ),
                    Text(
                      'اختر طريقة الدفع',
                      style: getHeadlineTextStyle(fontSize: 17.sp),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                cheekColorBorder = 0;
                              });
                            },
                            child: Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12),
                              // width: 103.w,
                              height: 50.h,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      color: cheekColorBorder == 0
                                          ? ColorApp.primary
                                          : ColorApp.border,
                                      width: 2.w)),
                              child: Row(
                                children: [
                                  SvgPicture.asset('assets/icons/cach.svg'),
                                  Gap(6.w),
                                  Text(
                                    'كاش',
                                    style:
                                        getHeadlineTextStyle(fontSize: 15.sp),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Gap(15.w),
                        Expanded(
                          child: InkWell(
                            onTap: () async {
                              // ignore: unused_local_variable
                            //  final result=await 
                              
                              push(context, PaymentMyFatoorah(amount: 100,onSuccess: (transId){
                                 log(' -=--=-=-==--==- $transId');
                              },));
                             
                              setState(() {
                                cheekColorBorder = 1;
                              });
                            //   log('hhhhhhhhhh$result');
                              // var response = await MyFatoorah.startPayment(
                              //   context: context,
                              //   request: MyfatoorahRequest.test(
                              //   currencyIso: Country.SaudiArabia,
                              //   successUrl: 'https://www.facebook.com',
                              //   errorUrl: 'https://www.google.com/',
                              //   invoiceAmount: 100,
                              //   language: ApiLanguage.English,
                              //   token:
                              //  'rLtt6JWvbUHDDhsZnfpAhpYk4dxYDQkbcPTyGaKp2TYqQgG7FGZ5Th_WD53Oq8Ebz6A53njUoo1w3pjU1D4vs_ZMqFiz_j0urb_BH9Oq9VZoKFoJEDAbRZepGcQanImyYrry7Kt6MnMdgfG5jn4HngWoRdKduNNyP4kzcp3mRv7x00ahkm9LAK7ZRieg7k1PDAnBIOG3EyVSJ5kK4WLMvYr7sCwHbHcu4A5WwelxYK0GMJy37bNAarSJDFQsJ2ZvJjvMDmfWwDVFEVe_5tOomfVNt6bOg9mexbGjMrnHBnKnZR1vQbBtQieDlQepzTZMuQrSuKn-t5XZM7V6fCW7oP-uXGX-sMOajeX65JOf6XVpk29DP6ro8WTAflCDANC193yof8-f5_EYY-3hXhJj7RBXmizDpneEQDSaSz5sFk0sV5qPcARJ9zGG73vuGFyenjPPmtDtXtpx35A-BVcOSBYVIWe9kndG3nclfefjKEuZ3m4jL9Gg1h2JBvmXSMYiZtp9MR5I6pvbvylU_PP5xJFSjVTIz7IQSjcVGO41npnwIxRXNRxFOdIUHn0tjQ-7LwvEcTXyPsHXcMD8WtgBh-wxR8aKX7WPSsT1O8d8reb2aR7K3rkV3K82K_0OgawImEpwSvp9MNKynEAJQS6ZHe_J_l77652xwPNxMRTMASk1ZsJL',
                              // ),
                              // );
                              // log(response.paymentId.toString());
                            },
                            child: Container(
                      
                              height: 50.h,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      color: cheekColorBorder == 1
                                          ? ColorApp.primary
                                          : ColorApp.border,
                                      width: 2.w)),
                              child: Center(
                                  child: SvgPicture.asset(
                                'assets/icons/visa.svg',
                                height: 20.h,
                              )),
                            ),
                          ),
                        ),
                        Gap(15.w),
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                cheekColorBorder = 2;
                              });
                            },
                            child: Container(
                              
                              height: 50.h,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      color: cheekColorBorder == 2
                                          ? ColorApp.primary
                                          : ColorApp.border,
                                      width: 2.w)),
                              child: Center(
                                  child: SvgPicture.asset(
                                'assets/icons/master_card.svg',
                                height: 34.h,
                              )),
                            ),
                          ),
                        )
                      ],
                    ),
                    Text(
                      'ملخص الطلب',
                      style: getHeadlineTextStyle(fontSize: 17.sp),
                    ),
                    Container(
                        height: 140.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: ColorApp.containerColor),
                        child: Column(
                          children: [
                            CustomButton1(
                              text: 'إنهاء الطلب',
                              onPressed: () {
                                context.read<OrderBloc>().add(ConfirmOrderEvent(
                                  date: date,
                                   time: time,
                                    addressId: '1570',
                                     payType: 'cash'));
                              },
                              radius: 16,
                            ),
                            Gap(12.h),
                            Row(
                              children: [
                                Expanded(
                                    child: Text(
                                  'الخصم',
                                  style: getHeadlineTextStyle(),
                                )),
                                Text(
                                  '-40رس',
                                  style: getHeadlineTextStyle(),
                                )
                              ],
                            ),
                            const Divider(),
                            Row(
                              children: [
                                Expanded(
                                    child: Text(
                                  'المجموع',
                                  style: getHeadlineTextStyle(
                                      fontWeight: FontWeight.w900),
                                )),
                                Text(
                                  '180رس',
                                  style: getHeadlineTextStyle(
                                      fontWeight: FontWeight.w900),
                                )
                              ],
                            )
                          ],
                        ))
                  ],
                );
              },
            ),
          ),
        ));
  }
}
