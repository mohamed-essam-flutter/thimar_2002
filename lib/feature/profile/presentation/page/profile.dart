import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:t7mara/core/functions/navigetor.dart';
import 'package:t7mara/core/utils/colors.dart';
import 'package:t7mara/core/utils/text.dart';
import 'package:t7mara/feature/auth/presentation/page/login.dart';
import 'package:t7mara/feature/profile/presentation/bloc/profile_bloc.dart';
import 'package:t7mara/feature/profile/presentation/bloc/profile_event.dart';
import 'package:t7mara/feature/profile/presentation/bloc/profile_state.dart';
import 'package:t7mara/feature/profile/presentation/page/address.dart';
import 'package:t7mara/feature/profile/presentation/page/application_detail.dart';
import 'package:t7mara/feature/profile/presentation/page/common_questions.dart';
import 'package:t7mara/feature/profile/presentation/page/contact_us.dart';
import 'package:t7mara/feature/profile/presentation/page/privacy_policy.dart';
import 'package:t7mara/feature/profile/presentation/page/profile_data.dart';
import 'package:t7mara/feature/profile/presentation/page/suggestions_and_complaints.dart';
import 'package:t7mara/feature/profile/presentation/page/terms.dart';
import 'package:t7mara/feature/profile/presentation/page/wallet_detail.dart';
import 'package:t7mara/feature/profile/presentation/widget/custom_profile_card.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<ProfileBloc>().add(ShowProfile());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 217.h,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: ColorApp.primary,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40)),
            ),
            child: BlocConsumer<ProfileBloc, ProfileState>(
              // buildWhen: (previous, current) =>
              //     current is ProfileLoadingState ||
              //     current is ProfileLoadedState ||
              //     current is ProfileErrorState,
              listener: (context, state) {
                if (state is LogOutLoadedState) {
                  pushAndRemoveUntil(context, const LoginScreen());
                }
              },
              builder: (context, state) {
                if (state is ProfileLoadedState) {
                  var itemData = context
                      .read<ProfileBloc>()
                      .showProfileResponseModels
                      ?.data;
                  return Column(
                    children: [
                      const Spacer(
                        flex: 4,
                      ),
                      Text(
                        'حسابي',
                        style: getHeadlineTextStyle(
                            fontSize: 20.sp, color: ColorApp.white),
                      ),
                      const Spacer(
                        flex: 2,
                      ),
                      ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.network(
                            itemData?.image ?? "",
                            width: 76.w,
                            height: 71.h,
                            fit: BoxFit.cover,
                          )),
                      Text(
                        itemData?.fullname ?? "",
                        style: getbodyStyle(color: ColorApp.white),
                      ),
                      Text(
                        itemData?.phone ?? "",
                        style: getbodyStyle(color: ColorApp.white),
                      ),
                      const Spacer(
                        flex: 1,
                      ),
                    ],
                  );
                } else if (state is ProfileLoadingState) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return Center(
                      child: Text(
                    'error',
                    style: getHeadlineTextStyle(),
                  ));
                }
              },
            ),
          ),
          Expanded(
            child: Container(
                padding: EdgeInsets.all(10.w),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        CustomProfileCard(
                          icon: const Icon(
                            Icons.person_2_sharp,
                            color: ColorApp.primary,
                          ),
                          title: 'البيانات الشخصية',
                          onPressed: () {
                            push(context, const ProfileDataScreen());
                          },
                        ),
                        Gap(29.h),
                        CustomProfileCard(
                          icon: const Icon(
                            Icons.wallet_outlined,
                            color: ColorApp.primary,
                          ),
                          title: 'المحفظة',
                          onPressed: () {
                            push(context, const WalletDetailScreen());
                          },
                        ),
                        Gap(29.h),
                        CustomProfileCard(
                          icon: const Icon(
                            Icons.location_on_outlined,
                            color: ColorApp.primary,
                          ),
                          title: 'العناوين',
                          onPressed: () {
                            push(context, const AddressScreen());
                          },
                        ),
                        Gap(29.h),
                        CustomProfileCard(
                          icon: const Icon(
                            Icons.help_outline_sharp,
                            color: ColorApp.primary,
                          ),
                          title: 'أسئلة متكررة',
                          onPressed: () {
                            push(context, const CommonQuestionsScreen());
                          },
                        ),
                        Gap(29.h),
                        CustomProfileCard(
                          icon: const Icon(
                            Icons.verified_user_outlined,
                            color: ColorApp.primary,
                          ),
                          title: 'سياسة الخصوصية',
                          onPressed: () {
                            push(context, const PrivacyPolicyScreen());
                          },
                        ),
                        Gap(29.h),
                        CustomProfileCard(
                          icon: const Icon(
                            Icons.phone_in_talk_outlined,
                            color: ColorApp.primary,
                          ),
                          title: 'تواصل معنا',
                          onPressed: () {
                            push(context, const ContactUsScreen());
                          },
                        ),
                        Gap(29.h),
                        CustomProfileCard(
                          icon: const Icon(
                            Icons.download_for_offline_outlined,
                            color: ColorApp.primary,
                          ),
                          title: 'الشكاوي والأقتراحات',
                          onPressed: () {
                            push(context, const SuggestionsAndComplaints());
                          },
                        ),
                        Gap(29.h),
                        CustomProfileCard(
                          icon: const Icon(
                            Icons.share_outlined,
                            color: ColorApp.primary,
                          ),
                          title: 'مشاركة التطبيق',
                          onPressed: () {},
                        ),
                        Gap(29.h),
                        CustomProfileCard(
                          icon: const Icon(
                            Icons.report_gmailerrorred,
                            color: ColorApp.primary,
                          ),
                          title: 'عن التطبيق',
                          onPressed: () {
                            push(context, const ApplicationDetailScreen());
                          },
                        ),
                        Gap(29.h),
                        CustomProfileCard(
                          icon: const Icon(
                            Icons.language_outlined,
                            color: ColorApp.primary,
                          ),
                          title: 'تغيير اللغة',
                          onPressed: () {},
                        ),
                        Gap(29.h),
                        CustomProfileCard(
                          icon: const Icon(
                            Icons.chat_outlined,
                            color: ColorApp.primary,
                          ),
                          title: 'الشروط والأحكام',
                          onPressed: () {
                            push(context, const TermsScreen());
                          },
                        ),
                        Gap(29.h),
                        CustomProfileCard(
                          icon: const Icon(
                            Icons.star_border_outlined,
                            color: ColorApp.primary,
                          ),
                          title: 'تقييم التطبيق',
                          onPressed: () {},
                        ),
                        Gap(29.h),
                        Row(
                          children: [
                            Expanded(
                                child: Text(
                              'تسجيل الخروج',
                              style: getbodyStyle(),
                            )),
                            IconButton(
                                onPressed: () {
                                  context.read<ProfileBloc>().add(Logout());
                                },
                                icon: const Icon(
                                  Icons.logout_outlined,
                                  color: ColorApp.primary,
                                ))
                          ],
                        )
                      ],
                    ),
                  ),
                )),
          )
        ],
      ),
    );
  }
}
