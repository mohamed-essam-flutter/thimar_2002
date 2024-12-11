import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:t7mara/core/utils/colors.dart';
import 'package:t7mara/core/utils/text.dart';
import 'package:t7mara/feature/profile/presentation/bloc/profile_bloc.dart';
import 'package:t7mara/feature/profile/presentation/bloc/profile_event.dart';
import 'package:t7mara/feature/profile/presentation/bloc/profile_state.dart';

class CommonQuestionsScreen extends StatefulWidget {
  const CommonQuestionsScreen({super.key});

  @override
  State<CommonQuestionsScreen> createState() => _CommonQuestionsScreenState();
}

class _CommonQuestionsScreenState extends State<CommonQuestionsScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<ProfileBloc>().add(ShowFaqs());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(10.0),
          child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: SvgPicture.asset(
                'assets/icons/arrow_back.svg',
                height: 20.h,
                width: 20.w,
                fit: BoxFit.contain,
              )),
        ),
        title: Text(
          'الاسئله المتكرره',
          style: getHeadlineTextStyle(fontSize: 20.sp),
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<ProfileBloc, ProfileState>(
        buildWhen: (previous, current) =>
            current is FaqsLoadedState || current is FaqsLoadingState,
        builder: (context, state) {
          if (state is FaqsLoadedState) {
            log('00000');
            var itemData =
                context.read<ProfileBloc>().showFaqsResponseModels?.data;
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: itemData?.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ExpansionTile(
                        trailing: const Icon(
                          Icons.arrow_downward_outlined,
                          color: ColorApp.primary,
                        ),
                        title: Text(
                          itemData?[index].question ?? "",
                          style: getHeadlineTextStyle(),
                        ),
                        children: [
                          Text(
                            itemData?[index].answer ?? "",
                            style: getHeadlineTextStyle(),
                          )
                        ],
                      );
                    },
                  ),
                )
              ],
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
