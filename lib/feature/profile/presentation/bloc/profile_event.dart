import 'package:t7mara/feature/profile/data/model/request/suggestions_params.dart';

class ProfileEvent {}

class ShowProfile extends ProfileEvent {}

class ShowPolicy extends ProfileEvent {}

class ShowAbout extends ProfileEvent {}

class ShowTerms extends ProfileEvent {}

class ShowFaqs extends ProfileEvent {}

class SuggestionsAndComplaintsEvent extends ProfileEvent {
  final SuggestionsParams params;

  SuggestionsAndComplaintsEvent({required this.params});
}

class Logout extends ProfileEvent {}
