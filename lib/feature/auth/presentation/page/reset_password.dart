import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:t7mara/core/functions/navigetor.dart';
import 'package:t7mara/core/utils/colors.dart';
import 'package:t7mara/core/utils/text.dart';
import 'package:t7mara/core/widgets/custom_botton.dart';
import 'package:t7mara/feature/auth/presentation/page/pin_code.dart';
import 'package:t7mara/feature/auth/presentation/page/register.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Padding(
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
                'أدخل كلمة المرور الجديدة',
                style: TextStyle(color: ColorApp.primary, fontSize: 24),
              ),
              const Gap(25),
              const TextField(
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock_open_sharp),
                    hintText: 'كلمه المرور'),
              ),
              const Gap(16),
              const TextField(
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock_open_sharp),
                    hintText: 'كلمه المرور'),
              ),
              const Gap(24),
              CustomButton1(
                onPressed: () {
                  pushAndRemoveUntil(
                      context,
                      const PinCodeScreen(
                        numberPhone: "",
                      ));
                },
                text: 'تأكيد رقم الجوال',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
