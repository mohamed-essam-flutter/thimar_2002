import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:t7mara/core/functions/navigetor.dart';
import 'package:t7mara/core/utils/colors.dart';
import 'package:t7mara/core/utils/text.dart';
import 'package:t7mara/core/widgets/custom_botton.dart';
import 'package:t7mara/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:t7mara/feature/auth/presentation/bloc/auth_event.dart';
import 'package:t7mara/feature/auth/presentation/bloc/auth_state.dart';
import 'package:t7mara/feature/auth/presentation/page/register.dart';
import 'package:t7mara/feature/auth/presentation/page/reset_password.dart';
import 'package:t7mara/feature/auth/presentation/widget/timer.dart';

class PinCodeScreen extends StatefulWidget {
  const PinCodeScreen({super.key, required this.numberPhone});
  final String numberPhone;

  @override
  State<PinCodeScreen> createState() => _PinCodeScreenState();
}

class _PinCodeScreenState extends State<PinCodeScreen> {
  var pinController = TextEditingController();
  var key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: key,
      child: Scaffold(
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
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
            if (state is CheckCodeLoadedState) {
              pushAndRemoveUntil(context, const ResetPasswordScreen());
            }
          },
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                        child: SvgPicture.asset(
                      'assets/images/logo.svg',
                      width: 160,
                      height: 250,
                    )),
                    const Text(
                      'نسيت كلمة المرور',
                      style: TextStyle(
                          color: ColorApp.primary,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      'أدخل الكود المكون من 4 أرقام المرسل علي رقم الجوال ',
                      style: TextStyle(color: ColorApp.primary, fontSize: 18),
                    ),
                    Row(
                      children: [
                        Text(
                          '+${widget.numberPhone}',
                          style: const TextStyle(
                              color: ColorApp.primary, fontSize: 18),
                        ),
                        TextButton(
                            onPressed: () {},
                            child: const Text(
                              'تغيير رقم الجوال',
                              style: TextStyle(
                                  color: ColorApp.primary,
                                  fontSize: 18,
                                  decoration: TextDecoration.underline),
                            ))
                      ],
                    ),
                    const Gap(25),
                    PinCodeTextField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'رجاء ادخال الكود';
                        }
                        return null;
                      },
                      controller: pinController,
                      cursorColor: ColorApp.white,
                      appContext: context,
                      length: 4,
                      obscureText: false,
                      animationType: AnimationType.fade,
                      pinTheme: PinTheme(
                        errorBorderColor: ColorApp.black,
                        inactiveColor: ColorApp.primary,
                        inactiveFillColor: ColorApp.white,
                        activeColor: ColorApp.white,
                        selectedColor: ColorApp.gray,
                        selectedFillColor: ColorApp.white,
                        shape: PinCodeFieldShape.box,
                        borderRadius: BorderRadius.circular(5),
                        fieldHeight: 50,
                        fieldWidth: 40,
                        activeFillColor: Colors.white,
                      ),
                      animationDuration: const Duration(milliseconds: 300),
                      backgroundColor: ColorApp.white,
                      enableActiveFill: true,
                      onCompleted: (v) {
                        print("Completed");
                      },
                      beforeTextPaste: (text) {
                        print("Allowing to paste $text");
                        //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                        //but you can show anything you want here, like your pop up saying wrong paste format or etc
                        return true;
                      },
                    ),
                    const Gap(24),
                    CustomButton1(
                      onPressed: () {
                        if (key.currentState!.validate()) {
                          context.read<AuthBloc>().add(CheckCodeEvent(
                              code: pinController.text,
                              phone: widget.numberPhone));
                        }
                      },
                      text: 'تأكيد رقم الجوال',
                    ),
                    Center(
                      child: Column(
                        children: [
                          Text(
                            'لم تستلم الكود ؟',
                            style: getHeadlineTextStyle(
                                fontWeight: FontWeight.normal),
                          ),
                          Text(
                            ' يمكنك إعادة إرسال الكود بعد',
                            style: getHeadlineTextStyle(
                                fontWeight: FontWeight.normal),
                          ),
                          const CustomTimer(),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    side: const BorderSide(
                                        color: ColorApp.primary),
                                    borderRadius: BorderRadius.circular(5))),
                            child: Text(
                              'إعادة الإرسال',
                              style: getHeadlineTextStyle(),
                            ),
                          )
                        ],
                      ),
                    ),
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
