import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:t7mara/core/functions/navigetor.dart';
import 'package:t7mara/core/utils/colors.dart';
import 'package:t7mara/core/utils/text.dart';
import 'package:t7mara/core/widgets/custom_botton.dart';
import 'package:t7mara/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:t7mara/feature/auth/presentation/bloc/auth_event.dart';
import 'package:t7mara/feature/auth/presentation/bloc/auth_state.dart';
import 'package:t7mara/feature/auth/presentation/page/pin_code.dart';
import 'package:t7mara/feature/auth/presentation/page/register.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});
  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  var key = GlobalKey<FormState>();
  var phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: key,
      child: Scaffold(
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'لديك حساب بالفعل ؟ ',
                style: getHeadlineTextStyle(fontWeight: FontWeight.normal),
              ),
              TextButton(
                  onPressed: () {
                    pushReplacement(context, const RegisterScreen());
                  },
                  child: Text(
                    'تسجيل الدخول',
                    style: getHeadlineTextStyle(fontWeight: FontWeight.bold),
                  ))
            ],
          ),
        ),
        body: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is ForgotPasswordLoadedState) {
              pushAndRemoveUntil(
                  context,
                  PinCodeScreen(
                    numberPhone: phoneController.text,
                  ));
            }
          },
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.3,
                      child: Center(
                          child: SvgPicture.asset(
                        'assets/images/logo.svg',
                        width: 130.w,
                        height: 200.h,
                      )),
                    ),
                    const Text(
                      'نسيت كلمة المرور',
                      style: TextStyle(
                          color: ColorApp.primary,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      'أدخل رقم الجوال المرتبط بحسابك',
                      style: TextStyle(color: ColorApp.primary, fontSize: 24),
                    ),
                    const Gap(25),
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
                                prefixIcon: Icon(Icons.phone),
                                hintText: 'رقم الجوال'),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'رجاء ادخال رقم الهاتف';
                              } else if (value.length < 11) {
                                return 'الرقم غير صحيح';
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                    const Gap(24),
                    state is ForgotPasswordLoadingState
                        ? const Center(child: CircularProgressIndicator())
                        : CustomButton1(
                            onPressed: () {
                              if (key.currentState!.validate()) {
                                context.read<AuthBloc>().add(
                                    ForgotPasswordEvent(
                                        phone: phoneController.text));
                              }
                            },
                            text: 'تأكيد رقم الجوال',
                          )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
