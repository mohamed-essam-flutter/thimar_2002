import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:t7mara/core/utils/colors.dart';
import 'package:t7mara/core/utils/text.dart';
import 'package:t7mara/core/widgets/custom_botton.dart';
import 'package:t7mara/core/widgets/custom_icon.dart';
import 'package:t7mara/feature/profile/data/model/request/suggestions_params.dart';
import 'package:t7mara/feature/profile/presentation/bloc/profile_bloc.dart';
import 'package:t7mara/feature/profile/presentation/bloc/profile_event.dart';
import 'package:t7mara/feature/profile/presentation/bloc/profile_state.dart';

class SuggestionsAndComplaints extends StatefulWidget {
  const SuggestionsAndComplaints({super.key});

  @override
  State<SuggestionsAndComplaints> createState() =>
      _SuggestionsAndComplaintsState();
}

class _SuggestionsAndComplaintsState extends State<SuggestionsAndComplaints> {
  var key = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var contentController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: key,
      child: Scaffold(
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
            'الأقتراحات والشكاوي',
            style: getHeadlineTextStyle(fontSize: 20.sp),
          ),
          centerTitle: true,
        ),
        body: BlocConsumer<ProfileBloc, ProfileState>(
          listener: (context, state) {
            if (state is SuggestionAndComplaintsLoadedState) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(
                'تم اضافه الشكوي',
                style: getHeadlineTextStyle(),
              )));
            }
          },
          // buildWhen: (previous, current) =>
          //     current is SuggestionAndComplaintsLoadedState ||
          //     current is SuggestionAndComplaintsLoadingState,

          builder: (context, state) {
            return Padding(
              padding: EdgeInsets.only(top: 48.h, right: 16.w, left: 16.w),
              child: Column(
                children: [
                  TextFormField(
                    controller: nameController,
                    decoration: const InputDecoration(hintText: 'الإسم'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'رجاء ادخال الاسم';
                      }
                      return null;
                    },
                  ),
                  Gap(5.h),
                  TextFormField(
                    controller: phoneController,
                    decoration: const InputDecoration(hintText: 'رقم الموبايل'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'رجاء ادخال رقم الهاتف';
                      }
                      return null;
                    },
                  ),
                  Gap(5.h),
                  Container(
                    height: 110.h,
                    decoration: BoxDecoration(
                        color: ColorApp.black,
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      children: [
                        Expanded(
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'رجاء ادخال المحتوي';
                              }
                              return null;
                            },
                            controller: contentController,
                            expands: true,
                            maxLines: null,
                            minLines: null,
                            decoration: const InputDecoration(
                              hintText: 'الموضوع',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Gap(22.h),
                  CustomButton1(
                    text: 'إرسال',
                    onPressed: () {
                      if (key.currentState!.validate()) {
                        context.read<ProfileBloc>().add(
                            SuggestionsAndComplaintsEvent(
                                params: SuggestionsParams(
                                    name: nameController.text,
                                    phone: phoneController.text,
                                    content: contentController.text)));
                      }
                    },
                    radius: 15,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
