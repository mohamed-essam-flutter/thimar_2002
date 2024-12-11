import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:t7mara/core/constants/constant.dart';
import 'package:t7mara/core/services/dio.dart';
import 'package:t7mara/core/services/local_storage_application.dart';
import 'package:t7mara/feature/cart/data/models/response/show_cart_response_models/show_cart_response_models.dart';
import 'package:t7mara/main.dart';

class CartRepo {
  //show cart
  static Future<ShowCartResponseModels?> showCartRepo() async {
    try {
      var response = await DioProvider.getData(
          endPoint: AppConstant.showCart,
          header: {
            'Authorization':
                'Bearer ${LocalStorage.getData(key: LocalStorage.token)}'
          });
      if (response.statusCode == 200) {
        return ShowCartResponseModels.fromJson(response.data);
      } else {
        return null;
      }
    } on DioException catch (e) {
      log(e.message.toString());
      log(e.response!.data['message']);
      ScaffoldMessenger.of(navigatorKey.currentContext!)
          .showSnackBar(SnackBar(content: Text(e.response!.data['message'])));
    }
    return null;
  }

  //store product in cart
  static Future<bool?> storeProductRepo(String id, String amount) async {
    try {
      var response = await DioProvider.post(
          endPoint: AppConstant.showCart,
          data: {
            "product_id": id,
            "amount": amount
          },
          header: {
            'Authorization':
                'Bearer ${LocalStorage.getData(key: LocalStorage.token)}'
          });
      if (response.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } on DioException catch (e) {
      log(e.message.toString());
      log(e.response!.data['message']);
      ScaffoldMessenger.of(navigatorKey.currentContext!)
          .showSnackBar(SnackBar(content: Text(e.response!.data['message'])));
    }
    return false;
  }

  //delete from cart
  static Future<bool?> deleteFromCartRepo(int id) async {
    try {
      var response = await DioProvider.delete(
          endPoint: '/client/cart/delete_item/$id',
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
      log(e.message.toString());
      log(e.response!.data['message']);
      ScaffoldMessenger.of(navigatorKey.currentContext!)
          .showSnackBar(SnackBar(content: Text(e.response!.data['message'])));
    }
    return false;
  }

  //update cart product quantity

  static Future<bool?> updateCartRepo({required int id,required String amount}) async {
    try {
      var response = await DioProvider.put(
          endPoint: '/client/cart/$id',
          data: {
            "amount": amount
          },
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
      log(e.message.toString());
      log(e.response!.data['message']);
      ScaffoldMessenger.of(navigatorKey.currentContext!)
          .showSnackBar(SnackBar(content: Text(e.response!.data['message'])));
    }
    return false;
  }
}
