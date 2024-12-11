import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:t7mara/core/utils/colors.dart';
import 'package:t7mara/core/utils/text.dart';
import 'package:t7mara/core/widgets/custom_icon.dart';
import 'package:t7mara/feature/profile/presentation/bloc/profile_bloc.dart';
import 'package:t7mara/feature/profile/presentation/bloc/profile_event.dart';
import 'package:t7mara/feature/profile/presentation/bloc/profile_state.dart';

class ApplicationDetailScreen extends StatefulWidget {
  const ApplicationDetailScreen({super.key});

  @override
  State<ApplicationDetailScreen> createState() =>
      _ApplicationDetailScreenState();
}

class _ApplicationDetailScreenState extends State<ApplicationDetailScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<ProfileBloc>().add(ShowAbout());
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
            size: 25.h,
          ),
        ),
        title: Text(
          'عن التطبيق',
          style: getHeadlineTextStyle(fontSize: 20.sp),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: BlocBuilder<ProfileBloc, ProfileState>(
          buildWhen: (previous, current) =>
              current is AboutLoadingState || current is AboutLoadedState,
          builder: (context, state) {
            if (state is AboutLoadedState) {
              var itemData =
                  context.read<ProfileBloc>().aboutResponseModel?.data;
              return Column(
                children: [
                  Center(
                      child: SvgPicture.asset(
                    'assets/images/logo.svg',
                    height: 158.h,
                    width: 160.w,
                    fit: BoxFit.cover,
                  )),
                  Expanded(
                      child: HtmlWidget(
                    itemData?.about ?? "",
                    textStyle: getSmallStyle(fontSize: 15),
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
