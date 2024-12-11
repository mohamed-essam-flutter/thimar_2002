import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:t7mara/core/utils/colors.dart';
import 'package:t7mara/core/utils/text.dart';
import 'package:t7mara/core/widgets/custom_icon.dart';
import 'package:t7mara/feature/profile/presentation/bloc/profile_bloc.dart';
import 'package:t7mara/feature/profile/presentation/bloc/profile_event.dart';
import 'package:t7mara/feature/profile/presentation/bloc/profile_state.dart';

class TermsScreen extends StatefulWidget {
  const TermsScreen({super.key});

  @override
  State<TermsScreen> createState() => _TermsScreenState();
}

class _TermsScreenState extends State<TermsScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<ProfileBloc>().add(ShowTerms());
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
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        title: Text(
          'الشروط والاحكام',
          style: getHeadlineTextStyle(fontSize: 20.sp),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 13.w, right: 13.w, top: 42.h),
        child: BlocBuilder<ProfileBloc, ProfileState>(
          buildWhen: (previous, current) =>
              current is TermsLoadedState || current is TermsLoadingState,
          builder: (context, state) {
            if (state is TermsLoadedState) {
              var itemData =
                  context.read<ProfileBloc>().showTermsResponseModel?.data;
              return Column(
                children: [
                  Expanded(
                      child: HtmlWidget(
                    itemData?.terms ?? "",
                    textStyle: getHeadlineTextStyle(),
                  ))
                ],
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
