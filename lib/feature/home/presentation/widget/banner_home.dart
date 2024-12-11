import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:t7mara/core/utils/colors.dart';
import 'package:t7mara/feature/home/presentation/bloc/home_bloc.dart';
import 'package:t7mara/feature/home/presentation/bloc/home_state.dart';

class BannerHomeScreen extends StatefulWidget {
  const BannerHomeScreen({super.key});

  @override
  State<BannerHomeScreen> createState() => _BannerHomeState();
}

class _BannerHomeState extends State<BannerHomeScreen> {
  int initialPage = 0;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      buildWhen: (previous, current) =>
          current is BannerLoadedState || current is BannerLoadingState,
      builder: (context, state) {
        if (state is BannerLoadedState) {
          var banner = context.read<HomeBloc>().bannerHomeResponseModel?.data;
          return Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: 130.h,
                child: CarouselSlider.builder(
                  options: CarouselOptions(
                    onPageChanged: (value, reason) {
                      setState(() {
                        initialPage = value;
                      });
                    },
                    // height: 320.h,
                    viewportFraction: 0.999,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    enlargeCenterPage: true,
                    enlargeFactor: 0.2,
                    scrollDirection: Axis.horizontal,
                  ),
                  itemCount: banner?.length,
                  itemBuilder: (BuildContext context, int itemIndex,
                          int pageViewIndex) =>
                      ClipRRect(
                          borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20)),
                          child: SizedBox(
                            height: 120,
                            child: Image.network(
                              banner?[initialPage].media ?? "",
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
                          )),
                ),
              ),
              Gap(5.h),
              Center(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 5.h),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: ColorApp.gray),
                  child: SmoothPageIndicator(
                      controller: PageController(
                          initialPage: initialPage), // PageController
                      count: banner?.length ?? 0,
                      effect: const WormEffect(
                          activeDotColor:
                              ColorApp.white), // your preferred effect
                      onDotClicked: (index) {
                        initialPage = index;
                      }),
                ),
              ),
            ],
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
