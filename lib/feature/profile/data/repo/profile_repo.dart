import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:t7mara/core/constants/constant.dart';
import 'package:t7mara/core/services/dio.dart';
import 'package:t7mara/core/services/local_storage_application.dart';
import 'package:t7mara/feature/profile/data/model/request/suggestions_params.dart';
import 'package:t7mara/feature/profile/data/model/response/about_response_model/about_response_model.dart';
import 'package:t7mara/feature/profile/data/model/response/show_faqs_response_models/show_faqs_response_models.dart';
import 'package:t7mara/feature/profile/data/model/response/show_policy_response_models/show_policy_response_models.dart';
import 'package:t7mara/feature/profile/data/model/response/show_profile_response_models/show_profile_response_models.dart';
import 'package:t7mara/feature/profile/data/model/response/show_terms_response_model/show_terms_response_model.dart';
import 'package:t7mara/main.dart';

class ProfileRepo {
  static Future<ShowProfileResponseModels?> showProfileRepo() async {
    try {
      var response = await DioProvider.getData(
          endPoint: AppConstant.showProfile,
          header: {
            'Authorization':
                'Bearer ${LocalStorage.getData(key: LocalStorage.token)}'
          });
      if (response.statusCode == 200) {
        return ShowProfileResponseModels.fromJson(response.data);
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
    }
    return null;
  }

  //policy
  static Future<ShowPolicyResponseModels?> showPolicyRepo() async {
    try {
      var response = await DioProvider.getData(
          endPoint: AppConstant.showPolicy,
          header: {
            'Authorization':
                'Bearer ${LocalStorage.getData(key: LocalStorage.token)}'
          });
      if (response.statusCode == 200) {
        return ShowPolicyResponseModels.fromJson(response.data);
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
    }
    return null;
  }

  //about
  static Future<AboutResponseModel?> showAboutRepo() async {
    try {
      var response = await DioProvider.getData(
          endPoint: AppConstant.showAbout,
          header: {
            'Authorization':
                'Bearer ${LocalStorage.getData(key: LocalStorage.token)}'
          });
      if (response.statusCode == 200) {
        return AboutResponseModel.fromJson(response.data);
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
    }
    return null;
  }

  //terms
  static Future<ShowTermsResponseModel?> showTermsRepo() async {
    try {
      var response = await DioProvider.getData(
          endPoint: AppConstant.showTerms,
          header: {
            'Authorization':
                'Bearer ${LocalStorage.getData(key: LocalStorage.token)}'
          });
      if (response.statusCode == 200) {
        return ShowTermsResponseModel.fromJson(response.data);
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
    }
    return null;
  }

  //faqs
  static Future<ShowFaqsResponseModels?> showFaqsRepo() async {
    try {
      var response = await DioProvider.getData(
          endPoint: AppConstant.showFaqs,
          header: {
            'Authorization':
                'Bearer ${LocalStorage.getData(key: LocalStorage.token)}'
          });
      if (response.statusCode == 200) {
        return ShowFaqsResponseModels.fromJson(response.data);
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
    }
    return null;
  }

  static Future<bool?> showSuggestionRepo(SuggestionsParams params) async {
    try {
      var response = await DioProvider.post(
          data: params.toJson(),
          endPoint: AppConstant.suggestionsAndComplaints,
          header: {
            'Authorization':
                'Bearer ${LocalStorage.getData(key: LocalStorage.token)}'
          });
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } on DioException catch (e) {
      log(e.response!.data.toString());
      log(e.response!.data?['message'] ?? "");
      ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
          SnackBar(content: Text(e.response!.data?['message'] ?? "")));
    }
    return false;
  }

  static Future<bool?> logoutRepo() async {
    try {
      var response = await DioProvider.post(
          endPoint: AppConstant.logout,
          header: {
            'Authorization':
                'Bearer ${LocalStorage.getData(key: LocalStorage.token)}'
          });
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } on DioException catch (e) {
      log(e.response!.data?['message'] ?? "");
      ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
          SnackBar(content: Text(e.response!.data?['message'] ?? "")));
    }
    return false;
  }
}
