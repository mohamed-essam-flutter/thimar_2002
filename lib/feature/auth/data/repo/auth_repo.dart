import 'dart:async';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:t7mara/core/constants/constant.dart';
import 'package:t7mara/core/services/dio.dart';
import 'package:t7mara/feature/auth/data/models/request/login_params.dart';
import 'package:t7mara/feature/auth/data/models/request/register_params.dart';
import 'package:t7mara/feature/auth/data/models/response/register_response_model/register_response_model.dart';
import 'package:t7mara/main.dart';

// AIzaSyBbThTSiHOmGSXToedFpLZi09JZ9W-72n8
class AuthRepo {
  //register
  static Future<RegisterResponseModel?> registerRepo(
      RegisterParams params) async {
    try {
      var response = await DioProvider.post(
          endPoint: AppConstant.register, data: params.toJson());
      print(response.data);
      if (response.statusCode == 200) {
        return RegisterResponseModel.fromJson(response.data);
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
    }
    return null;
  }

  //login
  static Future<RegisterResponseModel?> loginRepo(LoginParams params) async {
    try {
      var response = await DioProvider.post(
          endPoint: AppConstant.login, data: params.toJson());
      print(response.data);
      if (response.statusCode == 200) {
        return RegisterResponseModel.fromJson(response.data);
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
    }
    return null;
  }

  //forgot password
  static Future<bool?> forgotPasswordRepo(String phone) async {
    try {
      var response = await DioProvider.post(
          endPoint: AppConstant.forgotPassword, data: {"phone": phone});
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } on DioException catch (e) {
      ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
          SnackBar(content: Text('${e.response!.data['message']}')));
    }
    return false;
  }

  //cheek code
  static Future<bool?> checkCodeRepo(String phone, String code) async {
    try {
      var response = await DioProvider.post(
          endPoint: AppConstant.checkCode,
          data: {"phone": phone, "code": code});
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } on DioException catch (e) {
      ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
          SnackBar(content: Text('${e.response!.data['message']}')));
    }
    return false;
  }
}
