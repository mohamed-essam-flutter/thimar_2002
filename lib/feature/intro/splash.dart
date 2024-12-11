import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:t7mara/core/functions/navigetor.dart';
import 'package:t7mara/feature/auth/presentation/page/login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 3),
      () {
        pushAndRemoveUntil(context, const LoginScreen());
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: SvgPicture.asset(
              'assets/images/logo.svg',
              width: 160,
              height: 250,
            ),
          ),
        ],
      ),
    );
  }
}
