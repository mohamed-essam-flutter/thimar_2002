import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:t7mara/core/functions/navigetor.dart';
import 'package:t7mara/core/utils/colors.dart';
import 'package:t7mara/core/utils/text.dart';
import 'package:t7mara/core/widgets/custom_botton.dart';
import 'package:t7mara/core/widgets/navigation_bar.dart';
import 'package:t7mara/feature/auth/data/models/request/login_params.dart';
import 'package:t7mara/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:t7mara/feature/auth/presentation/bloc/auth_event.dart';
import 'package:t7mara/feature/auth/presentation/bloc/auth_state.dart';
import 'package:t7mara/feature/auth/presentation/page/forgot_password.dart';
import 'package:t7mara/feature/auth/presentation/page/register.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var key = GlobalKey<FormState>();
  var phoneController = TextEditingController();
  var passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    dynamic size = MediaQuery.of(context).size;
    double height = size.height;
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is LoginLoadedState) {
          pushAndRemoveUntil(context, const NavigationBarScreen());
        } else if (state is LoginErrorState) {
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
                  'ليس لديك حساب ؟ ',
                  style: getHeadlineTextStyle(fontWeight: FontWeight.normal),
                ),
                TextButton(
                    onPressed: () {
                      pushReplacement(context, const RegisterScreen());
                    },
                    child: Text(
                      'تسجيل الأن',
                      style: getHeadlineTextStyle(fontWeight: FontWeight.bold),
                    ))
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: height * 0.3,
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
                          fontSize: 24.sp,
                          fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      'يمكنك تسجيل الدخول الأن',
                      style: TextStyle(color: ColorApp.primary, fontSize: 24),
                    ),
                    const Gap(10),
                    Row(
                      children: [
                        Container(
                          decoration:
                              const BoxDecoration(color: ColorApp.white),
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
                                prefixIcon: Icon(Icons.person),
                                hintText: 'رقم الجوال'),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "برجاء ادخال رقم الموبايل";
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                    const Gap(10),
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
                    Align(
                      alignment: AlignmentDirectional.centerEnd,
                      child: TextButton(
                        onPressed: () {
                          pushReplacement(
                              context, const ForgotPasswordScreen());
                        },
                        child: Text(
                          'نسيت كلمة المرور ؟',
                          style: getHeadlineTextStyle(),
                        ),
                      ),
                    ),
                    const Gap(30),
                    state is LoginLoadingState
                        ? const Center(child: CircularProgressIndicator())
                        : CustomButton1(
                            onPressed: () {
                              if (key.currentState!.validate()) {
                                context.read<AuthBloc>().add(LoginEvent(
                                    params: LoginParams(
                                        deviceToken: "test",
                                        phone: int.parse(phoneController.text),
                                        password:
                                            int.parse(passwordController.text),
                                        type: "ios",
                                        userType: "client")));
                              }
                            },
                            text: 'تسجيل الدخول',
                          ),
                    const Gap(30),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
