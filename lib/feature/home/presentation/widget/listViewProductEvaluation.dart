import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:t7mara/core/utils/colors.dart';
import 'package:t7mara/core/utils/text.dart';
import 'package:t7mara/feature/home/presentation/bloc/home_bloc.dart';
import 'package:t7mara/feature/home/presentation/bloc/home_state.dart';

class ListViewProductEvaluation extends StatelessWidget {
  const ListViewProductEvaluation({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      buildWhen: (previous, current) =>
          current is ProductEvaluationLoadedState ||
          current is ProductEvaluationLoadingState,
      builder: (context, state) {
        if (state is ProductEvaluationLoadedState) {
          var productEvaluationItem = context
              .read<HomeBloc>()
              .listViewProductEvaluationResponseModel
              ?.data;
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 3,
            itemBuilder: (BuildContext context, int index) {
              return SizedBox(
                height: 90,
                width: 270,
                child: Card(
                  child: ListTile(
                      title: SizedBox(
                        height: 20.h,
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                productEvaluationItem?[index].clientImage ?? "",
                                style:
                                    getHeadlineTextStyle(color: ColorApp.black),
                              ),
                            ),
                            StarRating(
                              rating: (productEvaluationItem?[index].value ?? 0)
                                  .toDouble(),
                              size: 15,
                            ),
                          ],
                        ),
                      ),
                      subtitle:
                          Text(productEvaluationItem?[index].comment ?? ""),
                      trailing: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Image.network(
                            productEvaluationItem?[index].clientImage ?? ""),
                      )),
                ),
              );
            },
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
