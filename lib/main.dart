import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:t7mara/core/services/dio.dart';
import 'package:t7mara/core/services/local_storage_application.dart';
import 'package:t7mara/core/utils/colors.dart';
import 'package:t7mara/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:t7mara/feature/cart/presentation/bloc/cart_bloc.dart';
import 'package:t7mara/feature/confirmOrder/presentation/bloc/order_bloc.dart';
import 'package:t7mara/feature/favorite/presentation/bloc/bloc/favorite_bloc.dart';
import 'package:t7mara/feature/home/presentation/bloc/home_bloc.dart';
import 'package:t7mara/feature/intro/splash.dart';
import 'package:t7mara/feature/profile/presentation/bloc/profile_bloc.dart';
import 'package:t7mara/firebase_options.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);

  await LocalStorage.init();
  await DioProvider.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc(),
        ),
        BlocProvider(
          create: (context) => HomeBloc(),
        ),
        BlocProvider(
          create: (context) => FavoriteBloc(),
        ),
        BlocProvider(
          create: (context) => ProfileBloc(),
        ),
        BlocProvider(
          create: (context) => CartBloc(),
        ),
        BlocProvider(
          create: (context) => OrderBloc(),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) => MaterialApp(
          navigatorKey: navigatorKey,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              fontFamily: 'Tajawal',
              scaffoldBackgroundColor: ColorApp.white,
              inputDecorationTheme: const InputDecorationTheme(
                  fillColor: ColorApp.white,
                  filled: true,
                  hintStyle: TextStyle(
                    fontSize: 15,
                    color: ColorApp.black,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    borderSide: BorderSide(color: Color(0xffDCDCDC)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    borderSide: BorderSide(color: Color(0xffDCDCDC)),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    borderSide: BorderSide(color: Color(0xffDCDCDC)),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    borderSide: BorderSide(color: Color(0xffDCDCDC)),
                  ))),
          home: const SplashScreen(),
          builder: (context, child) {
            return Directionality(
                textDirection: TextDirection.rtl, child: child!);
          },
        ),
      ),
    );
  }
}
