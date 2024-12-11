import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:t7mara/core/utils/colors.dart';
import 'package:t7mara/core/utils/text.dart';
import 'package:t7mara/core/widgets/custom_icon.dart';
import 'package:t7mara/feature/home/presentation/bloc/home_bloc.dart';
import 'package:t7mara/feature/home/presentation/bloc/home_event.dart';
import 'package:t7mara/feature/home/presentation/bloc/home_state.dart';

class DrinksSectionScreen extends StatefulWidget {
  const DrinksSectionScreen({super.key});
  @override
  State<DrinksSectionScreen> createState() => _DrinksSectionScreenState();
}

class _DrinksSectionScreenState extends State<DrinksSectionScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<HomeBloc>().add(CategoriesDrinksHome());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomIcons(
              icon: const Icon(
                Icons.arrow_back_ios_new,
                color: ColorApp.primary,
              ),
              size: 25.h,
              onPressed: () {
                Navigator.pop(context);
              }),
        ),
        centerTitle: true,
        title: Text(
          'مشروبات',
          style: getHeadlineTextStyle(fontSize: 20.sp),
        ),
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        buildWhen: (previous, current) =>
            current is CategoriesDrinksLoadedState ||
            current is CategoriesDrinksLoadingState,
        builder: (context, state) {
          if (state is CategoriesDrinksLoadedState) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Icon(
                    color: ColorApp.primary,
                    Icons.search,
                    size: 50.h,
                  ),
                ),
                Text(
                  'لا يوجد مشروبات حاليا',
                  style: getHeadlineTextStyle(fontSize: 30.sp),
                )
              ],
            );
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
