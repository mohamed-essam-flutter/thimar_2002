import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:t7mara/core/functions/navigetor.dart';
import 'package:t7mara/core/utils/colors.dart';
import 'package:t7mara/core/utils/text.dart';
import 'package:t7mara/feature/home/presentation/bloc/home_bloc.dart';
import 'package:t7mara/feature/home/presentation/bloc/home_state.dart';
import 'package:t7mara/feature/home/presentation/page/sections/drinks_section.dart';
import 'package:t7mara/feature/home/presentation/page/sections/fruits_section.dart';
import 'package:t7mara/feature/home/presentation/page/sections/meals_sections.dart';
import 'package:t7mara/feature/home/presentation/page/sections/vegetables_section.dart';

class ListViewHome extends StatelessWidget {
  const ListViewHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      buildWhen: (previous, current) =>
          current is CategoriesLoadedState || current is CategoriesLoadingState,
      builder: (context, state) {
        if (state is CategoriesLoadedState) {
          log('mmmmm');
          var categoriesItem =
              context.read<HomeBloc>().categoriesHomeResponseModel?.data;

          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categoriesItem?.length,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: [
                  InkWell(
                    onTap: () {
                      if (index == 0) {
                        push(context, const FruitsSectionScreen());
                      } else if (index == 1) {
                        push(context, const VegetablesSectionScreen());
                      }
                      if (index == 2) {
                        push(context, const MealsSectionScreen());
                      } else if (index == 3) {
                        push(context, const DrinksSectionScreen());
                      }
                    },
                    child: Container(
                      height: 73.h,
                      width: 73.w,
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: ColorApp.gray),
                      child: Image.network(
                        categoriesItem?[index].media ?? "",
                        width: 43,
                        height: 43,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Text(
                    categoriesItem?[index].name ?? "",
                    style: getHeadlineTextStyle(color: ColorApp.black),
                  )
                ],
              );
            },
          );
        } else {
          log('sssssss');
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
