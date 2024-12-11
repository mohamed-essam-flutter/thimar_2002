import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:t7mara/core/functions/navigetor.dart';
import 'package:t7mara/core/utils/colors.dart';
import 'package:t7mara/core/utils/text.dart';
import 'package:t7mara/core/widgets/custom_botton.dart';
import 'package:t7mara/core/widgets/map.dart';
import 'package:t7mara/feature/auth/data/models/request/register_params.dart';
import 'package:t7mara/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:t7mara/feature/auth/presentation/bloc/auth_event.dart';
import 'package:t7mara/feature/auth/presentation/bloc/auth_state.dart';

import 'package:t7mara/feature/auth/presentation/page/login.dart';
import 'package:t7mara/feature/auth/presentation/page/pin_code.dart';
import 'package:t7mara/main.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var key = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  String numberPhone = "";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is RegisterLoadedState) {
            pushAndRemoveUntil(
                context,
                PinCodeScreen(
                  numberPhone: numberPhone,
                ));
          } else if (state is RegisterErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("يوجد خطا ف الادخال")));
          }
        },
        builder: (context, state) {
          return Form(
            key: key,
            child: Scaffold(
              bottomNavigationBar: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'لديك حساب بالفعل ؟ ',
                    style: getHeadlineTextStyle(fontWeight: FontWeight.normal),
                  ),
                  TextButton(
                      onPressed: () {
                        pushReplacement(context, const LoginScreen());
                      },
                      child: Text(
                        'تسجيل الدخول',
                        style:
                            getHeadlineTextStyle(fontWeight: FontWeight.bold),
                      ))
                ],
              ),
              body: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.8,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.21,
                              child: Center(
                                  child: SvgPicture.asset(
                                'assets/images/logo.svg',
                                width: 160.w,
                                height: 250.h,
                              )),
                            ),
                            Text(
                              'مرحبا بك مرة أخرى',
                              style: TextStyle(
                                  color: ColorApp.primary,
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.bold),
                            ),
                            const Text(
                              'يمكنك تسجيل حساب جديد الأن',
                              style:
                                  TextStyle(color: ColorApp.gray, fontSize: 24),
                            ),
                            const Gap(25),
                            TextFormField(
                              controller: nameController,
                              decoration: const InputDecoration(
                                  prefixIcon: Icon(Icons.person),
                                  hintText: 'اسم المستخدم'),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "برجاء ادخال الاسم";
                                }
                                return null;
                              },
                            ),
                            Gap(10.h),
                            Row(
                              children: [
                                Container(
                                  decoration: const BoxDecoration(
                                      color: ColorApp.white),
                                  child: Column(
                                    children: [
                                      SvgPicture.asset('assets/icons/flag.svg'),
                                      const Text('+956')
                                    ],
                                  ),
                                ),
                                const Gap(10),
                                Expanded(
                                  child: TextFormField(
                                    controller: phoneController,
                                    decoration: const InputDecoration(
                                        prefixIcon: Icon(Icons.phone),
                                        hintText: 'رقم الجوال'),
                                    validator: (value) {
                                      setState(() {
                                        numberPhone = value.toString();
                                      });
                                      if (value == null || value.isEmpty) {
                                        return "برجاء ادخال رقم الموبايل";
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              ],
                            ),
                            Gap(10.h),
                            TextField(
                              decoration: InputDecoration(
                                  prefixIcon: InkWell(
                                      onTap: ()   {

                                        Permission.location.request().then((value) {
                                           if(value.isGranted){
                                              push(navigatorKey.currentContext!, const MapScreen());
                                               }
                                               },);

                                        // if (await Permission.location.request().isGranted) {
                                        //    push(navigatorKey.currentContext!, const MapScreen());
                                        // }else{
                                        //   AppSettings.openAppSettings(type: AppSettingsType.location).then((value) async {
                                        //     if (await Permission.location.request().isGranted) {
                                        //    push(navigatorKey.currentContext!, const MapScreen());}
                                        //   },);
                                        // }



                                      },
                                      child: Icon(Icons.flag)),
                                  hintText: 'المدينة'),
                            ),
                            Gap(10.h),
                            //    const Gap(10),
                            TextFormField(
                              controller: passwordController,
                              decoration: const InputDecoration(
                                  prefixIcon: Icon(Icons.lock),
                                  hintText: 'كلمة المرور'),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "برجاء ادخال كلمه السر";
                                }
                                return null;
                              },
                            ),
                            Gap(10.h),
                            TextFormField(
                              controller: confirmPasswordController,
                              decoration: const InputDecoration(
                                  prefixIcon: Icon(Icons.lock),
                                  hintText: 'كلمة المرور'),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "برجاء ادخال تاكيد كلمه السر";
                                }
                                return null;
                              },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.1,
                        child: CustomButton1(
                          onPressed: () {
                            if (key.currentState!.validate()) {
                              context.read<AuthBloc>().add(RegisterEvent(
                                  params: RegisterParams(
                                      name: nameController.text,
                                      phone: int.parse(phoneController.text),
                                      password:
                                          int.parse(passwordController.text),
                                      confirmPassword: int.parse(
                                          confirmPasswordController.text))));
                            }
                          },
                          text: 'تسجيل ',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
