import 'package:bloc/bloc.dart';
import 'package:t7mara/feature/profile/data/model/response/about_response_model/about_response_model.dart';
import 'package:t7mara/feature/profile/data/model/response/show_faqs_response_models/show_faqs_response_models.dart';
import 'package:t7mara/feature/profile/data/model/response/show_policy_response_models/show_policy_response_models.dart';
import 'package:t7mara/feature/profile/data/model/response/show_profile_response_models/show_profile_response_models.dart';
import 'package:t7mara/feature/profile/data/model/response/show_terms_response_model/show_terms_response_model.dart';
import 'package:t7mara/feature/profile/data/repo/profile_repo.dart';
import 'package:t7mara/feature/profile/presentation/bloc/profile_event.dart';
import 'package:t7mara/feature/profile/presentation/bloc/profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitial()) {
    //
    on<ShowProfile>(showProfile);
    on<ShowPolicy>(showPolicy);
    on<ShowAbout>(showAbout);
    on<ShowTerms>(showTerms);
    on<ShowFaqs>(showFaqs);
    on<Logout>(logout);
    on<SuggestionsAndComplaintsEvent>(showSuggestion);
  }
  ShowPolicyResponseModels? showPolicyResponseModels;
  ShowProfileResponseModels? showProfileResponseModels;
  AboutResponseModel? aboutResponseModel;
  ShowTermsResponseModel? showTermsResponseModel;
  ShowFaqsResponseModels? showFaqsResponseModels;
  //profile

  Future<void> showProfile(
      ShowProfile event, Emitter<ProfileState> emit) async {
    emit(ProfileLoadingState());
    //api
    await ProfileRepo.showProfileRepo().then(
      (value) {
        if (value != null) {
          showProfileResponseModels = value;
          emit(ProfileLoadedState());
        } else {
          emit(ProfileErrorState());
        }
      },
    );
  }

  //policy

  Future<void> showPolicy(ShowPolicy event, Emitter<ProfileState> emit) async {
    emit(PolicyLoadingState());
    //api
    await ProfileRepo.showPolicyRepo().then(
      (value) {
        if (value != null) {
          showPolicyResponseModels = value;
          emit(PolicyLoadedState());
        } else {
          emit(PolicyErrorState());
        }
      },
    );
  }

  Future<void> showAbout(ShowAbout event, Emitter<ProfileState> emit) async {
    emit(AboutLoadingState());
    //api
    await ProfileRepo.showAboutRepo().then(
      (value) {
        if (value != null) {
          aboutResponseModel = value;
          emit(AboutLoadedState());
        } else {
          emit(AboutErrorState());
        }
      },
    );
  }

  Future<void> showTerms(ShowTerms event, Emitter<ProfileState> emit) async {
    emit(TermsLoadingState());
    //api
    await ProfileRepo.showTermsRepo().then(
      (value) {
        if (value != null) {
          showTermsResponseModel = value;
          emit(TermsLoadedState());
        } else {
          emit(TermsErrorState());
        }
      },
    );
  }

  //faqs
  Future<void> showFaqs(ShowFaqs event, Emitter<ProfileState> emit) async {
    emit(FaqsLoadingState());
    //api
    await ProfileRepo.showFaqsRepo().then(
      (value) {
        if (value != null) {
          showFaqsResponseModels = value;
          emit(FaqsLoadedState());
        } else {
          emit(FaqsErrorState());
        }
      },
    );
  }

  Future<void> showSuggestion(
      SuggestionsAndComplaintsEvent event, Emitter<ProfileState> emit) async {
    emit(SuggestionAndComplaintsLoadingState());
    //api
    await ProfileRepo.showSuggestionRepo(event.params).then(
      (value) {
        if (value == true) {
          emit(SuggestionAndComplaintsLoadedState());
        } else {
          emit(SuggestionAndComplaintsErrorState());
        }
      },
    );
  }

  Future<void> logout(Logout event, Emitter<ProfileState> emit) async {
    emit(LogOutLoadingState());
    //api
    await ProfileRepo.logoutRepo().then(
      (value) {
        if (value == true) {
          emit(LogOutLoadedState());
        }
      },
    );
  }
}
